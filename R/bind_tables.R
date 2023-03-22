rowbind_tables = function(current_sample, idtable){
  current_sample$reference = 'current library'
  idtable$reference = 'in database'
  current_sample = dplyr::relocate(current_sample, orig, .after = last_col())
  idtable = dplyr::relocate(idtable, orig, .after = last_col())
  
  idtable$PatientIDPathowin = as.character(idtable$PatientIDPathowin)
  idtable = dplyr::rename(idtable, PCR.ID = `PCR ID`)
  
  if(current_sample$sample_SNP == "N/A"){
    return(current_sample)
  }
  
  ## Boolean tests
  id_res = id_check(current_sample$PatientIDPathowin, idtable)
  snp_res = snp_check(current_sample$sample_SNP, idtable)
  
  if(id_res & snp_res){
    ID = subset(idtable, PatientIDPathowin == current_sample$PatientIDPathowin)
    snp = subset(idtable, sample_SNP == current_sample$sample_SNP)
    snp_and_ID = dplyr::bind_rows(current_sample, snp,ID)
    snp_and_ID = dplyr::distinct(snp_and_ID)
    return(snp_and_ID)
    }else if(id_res){
      ID = subset(idtable, PatientIDPathowin == current_sample$PatientIDPathowin)
      snp_and_ID = dplyr::bind_rows(current_sample,ID)
      return(snp_and_ID)
    }else if(snp_res){
      snp = subset(idtable, sample_SNP == current_sample$sample_SNP)
      snp_and_ID = dplyr::bind_rows(current_sample, snp)
      return(snp_and_ID)
    }else{
      return(current_sample)
    }
}

sampleID = sample_info_extract('./inputs/sampleID3.txt')
sampleID$PatientIDPathowin = assignPathowinID(sampleID$PCR.ID, activitylisttable = acttable)

rowbind_tables(sampleID, idtable)




