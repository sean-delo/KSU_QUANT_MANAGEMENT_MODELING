# Assignment 9 -- Sean Delahunty

# Consider the following activity-on-arc project network, where the 12 arcs (arrows) represent the
# 12 activities (tasks) that must be performed to complete the project and the network displays the
# order in which the activities need to be performed. The number next to each arc (arrow) is the
# time required for the corresponding activity. Consider the problem of finding the longest path
# (the largest total time) through this network from start (node 1) to finish (node 9), since the
# longest path is the critical path. 

# MAX:                5x12 + 3x13 + 4x24 + 3x35 + 2x25 + 1x46 + 6x57 + 2x58 + 4x47 + 5x69 + 4x79 + 7x89
#
# Subject to: 
#
# Starting node:  X12 + X13 = 1
#
# Intermediate:       X12 - X13 = 0             node 1
# nodes                    
# 
#   X12 - X25 - X24   = 0                       node 2
#   X13 - X35 = 0                               node 3
#   X24 - X46 - X47 = 0                         node 4
#   X25 + X35 - X57 - X58 = 0                   node 5
#   X46 - X69 = 0                               node 6
#   X57 + X47 - X79 = 0                         node 7
#   X58 - X89 = 0                               node 8
# 
# Finish node:      X69 + X79 + X89 = 1         node 9

# --------------------------------------------------------------------------------------
# --------------------------------------------------------------------------------------

library(lpSolveAPI)

## create IP object
cpm.ip <- make.lp(nrow = 9, ncol = 12) # nrow is the number of nodes, ncol is the numnber of arcs

# create names for nodes and arcs
arc.names <- c("x12", "x13", "x24", "x35", "x25", "x46", "x57", "x58", "x47" , "x69" , "x79" , "x89")
node.names <- c("node1", "node2", "node3", "node4", "node5", "node6", "node7", "node8", "node9")

# rename the IP
rownames(cpm.ip) <- node.names
colnames(cpm.ip) <- arc.names

## objective function
time <- c(5 , 3 , 3 , 2 , 4 , 1 , 4 , 2 , 6 , 7 , 4 , 5)
set.objfn(cpm.ip, -1*time)  # default is min

## set constraints LHS
set.row(cpm.ip, 1, c(1, 1), indices = c(1, 2) )               # node 1 (starting node)
set.row(cpm.ip, 2, c(1, -1, -1), indices = c(1, 3, 5))        # node 2 (intermediate node)
set.row(cpm.ip, 3, c(1, -1), indices = c(2, 4))               # node 3 (intermediate node)
set.row(cpm.ip, 4, c(1, -1, -1), indices = c(3, 6, 7))        # node 4 (intermediate node)
set.row(cpm.ip, 5, c(1, 1, -1, -1), indices = c(4, 5, 8, 9))  # node 5 (intermediate node)
set.row(cpm.ip, 6, c(1, -1), indices = c(6, 10))              # node 6 (intermediate node)
set.row(cpm.ip, 7, c(1, 1, -1), indices = c(7, 8, 11))        # node 7 (intermediate node)
set.row(cpm.ip, 8, c(1, -1), indices = c(9, 12))              # node 8 (intermediate node)
set.row(cpm.ip, 9, c(1, 1, 1), indices = c(10, 11, 12))       # node 9 (finish node)

## set constraints type
set.constr.type(cpm.ip, rep("="), 9)

## set constraint RHS
rhs <- c(1, rep(0, 7), 1)
set.rhs(cpm.ip, rhs)

## set all variables type to be binary
set.type(cpm.ip, 1:12, "binary")

## solve the IP problem
solve(cpm.ip)
# [1] 0

get.objective(cpm.ip)
# [1] -20

get.variables(cpm.ip)
# [1] 1 0 0 0 1 0 0 0 1 0 0 1

# put optimal values beside of variable names for better understanding of th results
cbind(arc.names, get.variables(cpm.ip))
# arc.names    
# [1,] "x12"     "1"
# [2,] "x13"     "0"
# [3,] "x24"     "0"
# [4,] "x35"     "0"
# [5,] "x25"     "1"
# [6,] "x46"     "0"
# [7,] "x57"     "0"
# [8,] "x58"     "0"
# [9,] "x47"     "1"
# [10,] "x69"     "0"
# [11,] "x79"     "0"
# [12,] "x89"     "1"

# Running the LP formulation on any LP solver, the critical path is:
#
# From node 1 to 2
# From node 2 to 5
# From node 4 to 7
# From node 8 to 9
# 
# The duration of the project is, therefore 20 time units.
