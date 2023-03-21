inputs = c('W990_B2022.13909I_v1 : ?-TKRYGSRW',
                'W1073b_Pool1_B2022.16857_v1 : N-TKATRGAT',
                'W1587_B2022.24795_v1 : M-YKRCGCAW')

outputs = list(one = list(snp = "?-TKRYGSRW",
                          id = 'W990',
                          nummer = 'B2022.13909'),
               two = list(snp = "N-TKATRGAT",
                          id = 'W1073',
                          nummer = 'B2022.16857'),
               three = list(snp = "M-YKRCGCAW",
                    id = 'W1587',
                    nummer = 'B2022.24795'))




for(i in seq_along(inputs)){
testthat::test_that("Info extract works works", {
  testthat::expect_equal(element_extracts(inputs[i]), outputs[[i]])
  })
}
