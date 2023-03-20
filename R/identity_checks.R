## identity check

snp_check = function(current_sample, idtable){
  snp_and_ID = subset(idtable, sample_SNP == current_sample$sample_SNP)
  return(snp_and_ID)
}

id_check = function(current_sample, idtable){
  id_seenbefore = current_sample$PatientIDPathowin %in% idtable$PatientIDPathowin
  return(id_seenbefore)
}

# number_check = function(current_sample, idtable){
#   bnummer_seenbefore = current_sample$Nummer %in% idtable$Nummer
#   return(bnummer_seenbefore)
# }


identity_check = function(current_sample, idtable){
  id_res = id_check(current_sample, idtable)
  snp_res = snp_check(current_sample, idtable)
  
  if(id_res)
  
}



