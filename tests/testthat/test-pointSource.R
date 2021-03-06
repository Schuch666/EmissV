context("pointSource")

test_that("pontual esmission works", {
  expect_equal(ncol(plumeRise(setNames(data.frame(matrix(c(150,1,20,420,3.11,273.15 + 3.16,200,-34.86,3.11,0.33,0.001,
                                                           150,1,20,420,3.81,273.15 + 4.69,300,-34.83,3.81,0.40,0.001,
                                                           150,1,20,420,3.23,273.15 + 5.53,400,-24.43,3.23,0.48,0.001,
                                                           150,1,20,420,3.47,273.15 + 6.41,500,-15.15,3.48,0.52,0.001,
                                                           150,1,20,420,3.37,273.15 + 6.35,600, -8.85,3.37,2.30,0.001,
                                                           150,1,20,420,3.69,273.15 + 5.93,800,-10.08,3.69,2.80,0.001,
                                                           150,1,20,420,3.59,273.15 + 6.08,800, -7.23,3.49,1.57,0.001,
                                                           150,1,20,420,4.14,273.15 + 6.53,900,-28.12,4.14,0.97,0.001),
                                                         ncol = 11, byrow = TRUE),
                                                  row.names = c("08:00","09:00",paste(10:15,":00",sep=""))),
                                       c("z","r","Ve","Te","ws","Temp","h","L","Ustar","Wstar","dtdz")),Hmax = TRUE)),
               ncol(plumeRise(setNames(data.frame(matrix(c(150,1,20,420,0.11,273.15 + 3.16,200,1,3.11,0.33,1,
                                                           150,1,20,420,3.11,273.15 + 3.16,200,1,3.11,0.33,0.011,
                                                           150,1,20,420,3.81,273.15 + 4.69,200,209,3.81,0.40,2),
                                                         ncol = 11, byrow = TRUE),
                                                  row.names = c("05:00","06:00","19:00")),
                                       c("z","r","Ve","Te","ws","Temp","h","L","Ustar","Wstar","dtdz")),Hmax = F,
                              imax = 1))
  )

  expect_equal(sum(raster::cellStats(pointSource(data.frame(lat      = c(-23.55,-23.61,-23.50),
                                                            lon      = c(-45.00,-45,-45  ),
                                                            z        = c(100  ,  1000,  666  ),
                                                            emission = c(666,444,111  ) ),
                                             gridInfo("vertical.nc",z=T)),"sum")),
               raster::cellStats(pointSource(data.frame(lat      = c(-22,-22,-23.5),
                                                        lon      = c(-46,-48,-47  ),
                                                        z        = c(0  ,  0,  0  ),
                                                        emission = c(666,444,111  ) ),
                                             gridInfo(paste(system.file("extdata", package = "EmissV"),
                                                            "/wrfinput_d01",sep=""))),"sum"))
})
