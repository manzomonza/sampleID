inputs  =  c("Y886","W3909","Z1492")
outputs = c("983188","979358","924663")

acttable = data.frame('PCR ID' = c("Z1492", "W3909", 'Y886'),
                     Nummer = c('B2020.25775', 'B2022.56429', 'B2023.11399'),
                     PatientIDPathowin = c('924663', '979358','983188'))

acttable = dplyr::rename(acttable, `PCR ID` = PCR.ID)

for(i in seq_along(inputs)){
  testthat::test_that("IDs get extract correctly", {
    testthat::expect_equal(assignPathowinID(inputs[[i]], acttable), outputs[[i]])
  })
}
