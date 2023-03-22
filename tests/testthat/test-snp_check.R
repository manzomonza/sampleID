inputs = c("F-TKAYRSRT ","F-TKRYRCRW","F-YKGYRGAA")
## Splitting data.frame into single samples
outputs = c(FALSE, TRUE, TRUE)


one = subset(idtable, sample_SNP %in% inputs )
idtable = data.frame(`PCR ID` = c("W653","W2027","E3175"),
                     sample_SNP = c("F-TKRYRCRW", "F-TKRYRCRW", "F-YKGYRGAA"))


for(i in seq_along(inputs)){
  testthat::test_that("Info extract works works", {
    testthat::expect_equal(snp_check(inputs[[i]], idtable), outputs[[i]])
  })
}
       