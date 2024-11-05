# Set genome file
genome=

# 1. find simple repeats enriched at the end of sequences
tidk explore --minimum 5 --maximum 12 $genome > tidk_explore.tsv

# 2. Select candidate repeats
sed 1,1d tidk_explore.tsv | cut -f1 > candidate_telomere.tsv

# 3. Calculate occurances of candidate repeats along the genome
# and visualize the occurances
while read -r candidate ; do
    tidk search \
	    --string $candidate \
	    --output $candidate \
	    --dir ./ \
	    --extension tsv \
	    $genome
    tidk plot \
	    --tsv ${candidate}_telomeric_repeat_windows.tsv \
	    -o $candidate
done < candidate_telomere.tsv

# 4. Manual inspection:
# High confidence telomeric repeats should be enriched SOLELY at the end of sequences
