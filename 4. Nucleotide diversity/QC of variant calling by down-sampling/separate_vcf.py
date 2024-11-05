import os
import glob
import subprocess
import re

sample = "W6"
files = glob.glob(os.path.join("..", "..", "experiments", sample,
                               sample + "_f*" + "_filtered.vcf"))
print(files)

for file in files:
    samples = subprocess.getoutput(['bcftools query -l ' + file]).splitlines()
    for sample in samples:
        sample_name = re.findall("W[\w]+\.[\d]+", sample)[0]
        sample_fold = re.findall("f[\d]+", sample)[0].strip("f")
        out_dir = os.path.join("..", "..", "experiments", "comparison", "data", sample_name)
        if not os.path.exists(out_dir):
            os.mkdir(out_dir)
        out_vcf_name = sample_name + "_" + "f" + sample_fold + ".vcf.gz"
        out_vcf_full_name = os.path.join(out_dir, out_vcf_name)
        cmd = f"bcftools view -c1 -Oz -s {sample} -o {out_vcf_full_name} {file}"
        print(cmd)

        subprocess.run(cmd, shell=True)