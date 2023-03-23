## Script to aggregate sample ID info
library(optparse)
library(sampleID)
source('establish_con.R')
source('filepaths.R')
#####  filepath

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="sampleID.txt filepath", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)
filepath = opt$file

sampleID = readLines(filepath)
sampleID = sample_info_extract(sampleID)

## Assign PathoID from ActList
sampleID$PatientIDPathowin = assignPathowinID(sampleID$PCR.ID, activitylisttable = ACTLISTTABLE)


### ID TABLE
idtable = readr::read_tsv(SAMPLEIDPATH)
idtable = dplyr::distinct(idtable)
idtable$PatientIDPathowin = as.character(idtable$PatientIDPathowin)

## check tables
df = rowbind_tables(sampleID, idtable)
write_out_result(df, filepath)

sampleID = dplyr::select(sampleID, 1, sample_SNP, Nummer, orig, PatientIDPathowin)

# Quickfix
if(file.exists(SAMPLEIDPATH)){
  readr::write_tsv(sampleID, SAMPLEIDPATH, append = TRUE)
}else{
  readr::write_tsv(sampleID, SAMPLEIDPATH, append = TRUE, col_names = TRUE)
}
