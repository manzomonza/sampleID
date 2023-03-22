## Script to aggregate sample ID info

source('establish_con.R')
#dbDisconnect(con)


##### 
library(optparse)

option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="sampleID.txt filepath", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)
filepath = opt$file

sampleID = sample_info_extract(filepath)

## Assign PathoID from ActList
sampleID$PatientIDPathowin = assignPathowinID(sampleID$PCR.ID, activitylisttable = ACTLISTTABLE)


### Check if sampleSNP with that PatientID is already present

sampleID = sample_info_extract('./inputs/sampleID1.txt')
sampleID$PatientIDPathowin = assignPathowinID(sampleID$PCR.ID, activitylisttable = acttable)


sampleID_table_path = "./inputs/SampleID_table.tsv"
# sampleID_path = "/mnt/NGS_Diagnostik/sample_ID/SampleID_table.tsv"

idtable = readr::read_tsv(sampleID_path)
idtable = dplyr::distinct(idtable)
idtable$PatientIDPathowin = as.character(idtable$PatientIDPathowin)



# Quickfix
if(file.exists(sampleID_path)){
  readr::write_tsv(sampleID, sampleID_path, append = TRUE)
}else{
  readr::write_tsv(sampleID, sampleID_path, append = TRUE, col_names = TRUE)
}
