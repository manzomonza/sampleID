acttable = readr::read_tsv('./inputs/PathoIDtable.tsv')


inputs  =  c("Y886","W3909","Z1492")
outputs = c("983188","979358","924663")



for(i in seq_along(inputs)){
  testthat::test_that("IDs get extract correctly", {
    testthat::expect_equal(assignPathowinID(inputs[[i]], acttable), outputs[[i]])
  })
}
