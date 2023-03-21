
inputs = c('W990_B2022.13909I_v1 : F-TKRYGSRW',
                'W1073b_Pool1_B2022.16857_v1 : F-TKATRGAT',
                'W1587_B2022.24795_v1 : M-YKRCGCAW')

outputs = list(one = list(snp = "F-TKRYGSRW",
                          id = 'W990',
                          nummer = 'B2022.13909'),
               two = list(snp = "F-TKATRGAT",
                          id = 'W1073',
                          nummer = 'B2022.16857'),
               three = list(snp = "M-YKRCGCAW",
                    id = 'W1587',
                    nummer = 'B2022.24795'))


#lapply(inputs,element_extracts)


for(i in seq_along(inputs)){
testthat::test_that("Info extract works works", {
  testthat::expect_equal(element_extracts(inputs[i]), outputs[[i]])
  })
}
