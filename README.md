# *Pegoscapus hoffmeyeri* sp. A genome paper

Analysis scripts and figure-generation code for our study of genome organization, nucleotide diversity, and gene evolution in the unusually large pericentric TE-rich regions of *Pegoscapus hoffmeyeri* sp. A.

## Publication

Zhao Z, Quinteros K, Machado CA. (2025). **Evolutionary Consequences of Unusually Large Pericentric TE-rich Regions in the Genome of a Neotropical Fig Wasp.** *Genome Biology and Evolution* 17(9): evaf158. https://doi.org/10.1093/gbe/evaf158

Please cite this paper when using these analyses.

## Repository contents

| Directory | Contents |
| --- | --- |
| [1. Genome assembly and quality assessment](1.%20Genome%20assembly%20and%20quality%20assessment/) | Genome visualization, telomeric repeat detection, and coverage/genotyping quality assessment |
| [2. Genome annotation](2.%20Genome%20annotation/) | TE composition and landscapes, intronic TEs, and Augustus annotation commands |
| [3. Classification of TE-dense regions](3.%20Classification%20of%20TE-dense%20regions/) | TE density calculation, distribution fitting, and two-state HMM classification |
| [4. Nucleotide diversity](4.%20Nucleotide%20diversity/) | All-sites VCF preparation, nucleotide diversity analyses, and downsampling-based variant-call assessment |
| [5. Gene features](5.%20Gene%20features/) | Gene structure, nucleotide composition, GC3, and other gene-feature analyses |
| [Figures and Tables](Figures%20and%20Tables/) | Main and supplementary figures and tables |
| [Utils](Utils/) | Shared plotting functions |

## Associated workflows

- [GPU-accelerated variant calling](https://github.com/ZexuanZhao/gpu-accelarated-variant-calling-pipeline): Illumina read mapping and multi-sample variant calling using Parabricks, DeepVariant, and GLnexus.
- [GeMoMa gene annotation and parameter selection](https://github.com/ZexuanZhao/GeMoMa_Gene_Annotation_and_Parameter_Selection): homology-based annotation and BUSCO evaluation across GAF score/aa thresholds.

## Data availability

- [PRJNA1196887](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1196887): PacBio HiFi reads and genome assembly.
- [PRJNA1198996](https://www.ncbi.nlm.nih.gov/bioproject/PRJNA1198996): Illumina short reads.

## Using the scripts

These are study-specific scripts and R Markdown notebooks. Set input/output paths and prepare the required data and intermediate files before running each analysis. See the associated workflow repositories for their setup and usage instructions.
