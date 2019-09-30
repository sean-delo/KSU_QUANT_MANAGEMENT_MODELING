# *******************************************************
# P = [1 , 2 , 3] (3 Different Plants)
# S = [1 , 2 , 3] (Size of Product: Large, Medium, Small)
# ss = subscript
# *******************************************************
#
# Maximize P  = 420Xss(ll) + 360Xss(12) + 300Xss(13) + 420Xss(21) + 360Xss(22) + 300Xss(23) + 420Xss(31) + 360Xss(32) + 300Xss(33)
# Subject to:
# Supply
#   Xss(11) + Xss(12) + Xss(13) <= 750
#   Xss(21) + Xss(22) + Xss(23) <= 900
#   Xss(31) + Xss(32) + Xss(33) <= 450
# Demand
#   Xss(11) + Xss(21) + Xss(31) <=  900
#   Xss(12) + Xss(22) + Xss(32) <= 1200
#   Xss(13) + Xss(23) + Xss(33) <=  750 
# Available Space
#   20Xss(11) + 15Xss(12) + 12Xss(13) <= 13000
#   20Xss(21) + 15Xss(22) + 12Xss(23) <= 12000
#   20Xss(31) + 15Xss(32) + 12Xss(33) <=  5000
# Avoid Layoffs
#   900Xss(ll) + 900Xss(12) + 900Xss(13) - 750Xss(21) - 750Xss(22) - 750Xss(23) = 0
#   450Xss(ll) + 450Xss(12) + 450Xss(13) - 750Xss(31) - 750Xss(32) - 750Xss(33) = 0
#
#   Xss(PS) >+ 0 for all P,S (Plant , Size)
#
# *******************************************************

f.obj <- c(420, 360, 300 , 420 , 360 , 300 , 420 , 360 , 300)
f.con <- matrix (c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 20 , 15 , 12 , 20 , 15 , 12 , 20, 15, 12), nrow=9, byrow=TRUE)
f.dir <- c("<=", "<=" , "<=" , "<=" , "<=", "<=", "<=", "<=", "<=")
f.rhs <- c(750, 900 , 450 , 900 , 1200 , 750 , 13000 , 12000 , 5000)

f.con

lp ("max", f.obj, f.con, f.dir, f.rhs)
lp ("max", f.obj, f.con, f.dir, f.rhs)$solution
