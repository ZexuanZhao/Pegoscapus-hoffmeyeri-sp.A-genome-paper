import pandas as pd
import os
import random
import subprocess


sample_sheet = pd.read_csv("./sample_sheet.csv", names = ["sample", "R1", "R2"],
                           index_col= "sample")
n_reads_cov1 = round(500000000/150)
folds = [5,10,15,20]
out_dir = os.path.abspath(os.path.join("..", "..", "experiments", "sample_reads"))
if not os.path.exists(out_dir):
    os.mkdir(out_dir)

for sample in sample_sheet.index:
    R1_in = os.path.abspath(sample_sheet.loc[sample, "R1"])
    R2_in = os.path.abspath(sample_sheet.loc[sample, "R2"])
    for fold in folds:
        seed = random.randint(1,100)
        n_reads = n_reads_cov1*fold
        R1_out = os.path.join(out_dir, "{sam}_f{fo}_R1.fastq".format(sam = sample,
                                                                        fo = fold))
        R2_out = os.path.join(out_dir, "{sam}_f{fo}_R2.fastq".format(sam = sample,
                                                                        fo = fold))
        cmd_R1 = "seqtk sample -s{sd} {in_read1} {n} > {out_read1}".format(sd = seed,
                                                                           in_read1 = R1_in,
                                                                           n = n_reads,
                                                                           out_read1 = R1_out)
        cmd_R2 = "seqtk sample -s{sd} {in_read1} {n} > {out_read1}".format(sd=seed,
                                                                           in_read1=R2_in,
                                                                           n = n_reads,
                                                                           out_read1=R2_out)
        print(cmd_R1)
        subprocess.run(cmd_R1, shell = True)
        print(cmd_R2)
        subprocess.run(cmd_R2, shell = True)
