inputs = c("F-TKAYRSRT ","F-TKRYRCRW","F-YKGYRGAA")
## Splitting data.frame into single samples
outputs = c(FALSE, TRUE, TRUE)



sampleID_path = "./inputs/SampleID_table.tsv"
# sampleID_path = "/mnt/NGS_Diagnostik/sample_ID/SampleID_table.tsv"

idtable = readr::read_tsv(sampleID_path)
idtable = dplyr::distinct(idtable)


for(i in seq_along(inputs)){
  testthat::test_that("Info extract works works", {
    testthat::expect_equal(snp_check(inputs[[i]], idtable), outputs[[i]])
  })
}
       