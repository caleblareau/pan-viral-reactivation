# pan-viral-reactivation
CL + LP analyses of viral reactivation using single-cell sequencing

## How to execute

For each scRNA-seq library, pseudoalign R1 and R2 to `pan_virus.idx` using the standard commands (these should be pretty stable; note that 8 threads are allocated in the `-t 8` step:

```
for i in ALLO_Sample34 ALLO_Sample38 ALLO_Sample97 ALLO_Sample98
do
R1="fastq/${i}_S1_L001_R1_001.fastq.gz"
R2="fastq/${i}_S1_L001_R2_001.fastq.gz"
kallisto bus -i pan-viral-reactivation/reference/pan_virus.idx -o "${i}_kb" -t 8 -x 10xv2 $R1 $R2
bustools sort -t 8 -o "${i}_kb/output_sorted.bus" "${i}_kb/output.bus" 
bustools text "${i}_kb/output_sorted.bus" -p > "${i}_pan.kb.txt"
done
```

Now, keep the `"${i}_pan.kb.txt"` file for downstream analysis in `R`, that will be contained in this repository. 


<br><br>
