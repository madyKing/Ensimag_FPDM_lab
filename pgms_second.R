data <- read.table("/home/mamady/Bureau/Cours 3A/FPDM/Labs/Returns250d.txt")
data <- data[, c("AIR.FRANCE.KLM","ALCATEL.LUCENT","AXA","FAURECIA","GAUMONT","GEODIS","PPR","UNION.FINC.FRANC.")]
# data[is.na(data)] <- 0
data <- na.omit(data)
library(bnlearn)
bn.gs <- gs(na.omit(data), test = "cor")
bn.hc <- hc(na.omit(data), score = "bge")

old.par <- par(mfrow=c(1, 2)) #to plot in two columns
plot(bn.gs, main="gs proc")
plot(bn.hc, main="hc proc")
par(old.par)                  #reset the par option

# Question 3.
# Comparing the plots, we can say that GEODIS is marginally independent of ALCATEL.LUCENT
# in the gs procedure but not in the hc procedure
ci.test(x = "GEODIS", y="ALCATEL.LUCENT", data = data)
# p < 0,01 : très forte présomption contre l'hypothèse nulle
# 0,01< p < 0,05 : forte présomption contre l'hypothèse nulle
# 0,05 < p < 0,1 : faible présomption contre l'hypothèse nulle
# p > 0,1 : pas de présomption contre l'hypothèse nulle

# The result of the test is:
# cor = 0.057367, df = 5035, p-value = 4.625e-05
# Since her the p-value < 0.01, we can reject our null hypothesis
# and affirm that, GEODIS is not marginally independent of ALCATEL.LUCENT

# Question 4.
# GEODIS is conditionnaly independent of PPR given ALCATEL.LUCENT (found by hc not by gs)
ci.test(x="GEODIS", y = "PPR", z = "ALCATEL.LUCENT", data = data)
# The result of the test is :
# cor = 0.034622, df = 5034, p-value = 0.01401
# Here the p-value is between 0.01 and 0.05, so there is a big presumption against the null hypothesis

# Question 5.
# They both found that GAUMONT is conditionnaly independent of AXA given FAURECIA
ci.test(x = "AXA", y = "GAUMONT", z = "FAURECIA", data = data)
# The result of the test is :
# cor = 0.058341, df = 5034, p-value = 3.433e-05
# Like in the 3rd question, there is a very big presumption against the null hypothesis
# so we can reject the conditional independence hypothesis