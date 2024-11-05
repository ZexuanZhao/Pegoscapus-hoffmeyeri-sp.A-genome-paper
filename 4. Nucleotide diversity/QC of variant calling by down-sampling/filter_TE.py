import os
import glob
import subprocess

sample = ""
TE_annot = ""
out_dir = ""

folds = [5, 10, 15]
files = glob.glob(os.path.join("..", "..", "experiments", sample,
                               sample + "_f*" + ".vcf.gz"))

for f in folds:
    input = os.path.join(out_dir, sample, sample + f"_f{f}" + ".vcf.gz")
    output = os.path.join(out_dir, sample, sample + f"_f{f}" + "_filtered" + ".vcf")
    cmd = f"bedtools intersect -a {input} -b {TE_annot} -header -v > {output}"
    subprocess.run(cmd, shell=True)
