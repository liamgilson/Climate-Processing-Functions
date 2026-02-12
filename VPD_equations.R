################################################################################
# VPD Calculations using ClimateNA Outputs 
# Liam Gilson, February 2026

####
# Equations from:
# Allen, Richard G., Pereira, Luis S., Raes, Dirk and Martin Smith. 1998.
# Crop evapotranspiration - Guidelines for computing crop water requirements
# FAO Irrigation and Drainage Paper 56
# Food and Agriculture Organization of the United Nations, Rome.
####


#### Base equation: ####
# temperature- in C
# relative_humidity in percent
# output- VPD in KPa
# (0.61078*exp(17.2694*temperature/(temperature+237.3)))*(1-(relative_humidity/100))


#### Climate Data
# All monthly and seasonal variables preferred
clim<-read.csv(file="CNAoutput.csv",header=T)
# many different ways to calculate, e.g.,:
# "summer maximum"
clim$VPD_max_sm <- (0.61078*exp(17.2694*clim$Tmax_sm/(clim$Tmax_sm+237.3)))*(1-(clim$RH_sm/100))
# "summer average"
clim$VPD_ave_sm <- (0.61078*exp(17.2694*clim$Tave_sm/(clim$Tave_sm+237.3)))*(1-(clim$RH_sm/100))

# etc.
