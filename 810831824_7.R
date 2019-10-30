# DMU   hr/dy    supplies/dy    reim pat-dys    prvt paid pat-dys
# F1    150         0.2           14,000             3,500
# F2    400         0.7           14,000            21,000
# F3    320         1.2           42,000            10,500
# F4    520         2.0           28,000            42,000
# F5    350         1.2           19,000            25,000
# F6    320         0.7           14,000            15,000

# 1. Formulate and perform DEA analysis under all DEA assumptions of FDH, CRS, VRS,
#    IRS, DRS, and FRH.
# 2. Determine the Peers and Lambdas under each of the above assumptions
# 3. Summarize your results in a tabular format
# 4. Compare and contrast the above results

#install.packages("Benchmarking")

# // Objective Function
# max: 14000 u1 + 3500 u2;


library(lpSolveAPI)
library(Benchmarking)


# load table
dea <- matrix(c(150,0.2, 14000, 3500,400,0.7,14000,21000,320,1.2,42000,10500,520,2.0,28000,42000,350,1.2,19000,25000,320,0.7,14000,15000),ncol=4,byrow=TRUE)
colnames(dea) <- c("hr/dy","supplies/dy","reim pat-dys","prvt paid pat-dys")
rownames(dea) <- c("F1","F2","F3","F4","F5","F6")
dea <- as.table(dea)
dea

head(dea)

input_values <- c('hr/dy', 'supplies/dy')
output_values <- c('reim pat-dys', 'prvt paid pat-dys')
head(dea[, input_values])
head(dea[, output_values])

#e <- dea(x,y,RTS="crs")


model <- dea(XREF = input_values, YREF = output_values, X = input_values[,], Y = output_values[,], model = "input" , RTS= "constant")
model

