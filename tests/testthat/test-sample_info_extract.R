inputs = c('./inputs/sampleID1.txt', './inputs/sampleID2.txt', './inputs/sampleID3.txt')

#dplyr::bind_rows(lapply(inputs, sample_info_extract))
outputs = data.frame(PCR.ID = c("W116","W1607","W1683"),
                     Nummer = c("B2022.1990","B2022.25018","B2022.26440"),
                     sample_SNP = c("M-CTRYRSGT","N/A","M-?GR?RGAW"),
                     orig = c('W116_B2022.1990_v1 : M-CTRYRSGT','W1607_B2022.25018_v2 : N/A','W1683_WH_B2022.26440_v1 : M-?GR?RGAW'))

## Splitting data.frame into single samples
outputs = dplyr::group_by(outputs, PCR.ID) 
outputs = dplyr::group_split(outputs)
outputs = lapply(outputs, as.data.frame)

# 
for(i in seq_along(inputs)){
  testthat::test_that("Info extract works works", {
    testthat::expect_equal(sample_info_extract(inputs[i]), outputs[[i]])
  })
}
