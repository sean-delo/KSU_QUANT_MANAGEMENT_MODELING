# How many AEDs should be produced in each plant,
# and how should they be distributed to each of the three wholesaler warehouses so as to minimize
# the combined cost of production and shipping?

#       Unit Shipping Cost          Unit                Monthly
#           W1    W2    W3          Production Cost     Production Capacity
# -------------------------------------------------------------------------
# P-A       $22   $14   $30         $600                100
# P-B       $16   $20   $24         $625                120
# M Demand  80    60    70

library(lpSolve)
install.packages(lpsolveAPI)
library(lpSolveapi)


library(lpSolveAPI)
x <- read.lp("PT_Transportation.lp")
x


solve(x)
get.objective(x)
get.variables(x)
get.constraints(x)
get.sensitivity.objex(x)
get.sensitivity.rhs(x)
