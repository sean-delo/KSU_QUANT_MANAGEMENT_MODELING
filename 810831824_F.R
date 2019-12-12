# Final Exam -- Sean Delahunty
#
# You have been tasked with the objective of forming groups. Assume that your class consists of
# 12 students, and you would like to form 4 groups of 3 students each. Your primary objective is to
# ensure that you maximize the chance that each group will do well on a class project. Here are the
# requirements to form groups:
#   1. Each group should have exactly 3 students
#   2. The objective is to maximize the chance of success for each group on a class project
# Before you can solve this problem, there are several issues that must be addressed. Some of these
# being:
#   ??? What factors affect the success of groups? Define three factors, e.g., GPA, gender, etc.,
#     that you feel affect the contributions that students make towards project success.
#   ??? How do the above factors combine to define success? For example, is a person with high
#     GPA the same as one with a more relevant background? Decide on how each of the
#     factors contribute toward your definition of success.
#   ??? What are your decision variables?
#   ??? What is your objective function?
#   ??? What are your constraints?


# Set directory
# setwd("C:/Users/seand/OneDrive/Desktop/Kent/2019/QUANT MANAGEMENT MODELING/final")


# generate random student data

    set.seed(12345)   #used to allow for data to be re-generated

    student_id = c(1,2,3,4,5,6,7,8,9,10,11,12)
    age = c(15:16)
    age = sample(preYear, 12, replace = TRUE)
    
    household_income = c(30000:100000)
    household_income = sample(household_income, 12, replace = TRUE)
    
    gpa = round(runif(12, 1.0, 4.1),2)
    
    gender = c("Male", "Female")
    gender = sample(gender, 12, replace = TRUE)
    
    race = c("White", "African_American", "Asian", "Hispanic")
    race = sample(race, 12, replace = TRUE)
    
    data = cbind(student_id, age, household_income, gpa, gender, race)
    data = as.data.frame(data)

data

is.data.frame(data) #true

library(lpSolveAPI)
library(dplyr) 

opt <- read.lp("810831824_F.lp")
solve(opt)
get.objective(opt)
get.variables(opt)
get.constraints(opt)

### Notes ###
#
# I had a very hard time with this assignment. I was unable to find any releavant examples that are any way similair to the optimization
# problem I had to solve for this assignment. I had a hard time trying to correlate previous examples to this optimization problem. 
# I did enjoy this class, and you did a wonderful job giving feedback on my submissions along the way, which I appreciate very much!
#
### Notes ###

