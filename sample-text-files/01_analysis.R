library(dplyr)
library(data.table)

# Import the annotations per equivalance class; these are from the .fasta file headers manually reannotated
annotations <- fread("../reference/pan_virus_annotation_plain.tsv", header = TRUE, fill = TRUE)
annotations

# Remove these EC
rm_ec <- c(285, 404, 719 )

# Look to see when the EQ have multiple genes... verify the first 723 are unique
fread("../reference/matrix.ec.txt", header = FALSE)[720:727]

fread("data/vdj_v1_hs_pbmc2_5gex_pan.kb.txt") %>%
  filter(V3 < 723) %>%
  filter(!(V3 %in% rm_ec))

