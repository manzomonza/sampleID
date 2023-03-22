#' Use connection to 'activity list' to extract 
#'
#' @param current_sample 
#' @param LUT 
#'
#' @return
#' @export
#'
#' @examples
assignPathowinID = function(current_PCRID, activitylisttable){
  PathowinID = subset(activitylisttable, `PCR ID` %in% current_PCRID)
  PathowinID = as.character(PathowinID$PatientIDPathowin)
  return(PathowinID)
}
