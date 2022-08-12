# Objective: Help Turtle Games prepare data for analysis

# Install libraries
install.packages("tidyverse")
install.packages("skimr")
install.packages("DataExplorer")
library(tidyverse)
library(readr)
library(dplyr)
library(tidyr)
library(skimr)
library(DataExplorer)

# Import games_sales data set
games_sales <- read.csv("/Users/natalia/Desktop/game_data/games_sales.csv")

# Sense-check the data set:
# 1. Display the first six rows of the data set
head(games_sales)
# 2. Display the last six rows of the data set
tail(games_sales)
# 3. View the data in the spreadsheet format to check for inconsistencies
View(games_sales)

# Explore the data set further:
# 1.Display dimensions
dim(games_sales)
# 2.Display column names
colnames(games_sales)
# 3.Determine the structure of the data set
str(games_sales)
library(dplyr)
glimpse(games_sales)
as_tibble(games_sales)

# Identify missing values
games_sales[is.na(games_sales)]
# Check missing values for each column
is.na(games_sales$Global_Sales)
is.na(games_sales$NA_Sales)
is.na(games_sales$EU_Sales)
is.na(games_sales$Name)
is.na(games_sales$Rank)
is.na(games_sales$Platform)
is.na(games_sales$Year)
is.na(games_sales$Genre)
is.na(games_sales$Publisher)
# Display summary statistics
summary(games_sales)

# Create report for the data set
library(skimr)
skim(games_sales)
DataExplorer::create_report(games_sales)

# Further explore, manipulate, and prepare the data for analysis
# 1.Sense check the data by displaying top rows, dimensions and data types
as_tibble(games_sales)
# Rename columns to make it more clear
games_sales <- games_sales %>%
  rename(North_America_Sales = NA_Sales,
         Europe_Sales = EU_Sales,)
# view columns
head(games_sales)
# 2.Visualise data with boxplot to determine normal distribution of columns
boxplot(games_sales$North_America_Sales)
boxplot(games_sales$Europe_Sales)
boxplot(games_sales$Global_Sales)
# 3.Perform basic string manipulation
library (stringr)
# Rename column names to uppercase
names(games_sales) <- str_to_upper(names(games_sales))
colnames(games_sales)

# Determine the unique values in each column
unique(games_sales$NAME)
unique(games_sales$RANK)
unique(games_sales$PLATFORM)
unique(games_sales$YEAR)
unique(games_sales$GENRE)
unique(games_sales$PUBLISHER)
unique(games_sales$NORTH_AMERICA_SALES)
unique(games_sales$EUROPE_SALES)
unique(games_sales$GLOBAL_SALES)

# Determine the number of occurrences
table(games_sales$NAME)
table(games_sales$PLATFORM)
table(games_sales$YEAR)
table(games_sales$GENRE)
table(games_sales$PUBLISHER)

# Visualise the data

barplot(table(games_sales$GENRE),
        main = "Genre",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

barplot(table(games_sales$GENRE),
        main = "Genre",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

barplot(table(games_sales$PUBLISHER),
        main = "Publisher",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

barplot(table(games_sales$PLATFORM),
        main = "Platform",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

barplot(table(games_sales$YEAR),
        main = "Year",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

barplot(table(games_sales$NAME),
        main = "Game name",
        xlab = "Name",
        ylab = "Count",
        col = "Red")

# Display subset of data based on graphs for GENRE and PLATFORM
nrow(subset (games_sales, GENRE == "Sports" & PUBLISHER == "PS"))
nrow(subset (games_sales, GENRE == "Sports" & PUBLISHER == "PS4"))
nrow(subset (games_sales, GENRE == "Action" & PLATFORM == "PS"))

# Display basic descriptive statistics
max(games_sales$EUROPE_SALES)
max (games_sales$NORTH_AMERICA_SALES)
max (games_sales$GLOBAL_SALES)

# Determine normality for North America Sales and Europe Sales
# 1.Histogram for North America Sales
hist (games_sales$NORTH_AMERICA_SALES)
# The histogram suggests that the data does not follow a normal distribiution
# 2.Histogram for Europe Sales
hist (games_sales$EUROPE_SALES)
# The histogram suggests that the data does not follow a normal distribiution

# 3.Qqplot for North America Sales
qqnorm (games_sales$NORTH_AMERICA_SALES)
qqline (games_sales$NORTH_AMERICA_SALES) 
# The reference line shows that the points are roughly circling a straight line, but whether this confirms normality is unclear
# 3.Qqplot for Europe Sales
qqnorm (games_sales$EUROPE_SALES)
qqline (games_sales$EUROPE_SALES) 
# The reference line shows that the points are roughly circling a straight line, but whether this confirms normality is unclear

# 5. Data Skewness
install.packages("moments")
library(moments)
skewness(games_sales$NORTH_AMERICA_SALES)
# skewness for North America Sales is greater than 1 which indicates a highly skewed distribiution
skewness(games_sales$EUROPE_SALES)
# skewness for Europe Sales is greater than 1 which indicates a highly skewed distribiution
