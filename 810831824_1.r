# 1. Read a file for data
# 2. Produce summary statistics of the data
# 3. Produce a graph, and
# 4. That it works.

# change directory in console
# > getwd()
# setwd("C:/Users/seand/OneDrive/Desktop")
# <run code>


# 1. Read a file for data
# Create a data frame.
data <- read.csv("raw_data_sample.csv")
print(data)


# 2. Produce summary statistics of the data

# https://mgimond.github.io/ES218/Week03ab_groupby.html
# Create a data frame.
# install.packages("dplyr")
library(dplyr)

data %>% 
  group_by(Project.Manager) %>%
  summarise( job_count = n()  
             , sum_original_contract = sum(Original.Contract )
             , sum_contract_Change_orders = sum(Contract.CO.s )
             , sum_contract = sum(Revised.Contract)
             , sum_original_cost = sum(Original.Cost)
             , sum_approved_cost_change_orders = sum(Approved.Cost.CO.s)
             , sum_revised_estimated_cost = sum(Approved.Cost.CO.s)
             , sum_estimated_Gross_profit= sum(Estimated.Gross.Profit)
             , sum_billed_to_date = sum(Billed.to.Date)
             , sum_cost_to_date = sum(Costs.to.Date)
             , sum_gross_profit_to_date = sum(Gross.Profit.to.Date)
            )

# 3. Produce a graph, and
#install.packages( "plotly")

library(plotly)

data <- read.csv("raw_data_sample.csv")

#Bar Chart of "Gross Profit to Date" by "Job Status"
plot_ly(data , x = ~Job.Status , y = ~Gross.Profit.to.Date , name = "bar chart" , type = "bar")

#Bar Chart of "Gross Profit to Date" by "Project Manager"
plot_ly(data , x = ~Project.Manager , y = ~Gross.Profit.to.Date , name = "bar chart" , type = "bar")

