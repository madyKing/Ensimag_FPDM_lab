# 2) PGMs
#2.1) Simulated data
offset  <- 0
nb_sample <- 40
library(bnlearn)
set.seed(123)
# Creating the model
graph.model <- model2network("[X1][X2][X3|X1][X4|X3][X5|X2][X6|X1:X2:X3]")
# plot to verify
plot(graph.model)

# Simulate gaussian with linear regression model
X1.list <- list(coef = c("(Intercept)"=0), sd = 1)
X2.list <- list(coef = c("(Intercept)"=0), sd = 1)
X3.list <- list(coef = c("(Intercept)"=0, X1=-1), sd = 1)
X4.list <- list(coef = c("(Intercept)"=0, X3=-2), sd = 1)
X5.list <- list(coef = c("(Intercept)"=0, X2=-1), sd = 1)
X6.list <- list(coef = c("(Intercept)"=0, X1=1, X2=-1, X3=2), sd = 1)

nodes.list <- list(X1=X1.list, X2=X2.list, X3=X3.list, X4=X4.list, X5=X5.list, X6=X6.list)
bn <- custom.fit(graph.model, nodes.list)
set.seed(123)
data <- rbn(bn, n=100)
head(data)

# gs procedure
bn.gs <- gs(data, test = "cor")

# hc procedure
bn.hc <- hc(data, score = "bge")

old.par <- par(mfrow=c(1, 2)) #to plot in two columns
plot(bn.gs, main="gs proc")
plot(bn.hc, main="hc proc")
par(old.par)                  #reset the par option

# Comments
############ n = 40 ##############################
# With small sample, gs gives BS, it does not behave as expected
# because it does eliminate some relations like x2 ---> X6 and it created
# an undirected graph
# Whereas hc keeps the underlying structure of the graph by adding a new relation
# between X2 and X4

############ n = 100  ###############################
# With sufficient sample size, gs gives an equivalent PDAG of the 
# initial graph.
# Whereas hc gives exactly the same structure as the initial graph