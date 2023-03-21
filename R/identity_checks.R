## identity check

#' Checks if SNP has been observed before and returns sampleID table entry or entries that match.
#'
#' @param current_sample 
#' @param idtable 
#'
#' @return
#' @export
#'
#' @examples
snp_check = function(current_sample, idtable){
  snp_and_ID = subset(idtable, sample_SNP == current_sample$sample_SNP)
  return(snp_and_ID)
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
id_check = function(current_sample, idtable){
  id_seenbefore = current_sample$PatientIDPathowin %in% idtable$PatientIDPathowin
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



