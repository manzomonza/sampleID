## Script to aggregate sample ID info


sample_ID_extract = function(sampleIDpath){
  sampleid = readLines(sampleIDpath)
  if(!identical(sampleid, character(0))){
    sampleid = strsplit(sampleid, split = " ")[[1]]
  sampleid = data.frame(PCR_B = sampleid[1],sample_SNP = sampleid[3])
  sampleid$PCR_B = pcrB_parse(sampleid$PCR_B)
  sampleid = tidyr::separate(sampleid, col = PCR_B, into = c("PCR_ID","biopsy_ID"), sep = "_")
  return(sampleid)
  }
}

pcrB_parse = function(pcrB_string){
  if(grepl("_v1$",pcrB_string)){
    pcrB_string = gsub("_v1$",'',pcrB_string)
  }
  return(pcrB_string)
}



##### 
library(optparse)
option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL,
              help="sampleID.txt filepath", metavar="character"))

opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser)

sampleID=sample_ID_extract(opt$file)
readr::write_tsv(sampleID,"SampleID_table.tsv", append = TRUE)


