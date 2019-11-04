
#   Factor    P1    P2    P3      Goal    Units         penalty
#   Profit    20    15    25      Max     Millions/$       1
#   Emp Lev    6     4     5      = 50    employees       -6
#   Earnings   8     7     5      >= 75   Millions/$      -3


#   20x1 + 15x2 + 25x3 >= 75
#    6x1 +  4x2 +  5x3  = 50
#    8x1 +  7x2 +  5x3 >= 75 


# minimize Z =    1(maximize profit)
#               + 6(employee level)
#               + 3(earnings goal)

# y1 =  20x1 + 15x2 + 25x3 - 75
# y2 =   6x1 +  4x2 +  5x3 - 50
# y3 =   8x1 +  7x2 +  5x3 - 75 

# y1 = y1+ -- y1- , where y1+ >= 0, y1- >= 0
# y2 = y2+ -- y2- , where y2+ >= 0, y2- >= 0
# y3 = y3+ -- y3- , where y3+ >= 0, y3- >= 0

# auxiliary variables

# yj+ = {yj     if yj >= 0 , 0 othermise;}
# yj- = {|yj|   if yj <= 0 , 0 othermise;}


library(lpSolveAPI)

gp <- read.lp("810831824_8.lp" , type=c("lp", "mps", "freemps"))
gp <- read.lp("810831824_8.lp")
gp

solve(gp)
get.objective(gp)
get.variables(gp)

