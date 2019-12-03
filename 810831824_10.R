# Assignment 10 -- Sean Delahunty

# generate data for x and y
# write out the objective function using the data and two parameters (intercept and slope)
# use the two alternative nonlinear optimization solver to find the best values of the the two parameters
# plot the results

# setwd("C:/Users/seand/OneDrive/Desktop/Kent/2019/QUANT MANAGEMENT MODELING")

# Create a data frame.
data <- read.csv("Assignment 10 xy plot data.csv")
print(data)
is.data.frame(data) #true

# dim(data)   # 30 rows by 2 columns

 data <- data.frame(data)
 print(data)

# Find the least-squares line. You should have values for b0 (Y intercept) and b1 (slope).
# These are the optimal values 
 
 
plot(data$x,data$y)
cor(data$x,data$y)
  # [1] -0.2816857

fit <- lm(data$x ~ data$y)
fit
  # Call:
  #  lm(formula = data$x ~ data$y)
  #
  # Coefficients:
  #  (Intercept)       data$y  
  #   702.4956        -0.3297 
    
attributes(fit)
     
fit$coefficients[1]
    # (Intercept) 
    #   702.4956 
    
    
fit$coefficients[2]
    # data$y 
    # -0.329704 
    
    residuals(fit)
    fit$residuals
    plot(data$x ,fit$residuals)
    abline(fit)
    
    plot(data$x, data$y)         
    fit <- lm(y ~ x)   
    abline(fit) 
    
    fit
    summary(fit)

    # y intercept = 702.4956
    # coeffient of x (slope) = -0.03297
    # y = -0.3297*x + 702.4956

  plot(fit)
  
