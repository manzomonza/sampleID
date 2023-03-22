## establish connection

con_akt_list = function(){
  require(RMySQL)
  require(dplyr)
  con = dbConnect(MySQL(),
                  user = 'REPLACEIT',
                  password = "REPLACEIT",
                  dbname = "MolPathDB02",
                  host = 'meqmolpatlp01.uhbs.ch',
                  encoding = "latin1")
  return(con)
}

con = con_akt_list()
con_tbl = dplyr::tbl(con, "Aktivitaetsbericht_PCR_Tabelle_01")
con_tbl = dplyr::select(con_tbl, `PCR ID`, Nummer, PatientIDPathowin)
ACTLISTTABLE = dplyr::collect(con_tbl)