#' Checks if SNP has been observed before and returns sampleID table entry or entries that match.
#'
#' @param current_sample 
#' @param idtable 
#'
#' @return
#' @export
#'
#' @examples
snp_check = function(sample_SNP, idtable){
  snp_seen_before =  sample_SNP %in% idtable$sample_SNP
  return(snp_seen_before)
}

#' Checks if ID has been observed before in sampleID table
#'
#' @param current_sample 
#' @param idtable 
#'
#' @return
#' @export
#'
#' @examples
id_check = function(PatientIDPathowin, idtable){
  id_seenbefore = PatientIDPathowin %in% idtable$PatientIDPathowin
  return(id_seenbefore)
}


#' Combines functions call to SNP and PatID check and 
#'
#' @param current_sample 
#' @param idtable 
#'
#' @return
#' @export
#'
#' @examples
identity_check = function(current_sample, idtable){
  id_res = id_check(current_sample, idtable)
  snp_res = snp_check(current_sample, idtable)
}



