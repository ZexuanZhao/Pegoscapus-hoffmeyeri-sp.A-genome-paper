# 1. Convert homology based annotation in gff format to gb format
gff2gbSmallDNA.pl  annotation.gff genome.fasta 1000 annotation.gb

# 2. Split a validation set

randomSplit.pl annotation.gb 1000

# 3. Create a species

new_species.pl --species=species_name

# 4. Train a model

optimize_augustus.pl \
  --species=species_name \
  --UTR=off \
  --cpus=48 \
  --kfold=48 \
  annotation.gb.train \
  > train.log

etraining \
  --species=species_name \
  annotation.gb.train

# 5. Validate the trained model
augustus \
  --gff3=on \
  --species=species_name \
  annotation.gb.test \
  | tee test.log

# 6. Predict
augustus \
  --gff3=on \
  --species=species_name \
  genome.fasta \
  > predicted.gff

# 7. Extract protein sequences from predicted

agat_sp_extract_sequences.pl \
  --gff predicted.gff \
  -f genome.fasta \
  -p \
  -o predicted.faa
