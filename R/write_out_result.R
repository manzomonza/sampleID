#' Write out table to QC_SNP_PathowinPatientID.txt
#'
#' @param df 
#' @param filepath 
#'
#' @return
#' @export
#'
#' @examples
write_out_result = function(df, filepath){
  filedir = dirname(filepath)
  filename = paste0(filedir, '/QC_SNP_PathowinPatientID.txt')
  readr::write_tsv(df, filename)
}

