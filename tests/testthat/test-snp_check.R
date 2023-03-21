inputs = data.frame(PCR.ID = c("W116","W1607","W1683"),
                     Nummer = c("B2022.1990","B2022.25018","B2022.26440"),
                     sample_SNP = c("F-YKRYRSGA","N/A","M-?GR?RGAW"),
                     orig = c('W116_B2022.1990_v1 : M-CTRYRSGT','W1607_B2022.25018_v2 : N/A','W1683_WH_B2022.26440_v1 : M-?GR?RGAW'))

## Splitting data.frame into single samples
inputs = dplyr::group_by(inputs, PCR.ID) 
inputs = dplyr::group_split(inputs)
inputs = lapply(inputs, as.data.frame)


outputs = data.frame(PCR.ID = c("W116","W1607","W1683"),
                     Nummer = c("B2022.1990","B2022.25018","B2022.26440"),
                     sample_SNP = c("M-CTRYRSGT","N/A","M-?GR?RGAW"),
                     orig = c('W116_B2022.1990_v1 : M-CTRYRSGT','W1607_B2022.25018_v2 : N/A','W1683_WH_B2022.26440_v1 : M-?GR?RGAW'))

## Splitting data.frame into single samples
outputs = dplyr::group_by(outputs, PCR.ID) 
outputs = dplyr::group_split(outputs)
outputs = lapply(outputs, as.data.frame)




sampleID_path = "./inputs/SampleID_table.tsv"
# sampleID_path = "/mnt/NGS_Diagnostik/sample_ID/SampleID_table.tsv"

idtable = readr::read_tsv(sampleID_path)
idtable = dplyr::distinct(idtable)
idtable[1,]


idtable |>
  dplyr::count(sample_SNP, sort = TRUE)


snp_seen_before =  inputs[[i]]$sample_SNP %in% idtable$sample_SNP
snp_check(inputs[[2]], idtable)

for(i in seq_along(inputs)){
  testthat::test_that("Info extract works works", {
    testthat::expect_equal(snp_check(inputs[[i]], idtable), outputs[[i]])
  })
}
