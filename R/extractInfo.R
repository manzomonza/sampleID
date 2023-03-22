#' Reads in single line sampleID.txt file, applies element_extracts and generates dataframe 
#'
#' @param sampleIDpath 
#'
#' @return
#' @export
#'
#' @examples
sample_info_extract = function(orig){
  if(!identical(orig, character(0))){
    extracts = element_extracts(orig)
    sampledf = data.frame(`PCR ID` = extracts$id,
                          Nummer = extracts$nummer,
                          sample_SNP =extracts$snp ,
                          orig = orig)
    return(sampledf)
  }
}


#' Function to extract three strings of information from sampleID.txt
#'
#' @param origstring 
#'
#' @return
#' @export
#'
#' @examples
element_extracts = function(origstring){
  snp = stringr::str_extract(origstring, pattern ='(?<=: ).*')
  nummer = stringr::str_extract(origstring, pattern ='[A-Z]\\d{2,4}\\.\\d{1,5}')
  id = stringr::str_extract(origstring, pattern ='^[A-Z]+\\d{1,5}')
  return(list(snp = snp,
              id = id,
              nummer = nummer))
}



