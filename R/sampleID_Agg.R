## Script to aggregate sample ID info

source('establish_con.R')



identity_extracts("W094b_B2022.617_v1 : M-YTAYAGAW")


##### 
library(optparse)
option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="sampleID.txt filepath", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)
sampleID=sample_info_extract(opt$file)
sampleidnum = sampleID$Nummer
sampleidpcr= sampleID$`PCR ID`
sampleID = dplyr::left_join(sampleID, con_tbl, by = "PCR ID")
dbDisconnect(con)


### Check if sampleSNP with that PatientID is already present
sampleID_path = "SampleID_table.tsv"
# sampleID_path = "/mnt/NGS_Diagnostik/sample_ID/SampleID_table.tsv"

idtable = readr::read_tsv(sampleID_path)
idtable = dplyr::distinct(idtable)




# Quickfix
if(file.exists(sampleID_path)){
  readr::write_tsv(sampleID, sampleID_path, append = TRUE)
}else{
  readr::write_tsv(sampleID, sampleID_path, append = TRUE, col_names = TRUE)
}


