sample="W6M.4"

out_dir="../../experiments/comparison/$sample"
[ ! -d $out_dir ] && mkdir $out_dir

hap.py \
  -r "../../data/W2A_rescaffolded_final.fasta" \
  -o $out_dir/"f5_vs_f15" \
  "../../experiments/comparison/data/${sample}/${sample}_f15.vcf.gz" \
  "../../experiments/comparison/data/${sample}/${sample}_f5.vcf.gz"

hap.py \
  -r "../../data/W2A_rescaffolded_final.fasta" \
  -o $out_dir/"f10_vs_f15" \
  "../../experiments/comparison/data/${sample}/${sample}_f15.vcf.gz" \
  "../../experiments/comparison/data/${sample}/${sample}_f10.vcf.gz"