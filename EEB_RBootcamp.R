install.packages("APE") 
install.packages("GEIGER")
install.packages("ggplot2")
install.packages(c("plyr", "reshape2"))

#####EEB 201: Introduction to R Programming #####
### Benjamin Ha ###

# Chapter 9: Data structures in R
# Section 9.1: Vectors

# 9.1.0.0.1 Exercise - Vectors
# %% is an arithmetic operation that provides remainder for division equation
# Example: 5%%2 is 1
# %/% provides the integer after division, and excludes the remainder
# Example: 5%/%2 is 2

# 9.1.1.0.1 Exercise - Element recycling
# When length of longer vector is not a multiple of a shorter vector, the shorter
# vector will be "recycled" again to match quantity of values in longer vector
# Example
x <- c(1:3)
y <- c(seq(from = 10,
           to = 60,
           by = 10))
x + y
# Not how values 1:3 are added to values 40, 50, and 60, in sequential order

# 9.1.2.0.1 Exercise - Funcs of creating vectors
vector <- seq(from = 1,
              to = 13,
              by = 4)
vector
vector.2 <- seq(from = 1,
                to = 5,
                by = 0.2)
vector.2

# 9.1.2.0.2 Exercise - Funcs of creating vectors
vector.3 <- seq(from = 10,
                to = 0)
# If the "to" value is < "from" value, then vector will go in descending order
# Result from 3:1 would be 3, 2, 1

# 9.1.3.0.1 Exercise - Vector indexing
z <- c(1, 3, 5, 7, 9, 11)
v <- z[c(2, 3, 4, 5)]
v
v <- z[seq(1, 5, 2)]
v
# Second v object results in 1, 5, 9 because the seq() func refers to the 1st and 5th
# value in the z object (e.g., 1 and 9) while by = 2 refers to every 2nd value listed
# within that object

v <- z[c(1, 2, 5)]
v
z[1] <- 12
z[c(1, 3, 5)] <- c(22, 33, 44)

# 9.1.3.0.2 Exercise - Vector indexing
z[c(2, 1, 3)]

# 9.1.3.0.3 Exercise - Vector indexing
z[9] <- 11
z
# Since the z vector originally only have 6 numerical values, R automatically insert "NA"
# for the 7th and 8th values, and then added "11" as the 9th value

# 9.1.3.0.4 Exercise - Vector indexing
x <- 1:10
y = (x - 1) / (x + 1)
plot(x, y)
lines(x, y)
# The lines() func is different than abline() because line() connects all data points
# whereas abline() does a straight diagonal line

x <- 1.999999; x; x-2
x <- 1.9999999999999; x; x-2
x <- 1.99999999999999999; x; x-2

# 9.1.3.0.6 Exercise - Unavoidable imprecision - DONT KNOW 
r <- 0.5
n = 10

G <- 1 / (1 - r)
G
sum(G)

# Section 9.1.4 Logical operations
a <- c(1,2,3,4)
b <- c(1,1,5,5)
(a < b) | (a > 3)
(a < b) || (a > 3)
# | means logical OR, for all values compared
# || means logical OR, for the first element only

# Section 9.1.5 More on vector indexing
lowLight <- Light[Light < 50]
lowLightrmax <- rmax[Light < 50]
lowLight
# The sample above does not specify values for object Light, so you just made one up
Light <- 1:100
Light <- Light[Light < 50]
Light

# 9.1.5.0.1 Exercise - more on vector indexing
# If you replaced Light by saying Light <- Light[Light < 50], it would replace object
# "Light" with values < 50. This is wrong based on the lowLight example because
# the original problem tried to assign only the values < 50 within the Light object
# into lowLight.

Light[Light<50 | rmax <= 2.0]
# The sample does not specify values to rmax object so above code doesn't work

# 9.1.5.0.2 Exercise - more in vector indexing
# runif(n) is a function that generates a vector of n random, uniformly distributed
# numbers between 0 and 1. Create a vector of 20 numbers, then find the subset of
# those numbers that is less than the mean. More on runif and related functions soon.
runif(n)
v <- runif(20)
v[v < mean(v)] # Only displays values that are < mean
mean(v)
v

# 9.1.5.0.3 Exercise- more in vector indexing
which(v < mean(v))
# which() func displays positions of elements within vector that meet criteria
# In this case, only those with values that are < mean(v)

# 9.1.5.0.4 Exercise - more on vector indexing - ONLY HAVE 1 out of 2 POSS ANSWERS
# Provide 2 examples to take only the elements in odd positions (1st, 3rd, etc.)
# of a vector of arbitrary length
x <- seq(from = 10,
         to = 100, 
         by = 10)
x[seq(1, 10, by = 2)]



# Chapter 9.2: Matrices and arrays
# Section 9.2.1: Creating matrices
X <- matrix(c(1,2,3,4,5,6), nrow = 2, ncol = 3); X
# This creates a matrix with 2 rows and 3 columns and populates each field with 1:6
# Note: 1:6 populates matrix down the columns first

A <- matrix(1:9, nrow = 3, ncol = 3, byrow = TRUE); A
# This creates a matrix in a similar way, except now 1:9 populates matrix by row first
# R recycles the index provided if matrix dimensions are larger than quantity of values

matrix(1, nrow = 50, ncol = 50)
# Matrix above creates 50x50 and populates each field with 1

# 9.2.1.0.1 Exercise - creating matrices
v <- rep(1:2, 4)
v
# Note how code above makes repetition 1, 2, 1, 2, and not 1, 1, 2, 2
# To do 1, 1, 2, 2, use rep(1:2, each = 4)

x <- matrix(v, nrow = 2, ncol = 4)
x

# 9.2.1.0.2 Exercise - creating matrices
# Use rnorm and matrix to create a 5×75×7 matrix of Gaussian random numbers
# with mean 1 and standard deviation 2
example <- rnorm(n, mean = 1, sd = 2)
example.matrix <- matrix(example, nrow = 5, ncol = 7)
example.matrix

# Use diag(x, y) func to create nXn matrix with data vector x on a diagonal
# Example: diag(1, 5) creates matrix where 1s form diagonal and 0 in all other fields
diag(1, 5)

A <- matrix(0,3,4)
data.entry(A)

# cbind() func bines columns of two objects. rbind() for rows.
C <- cbind(1:3,4:6,5:7); C
# This creates 3 columns with 1:3 in col 1, 4:6 in col 2, and 5:7 in col 3
# This example has 3 columns and 3 rows

D <- rbind(1:3,4:6); D
# This creates 2 rows with 1:3 in row 1 and 4:6 in row 2
# This example has 2 columns and 2 rows

# 9.2.2.0.1 Exercise - cbind() and rbind()
rbind(C, D) # This works
cbind(C, C) # This works
cbind(C, D) # This does not work because the C vector has 3 col and D vector
# 2 col. The # of rows of matrices must match in order to cbind()

# 9.2.3 Matrix indexing
# Sample below doesn't work since no object set for A, so not sure what to do???
z <- A[2,3]
A[2,2:3];



# Section 9.3: Arrays
# Generalizing a matrix to > or < 2 dimensions is the array
# An array is a vector plus info on dimensions of the array
# You can create an array from a vector
X <- array(1:24, dim = c(3,4,2)); X
# The c(3, 4, 2) means 3 rows, 4 col, 2 separate matrices

# Arrays are filled in a particular order

# 9.3.0.0.1 Exercise - arrays
# What happens when we set the dimension attribute on a vector? For example:
x <- seq(1,27) # Inputs 1:27 into object x
dim(x) <- c(3,9) # Inputs values 3 and 9 into dim(x) object
dim(x)
is.array(x) # Confirms if argument is an actual array. Thus, it's TRUE
is.matrix(x) # Confirms if argument is an actual matrix. Thus, it's TRUE
?is.array
?is.matrix

# Chapter 9.6: Dataframes
# Functions like cbind() only work if the vectors to be combined are the same
# type, so either both numerical or qualitative/logical. Data frames are hybrids
# enabling combing both types
# Note: You can turn a data frame into a matrix (using as.matrix(), but only 
# if all variables are of the same class) and a matrix into a data frame
# (using  as.data.frame() func).

data.url <- "http://kingaa.github.io/R_Tutorial/ChlorellaGrowth.csv"
dat <- read.csv(data.url,comment.char='#')
dat

# 9.6.0.0.1 Exercise - Data frames - NOT WORKING
data.url.2 <- "http://kingaa.github.io/R_Tutorial/hurricanes.csv"
dat.2 <- read.csv(hurricanes.csv)
dat.2





##### R Bootcamp Course: Day I Friday, September 22, 2017

# using ? before a func provides its definition (e.g., ?lm, ?cbind(), etc.)
# you can also Google stack overflow website for help guide

# getwd()           func shows the folder you assigned to save your scripts
# cat()             prints code onto the screen you assigned to a variable
# ls()              lists out all variables you currently have assigned in script(s)
# rm(list = ls())   func will remove all the variables within your script
#                   If you want a specific object to be removed, include that
#                   text within the ls() code
# runif()           random uniform func to provide random #s equal to the amt you want
# dim()             provides dimensions (# of rows, cols) of a variable
# head() & tail ()  provides you first/last set of lines of data you've recorded
# $ operator        isolates the col you want within a dataframe (e.g. pirates$beard)
# is.na()           returns logical values for a dataframe where NA is a value
#                   In this case, NA means you didn't enter a data point there
# na.omit()         Func to only get non-NA values


### Intro to control statements
# **for**           statements perform an action over a range
#                   Example: for (some range) {do something}

for (ii in 1:5){
  cat("\nthe number ", ii) # The ii in this line says to print ii, which is 1:5
}

# ii is variable being assigned 1:5
# {} is action
# \n means new line.
# As a whole, this says add "the number is" as a new line for every variable ii

notfish <- c("bat", "dolphin", "fish", "soldier")
for(animal in notfish){
  cat(animal, "fish\n", sep = "")
}

# **for** func now adds word "fish" at end of each notfish value
# (e.g., batfish, fishfish)

# **while**         Another loop that keeps running until the conditional part of
#                   the expression fails. This is when loop terminates
#                   while (some condition is TRUE){do something}

xx <- 10
while (xx < 100){
  xx <- xx + 10
  cat(xx, "\n")
}

# **while** func only adds 10 to each xx value until the criteria is no longer TRUE
# hence why there is no 110 value since 110 > 100

xx <- 1

while(xx < 5){
  xx <- xx + 1
  if (xx == 3) {
    break; }
}

# you add the break; operator to stop the loop after xx = 3. 
# this prevents you from writing an infinite loop.
# WARNING: Infinite loops will happen on accident. If you exclude the break; operator
# R/your comp will run forever and ever and take up a lot of memory than needed
# to end it, you would need to close R. joy.


### Intro to plotting
# Normal distribution curve
# rnorm()           means random normal distribution. must assign mean and std dv
#                   Example: rnorm(n, mean, sd)

s1 <- rnorm(1000, mean = 0, sd = 1)
head(s1) # Saves you from printing all random values and breaking your computer
         # and instead only prints the first couple of lines
s3 <- rnorm(1000, mean = 0, sd = 10)

pdf(file="Normal_hist.pdf", width = 4, height = 7) # preps to save your histogram as 
# a pdf. Automatically saved into your current working directory
# This func opens a file

par(mfrow = c(2, 1), mar = c(4, 4, 3, 2)) # sets plotting area and margins
# mfrow = 2 rows, 1 col
# mar = margins from (bottom, left, top, right)
# use ?par to get help on adding more details to the plot

hist(s1, # Make first histogram. Hist(x) where x = vector
     col = "seagreen", # color
     xlab = "Value", # x label
     main = "Sigma=1") # title
hist(s3,  # Make second histogram
     col = "blue", 
     xlab = "Value", 
     main = "Sigma=3")
# Note how ylab is default "Frequency" but you can change it as needed

# Instead of writing "Sigma" you can use:
hist(s1, 
     col = "seagreen", 
     xlab = "Value", 
     main = expression(paste(sigma, "=1"))) # the "=1" adds words after sigma notation

dev.off() # add this code to shut off current output device. If you do not add this,
# then all plots you continue to create will auto be added to this same file

plot(s1, s3) # scatter plot for plot(x, y)



#Smooth density plot
pdf(file = "Normal_density.pdf", width = 6, height = 6) #open file
par(mfrow = c(1, 1), # par means parameter
    mar = c(4, 4, 3, 2)) # sets plotting area and margins
plot(density(s1), 
     col = "forest green", 
     lwd = 4, # controls line thickness. Default is 1
     xlab = "Value", 
     xlim = c(-15, 15), # min and max of x axis
     main = "Normal distribution")
lines(density(s3), # Use lines() to combine and overlap 2 graphs
      col = 4, 
      lwd = 4)
# if you used plot() instead of lines() for 2nd histogram, you would only plot
# the s3 and the s1 would be removed
# Also note how s3 has larger std dv so you would need to modify the xlim

legend(-15, 0.4, c("sigma=1", "sigma=3"), # This also implies order
         lwd = 4, # You can replace this with pch instead to use shapes instead of lines
         col = c("forest green", 4), # order of colors correlate to order of text
         cex = 1) # Size of legend relative to entire graph

abline(v = quantile(s1, 0.9), # Add verical line at desired location
       lty = 2, lwd = 2, col = "forest green")
# For quantile(), 0.9 means 9% of values that are the upper 10% of values

abline(v = quantile(s3, 0.9), # 2nd verical line for s3 data
       lty = 2, lwd = 2, col = "blue")

dev.off() # Remember, always close this out!!!



# Boxplots
pdf(file = "Normal_boxplot.pdf")
# cbind()         combines vectors by columns
#                 Example: cbind(s1, s3) gives you 1000 rows, 2 cols
# rbind()         combines vectors by rows
#                 Example: rbind(s1, s3) gives you 2 rows, 1000 cols
# c()             combines vectors with no organization.
#                 Example: c(s1, s3) outputs 2000 values

# If you do $breaks for each vector, you will get different sets of breaks because
# each data vector contains diff data (e.g., differing std dv) so if you combine
# two data sets, they must have the same bins
bins <- seq(-30, 30, by = 1) # establish your own bins to be applied consistently
# to both data sets

hist(s1, breaks = bins)$breaks
hist(s3, breaks = bins)$breaks # Now breaks for both s1 and s3 are consistent
counts_s1 <- hist(s1, breaks = bins)$counts
counts_s3 <- hist(s3, breaks = bins)$counts
# Uh oh. Both counts read back an error because the max(s3) is larger than 10
max(s3)
min(s3)
# If this happens, modify your bins to fall within max range
# Still not working, not sure why
barplot(rbind(counts_s1, counts_s3),
        col = c(2, 4),
        beside = TRUE, # puts bars beside one another. If false, they will overlap
        names.arg = seq(-10, 9.5, by = 1),
        xlab = "Value",
        ylab = "Count") 
# Incomplete code. Didn't read the slide quick enough

sum(s1 > 3) # Returns quantity of values in s1 that are > 3


# Weird and funky R stuff
x <- rnorm(100) # Assign random numbers to x vector
y <- x + rnorm(100, sd = 0.2) # Assign more random numbers to y vector

plot(x, y, 
     pch = 19, 
     cex.lab = 2, # controls size of labels on the axis
     cex.axis = 2) # controls size of axis line itself and the values




### R Bootcamp Day I Exercises - September 22, 2017
# Alfaro Bootcamp Exercise I

# Exercise 1
# Write a for loop statements so that it runs from 1:9 and prints following output
for (ii in 1:9){
  if (ii <= 8) {
    cat("\n")
  }
  if (ii == 9) {
    cat("\n*")
  }
}

# Exercise 2
# Modify your for loop so that it prints 10 asterisks, with each asterisk 
# separated by exactly one ampersand sign (&), with no spaces or new line characters.
for (ii in 1:10){
  cat("*&")
}

# Exercise 3
# by hand, figure out the initial values of these variables and values at the
# start and end of each iteration of the loop

dogs <- 10; # Assigns value 10 at variable dogs
for (i in 1:5){ # States for every number i from 1:5
  dogs <- dogs + 1; # Add 1 to dogs variable. Value should be 11
}
###
meatloaf <- 0; # Assigns value 0 to variable meatloaf
for (i in 5:9){ # States for every number i from 5:9
  meatloaf <- meatloaf - i + 1; # Subtracts i (within 5:9) from 0, add 1
  cat(meatloaf) # First value -4. Last value - 30
} 
a <- 0 - 5 + 1; a # First value
b <- a - 6 + 1; b
c <- b - 7 + 1; c
d <- c - 8 + 1; d
e <- d - 9 + 1; e # Last value
###
bubbles <- 12; # Assigns value 12 to variable bubbles
for (i in -1:-4){ # States for every number i from -1:-4
  bubbles <- i; # Value is -4
}

# Exercise 4
# modify this code so that it will print out a message during presidential 
# as well as congressional election years

### you can use the if statement with the modulus operator to conditionally
### perform operations
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = T)
  }
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = T)
  }
  
}

# Exercise 5
# More fun with loops. Here are the bank accounts from seven randomly selected 
# UCLA grad students

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
compounded <- interestRate * rep(bankAccounts) + rep(bankAccounts)

# Now look at the error message the following lines of code produce.
# Can you think of a way to modify this loop so that the loop will 
# compound the interest?

interestRate <- 0.0125;
for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate * bankAccounts[i] + bankAccounts[i]; }
compounded
# Does not work because compounded function does not yet exist

# HINT: variables must be initialized before you can perform operations on them
# HINT 2: look at the rep() function and see if you can use that to initialize 
# a variable that will help you.

# Exercise 6
# Go back to the compounded interest example. Suppose we now want to compound 
# the interest annually, but across a period of 5 years. The **for** loop we 
# discussed earlier only compounds for a single year.

bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this


for (j in 1:5) { # Note: j and i are simply objects. You can use a name!!!
  for (i in 1:length(bankAccounts)) {
    #step 1 modify bankAccounts so that amounts reflect income and expenses
    bankAccounts.expenses <- (bankAccounts - house - food - fun + income)
    bankAccounts.expenses
    
    #step 2 calculate interest and add to accounts from step 1
    #you can actually use the line you have already written if you
    #modify amounts in bankAccounts directly in step 1
    bankAccounts.winterest <- bankAccounts.2 * interestRate + bankAccounts.expenses
    bankAccounts.winterest
  }
} 


# Exercise 7
# Three students have estimated annual expenditures for food, housing, 
# and fun of: (in thousands of dollars)

house <- c(4.8, 3.8, 5.7); # All three of these objects are the same as in question 6
food <- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 

#and incomes (through TAships) of 

income <- c(21, 21, 21); # This is also the same as in question 6

# Modify the 5-year interest-compounding code from #5 and #6 so that it runs
# from 2015-2020 and so that in odd numbered years students 1 and 3 get trust 
# fund disbursements of $5000. (hint the modulus function %% will be helpful)

bankAccounts <- c(10, 9.2, 5.6);

for (year in 1:5) { # Adding years 1:5 into object year
  for (person in 1:length(bankAccounts)) { # Adding 1:length of quantity of bankAccounts
    if (year %% 2 == 1){ # Criteria to only select odd years
      if (person %% 2 == 1){ # Criteria to only select person 1 and 3
        bankAccounts[person] <- bankAccounts[person] + 5 # Criteria to only use bankAccounts of
        # person 1 and 3, and only adding 5 to those accounts
      }
    }
  }
}
bankAccounts


# Exercise 8
# Use a while loop to sum all numbers from 1:17. You will need to use a 
# counter variable (like index seen in class).

sum(1:17)
x = 0 # Set x = 0, so then it will increase depending on x + j
j = 1 # Set j = 1, so then it can be added to x as j increases by 1 so long as its < 18
while (j < 18){
  (x <- x + j);
  (j <- j + 1) # j is the counter variable. Without it, loop would be infinite
}
x
# 1st iteration: x = 1 and j = 2
# 2nd iteration: x = 3 and j = 3, as x = x + j
# 3rd iteration: x = 6 and j = 4


# Exercise 9
# write a function takes a number, and prints ‘small’ if number less than or 
# equal to -1; ‘medium’ if between -1 and + 1’big’ if greater than or equal to + 1

length(n)
n <- c(-3:3)
for(ii in 1:length(n)){
  if(n[ii] <= -1){ 
    cat(n[ii], 'Small', sep = '\t', fill = T)
  }
  if(n[ii] > -1 & n[ii] < 1){
    cat(n[ii], 'Medium', sep = '\t', fill = T)
  }
  if(n[ii] >= 1){
    cat(n[ii], 'Large', sep = '\t', fill = T)
  }
}
# NOTE: using [ii] selects a specific value within the vector n <- c(-3, 3). 
# If you do n by itself, then it is only listing all the values you assigned to it.



### R Bootcamp Day I Exercises - September 25, 2017
# Lohmueller Bootcamp Exercise I

# Exercise 1
# Write a function (called “get_heights”) in R to draw a sample of individuals 
# (either 100 or 1000) from the population. Hint: You will want to use “rnorm”
# within your function. Store the random heights that you’ve generated in
# a variable called “heights”.

get_heights <- function(x) {  
  y <- rnorm(rsample, mean = 69, sd = 10) # This is to simulate random sample
  return(y) # rather than the quantity of the random sample
}
heights <- get_heights(1000) # This is to retrieve a specific quantity of the rsample
head(heights)
# in the first line, x = the value that you would input into the func
# y = the value that will be produced by the func
# both variables should be diff to logically represent diff responsibilities

# Exercise 2 and 3
# Within your function, compute the avg height from your "heights" vector
# Make your function return the avg height

get_heights <- function(x) { 
  y <- rnorm(x, mean = 69, sd = 10)
  mean.y <- mean(y)
  return(mean.y)
}

# object = something that has stored info
# variable = something with stored with one value (numerical or string)
# vector = something stored with a list of values

# Exercise 4
# Use a “for” loop to call your “get_heights” function 1000 times with taking
# a sample of size 100 from the population. Save the mean height from each
# replicate in a vector called “mean_heights_100”.

mean_heights_100 = numeric() # creates empty vector w/ infinite spaces for unknown values
for(i in 1:1000){
  mean_heights_100 <- c(mean_heights_100, get_heights(100))
}
# The mean_heights_100 line creates the vector to actually have 1000 empty slots

# Exercise 5
# Use a “for” loop to call your “get_heights” function 1000 times, with
# taking a sample of size 1000 from the population. Save the mean height
# from each replicate in a vector called “mean_heights_1000”.

mean_heights_1000 = numeric() 
for(i in 1:1000){
  mean_heights_1000 <- c(mean_heights_1000, get_heights(1000))
}

# Exercise 6
# Plot a histogram of the distribution of the average heights for your
# sample size of 100 and 1000 individuals. The two sets of data should
# be plotted on the same axes. Add a legend. Label the axes. Plot the data
# from the 100 samples in red and the data from the 1000 samples in blue.

max(mean_heights_100)
min(mean_heights_100)

max(mean_heights_1000)
min(mean_heights_1000)

par(mfrow=c(1,1), mar=c(4, 4, 3, 2))
bins <- seq(65, 73, by = 0.5) # the groupings along x axis
# seq (min, max, by); the min should be 1 unit less than the actual min value (65)
# but R has an error when you do 1 unit above the actual max (72)
# Instead, for max, used 72 to avoid error and kept min as true min
# The by = how R will separate the diff values that are on the fence betw 2 values
# Example: 62.49 will go into bin 62 and 62.56 will go into bin 63 if by = 0.5

hist(mean_heights_100, breaks = bins)$breaks 
hist(mean_heights_1000, breaks = bins)$breaks
counts_100 <- hist(mean_heights_100, breaks = bins)$counts # the quantity of data that falls into that bin
counts_1000 <- hist(mean_heights_1000, breaks = bins)$counts

pdf(file="RBootcamp_Lohmueller_Barplot.pdf", width=6,height=6);
barplot(rbind(counts_100, counts_1000),
        col = c("red", "blue"),
        beside = TRUE, # puts bars beside one another. If false, they will overlap
        names.arg = seq(65, 72.5, by = 0.5), # these need to match the defined bins
        xlab = "Average height (inches)",
        ylab = "Count")

legend(0,400,c("n = 100","n = 1000"),lwd=4,col=c("red", "blue"),cex=1)
# legend (x, y) for location on quadrant
# cex = size of legend box. May need to reset the hist code too

dev.off()




##### R Bootcamp Day II - September 27, 2017
### Introduction to modeling - Lloyd-Smith

# Pseudo-code Exercise
# N(t + 1) = R * N(t)
# set N = 100, R = 1.05, loop over 10 yrs, each year update popu size by N * R

# General layout of modeling scripts
# 1) Setup statements, as needed
# 2) Input data, set parameters, and/or set initial conditions
# 3) Perform calculations
# 4) Display results via plot, saving, or showing on-screen
# Actually copy/pasting this framework is a useful habit: play out the program in pseudocode, then use pseudocode to ... idk


# Exercise: Creating first model
# Setup statements, as needed
# N/A

# Input data and set parameters
N = 100
R = 1.05

# Initialize variable to vector of NA values
NN <- matrix(NA, nrow = 1, ncol = 11) # Similar idea as the line above, but this allows you to modify a specific value, if needed 
NN[1] <- N # set first value to initial condition

# Use a loop to iterate the model
for(tt in 1:10){ # **while** loop is another potential outcome
  NN[tt + 1] <- R * NN[tt]
}

# Perform calculations and plot results
plot (1:11, NN, 
      xlab = "time", 
      ylab = "N", 
      col = "blue")

# Now how can you modify this code so you can easily adjust how long the simulation runs?
# Set new parameter
ttMax <- 10
for(tt in 1:ttMax){ 
  NN[tt + 1] <- R * NN[tt]
  break;
}

plot (1:(ttMax + 1), NN, 
      xlab = "time", 
      ylab = "N", 
      col = "blue")


# Create a discrete logistic model
N = 100
r = 1.05
K = 300 # Carrying capacity
NN <- matrix(NA, nrow = 1, ncol = 11)
NN[1] <- N
ttMax <- 10

for(tt in 1:ttMax){ 
  NN[tt + 1] <- NN[tt]*(1 + r*(1 -(NN[tt]/K)))
}
# Use () for functions
# Use [] to select a value within a matrix
# Also make sure to distinguish multiplication via * since () has diff definitions in R programming and can't tell the diff betw what you want to do

plot (1:(ttMax + 1), NN, 
      xlab = "time", 
      ylab = "N", 
      col = "blue")



# Inputs: Default values for arguments
numberify <- function(xx = 1, yy = 1, zz = 1){
  myNumber <- xx * 100 + yy * 10 + zz
  return(myNumber) 
}
numberify()
numberify(3)
numberify(3, 2)

# Note: return() line required to stop func
# You can also have multiple return() statements

# How to program the discrete logistic model into a function
geomFun <- function(R, N, ttMax){ # input original parameters into function()
  NN <- rep(NA, ttMax + 1)
  NN[1] <- N
  for(tt in 1:ttMax){ # this the same as before
    NN[tt + 1] <- R * NN[tt]
  }
plot (1:(ttMax+1), NN, # this is also the same as before
      xlab = "time", 
      ylab = "Population size", 
      col = "blue",
      lty = 2, # line type, either solid or dash
      type = "l") # type, either points or lines between each data value 
return(NN)
}
# ?par for definitions of lty and type
# the diff types can either be values (e.g., "1") or words (e.g., "red")
# if you run into an error, you should switch betw the two
geomFun(1.05, 100, 10)


# To make a plot of model summary output vs parameter value
# Define parameter values
# for parameter of interest, make a vector of values you want to consider
N0 <- 100 # variable for 100 values
popu.time <- 10 # population at time x
rd <- 2 # growth rate

# Initialize vector to hold summary values
NN <- rep(NA, popu.time + 1) # create matrix with NA slots
NN[1] <- N0

# use a **for** loop repeatedly run the model and plot output
# You are looping over the list of values you want to use for the parameter you’re varying. Each time through loop, run the model with the current parameter values and store the summary values in the ith element of your results vector

for(r in 1:rd){
  NN[r + 1] <- 
}
### Incomplete code. MUST FINISH. Review slides ###


# Discrete-time models are seasonal systems, discretized data, easy coding
# Continuous-time models are more complicated: non-seasonal systems, events occur at any time, easier math analysis
# For continuous models, install.package ("deSolve")
# use lsoda() func to create models



### Working with data - Lohmueller
# Use x = sample() to retrieve 1:20 at random with no replacement
# Use x = sample(20, replace = TRUE) to allow replacement during randomness

# Accessing vector elements
# x = seq(50, 60) to assign values to a vector x
# x[2] to retrieve the 2nd value within the vector
# Remember: [] indicates a desired value within a vector. () is for func

# apply() functions
x <- seq(1, 10)
y <- matrix(x, nrow = 2, ncol = 5)

# Say you want to get mean of each col. You can use a **for** loop or **apply** func
apply(y, 1, mean) # 1 refers to the row
apply(y, 2, mean) # 2 refers to the col

# HapMap data: 0, 1, 2 refers to genotypes
# the rs####### is the sample number. So you can ignore, as needed
getwd()
snpsDataFrame=read.table('hapmap_CEU_r23a_chr2_ld-2.txt',header=TRUE)
dim(snpsDataFrame) # displays dimensions(col, row)
table(testSNP)

rm(list = ls()) # This removes all objects you currently defined





##### R Bootcamp Day II Exercises - September 27, 2017
# Lloyd-Smith R Bootcamp Exercises II

# Exercise a
# Write a function that runs the Ricker model, plots the result, and returns the time series as an output. At minimum, your function should take all parameter values and initial conditions as input arguments
# Note: K > 0 and r can take positive or negative values

rickerFun <- function(r, n, ttMax, K){
  NN <- rep(NA, ttMax + 1)
  NN[1] <- n
  for(tt in 1:ttMax){
    NN[tt + 1] <- NN[tt]*exp(r*(1 - (NN[tt]/K))) # Note NN[tt + 1] and NN[tt] usages
  }
  plot (1:(ttMax + 1), NN,
        xlab = "time", 
        ylab = "Population size", 
        col = "blue",
        lty = 2,
        type = "l")
  return(NN)
}
rickerFun(3, 10, 10, 100)
# rickerFun(r, n, ttMax, K)
# r = growth rate, n = population, ttMax = time, K = carrying capacity


# Exercise b
##  Explore the dynamics of the model. Try to find combinations of parameter values that yield the following patterns:
# Population decreases to n = 0.
rickerFun(2, 0, 50, 10)

# Population approaches stable equilibrium at n∗ = K, without oscillations.
rickerFun(1, 100, 50, 1000)

# Decaying oscillations around n∗ = K.
rickerFun(2, 60, 100, 100)

# Persistent, regular oscillations.
rickerFun(2, 9.9, 100, 10)

# Crazy, random-looking fluctuations (chaos).
rickerFun(5, 60, 100, 100)

## Which parameter is the key driver of these patterns?
# Changing r (growth rate)


# Exercise c
# Choose six interesting values of this parameter. Write a script that makes an array of six plots showing the model dynamics for each of these values
pdf(file="LloydSmith_6Plots.pdf", width=6,height=6)
par(mfrow=c(2,3))

zero <- rickerFun(2, 0, 50, 10)
noOscil <- rickerFun(1, 100, 50, 1000)
wOscil <- rickerFun(2, 60, 100, 100)
chaos <- rickerFun(5, 60, 100, 100)
random <- rickerFun(2, 23, 100, 5)
persistent <- rickerFun(2, 9.9, 100, 10)

dev.off()

# Exercide d
# Imagine n0 = 20 and K = 1000 for a certain population of deer that is growing according to the Ricker model. You are a wildlife manager, and are concerned about how long it will take for the population to reach half of its carrying capacity. That is, you want to know tK/2, the first year that nt ≥ K/2. Suppose your output time series is called nVec. Write an R command that will determine the index of the first element of nVec that is ≥ K/2.

nVec <- rickerFun(0.8, 20, 10, 1000)
which(nVec >= K/2) # use which() to find which index(es) are nVec >= K/2
min(which(nVec >= K/2)) # use min() to find the minimum when nVec >= K/2
nVec[min(which(nVec >= K/2))] # use nVec[] to find popu value at when the min when nVec >= K/2


# Exercise e
# Write a script that runs the necessary simulations and collects the
# necessary data to plot how tK/2 depends on r, for the range of
# r from 0.1 to 0.9.

data <- seq(0.1, 0.9, by = 0.1)
popu.data <- matrix(NA, nrow = 1, ncol = 9)
for(ii in 1:length(data)){
  data.2 <- rickerFun(data[ii], 20, 50, 1000) # to collect all data within parameters 0.1 >= r >= 0.9
  popu.data[ii] <- min(which(data.2 >= K/2)) # returns year when popu exceeds >= K/2
}

plot(data, popu.data,
     xlab = "growth rate (r)",
     ylab = "time at K/2")

# data[ii] instructs to pull one value of data at a time
# Call the rickerFun() to pull population values at time K/2 
# when 0.1 <= r <= 0.9


# Exercise f
# Write pseudo-code to do a joint sensitivity analysis for two parameters. That is, choose a vector of values you’d like to consider for both r and K, and choose a simple output from your model (e.g. population size at t = 10). Run the model for all possible combinations of these values and collect the results in a matrix with appropriate dimensions. Plot the results in some way. Hint: the straight-forward way to do this uses a ‘nested loop’.

# Define your two parameter values for r and K, and make a vector of values you want to consider. Choose a simple output (e.g., population size at t = 10)
# Initialize a matrix to collect all outputs, or a vector to hold summary values
# Use **for** loop to fun model and collect output. Note: This loop is NOT over the timesteps of the model, but rather over the set of diff parameter values
# Use the func to run model in a single line within the loop and store the summary values in the i-th element of your results vector or store in a matrix with approprate dimensions
# Plot results vector versus vector of parameter values


# Exercise g
# Convert pseudo-code into an R script to do a two-dimensional sensitivity analysis, and create a visually appealing plot to summarize the results. (You will need to google for plotting commands, e.g. contour or surface plots).


r <- seq(1, 3, by = 0.2) # growth rate vector from 1:3 with 0.2 increments
length(r)
K <- seq(100, 500, by = 100) # carrying capacity vector from 100:500 in 100 increments
length(K)
ttMax <- 10 # to run model over constant time 10 years
n <- 350 # constant population size 350
data.vec <- matrix(NA, nrow=length(K), ncol=length(r)) # initialize empty vector with 5 row 11 col to store data

for (ii in 1:length(r)){ # ii refers to slot of a value in 1:lengt(r) vector
  for (jj in 1:length(K)){ # jj refers 
  output <- rickerFun(n, ttMax, r = r[ii], K = K[jj]) # output for discrete logistic func at constant n and ttMax, but changing r and K parameters
  data.vec[jj, ii] <- output[ttMax] # store values collected from model based on the changing r and K parameters at ttMax = 10
  }
}
#data.vec[jj, ii] will fill output in rows first, then col

install.packages("plotly")
library(plotly)

plot_ly(x = r,
        y = K,
        z = data.vec,
        type = "contour",
        scene = list(
          xaxis = list(title = "growth rate (r)"),
          yaxis = list(title = "carrying capacity (K)")))

?plot_ly

### R Bootcamp Day II Exercises - September 28, 2017
# Lohmueller Bootcamp Exercise II

getwd()
setwd("/Users/BenjaminHa/Box Sync/RBootcamp/RBootcamp")
snpsDataFrame = read.table('hapmap_CEU_r23a_chr2_ld-2.txt', header=TRUE) # load data
phenoDataFrame = read.table('pheno.sim.2014-2.txt', header=TRUE) # load data
snps = as.matrix(snpsDataFrame) # convert dataframe into a matrix

# dim() shows dimenstions
# names() shows col names
# Key for snps data: 0 = homozygous dominant, 1 = heterozygous, 2 = homozygous recessive


# Exercise 1a
# To start let’s revisit our tests of Hardy-Weinberg. Go back and perform the chi-square test for Hardy-Weinberg that we did in class on all SNPs in the “hapmap_CEU_r23a_chr2_ld.txt” file. Hint: you already have the code for this… Save your P-values in a vector called “pvals”.

head(snpsDataFrame)
snps.col <- snpsDataFrame[60,] # What you tried to do, but failed
snps.names <- names(snpsDataFrame)
chisq.test(x = snps,
           y = NULL,
           correct = TRUE,
           p = rep(1/length(x),length(x)), 
           rescale.p = FALSE,
           simulate.p.value = FALSE, 
           B = 2000)

compute_chisquare=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  expcnts=c((1-freq)^2,2*freq*(1-freq),freq^2)*n
  chisq=sum((obscnts-expcnts)^2/expcnts)
  return(chisq)
}


compute_chisquare_2=function(x){
  freq=sum(x,na.rm=TRUE)/(2.0*sum(!is.na(x)))
  cnt0=sum(x==0,na.rm=TRUE)
  cnt1=sum(x==1,na.rm=TRUE)
  cnt2=sum(x==2,na.rm=TRUE)
  obscnts=c(cnt0,cnt1,cnt2)
  #print(obscnts)
  n=sum(obscnts)
  #here we use the built-in function for the chi-sq distribution:
  exp_probs=c((1-freq)^2,2*freq*(1-freq),freq^2) #note, here we don't multiply by n
  chisq<-chisq.test(obscnts,p=exp_probs, correct = FALSE)$statistic
  return(chisq)
}

chisqs = apply(snps,1,compute_chisquare) # code works
chisqs2 = apply(snps,1,compute_chisquare_2) # code not working

pvals = pchisq(chisqs,1,lower.tail=FALSE) # worked, since only referring to chisqs vector


# Exercise 1b
# What proportion of P-values from the test (put the vector called “pvals”) are <0.05? What proportion are <0.01? Are any <0.001?

high.pval <- subset(pvals, pvals < 0.05)
length(high.pval) / length(pvals) # proportion of pvals < 0.05

mid.pval <- subset(pvals, pvals < 0.01)
length(mid.pval) / length(pvals) # proportion of pvals < 0.01

low.pval <- subset(pvals, pvals < 0.001)
length(low.pval) / length(pvals) # proportion of pvals < 0.001


# Exercise 1c
# How many SNPs were tested for departures from Hardy-Weinberg equilibrium? Hint: How many P-values do you have? Second hint: Try using the “length” function. Save this value in the variable called “num_pval”.

num_pval <- length(pvals)
num_pval # quantity of SNPs tested

# Exercise 1d
# Say that you have “num_pval” total P-values. Assuming that the null hypothesis is true (i.e. all SNPs are in Hardy-Weinberg), the smallest P-values is expected to be 1/num_pval. The second smallest P-value is expected to be 2/num_pval. The third smallest P-value is expected to be 3/num_pval, etc. The largest P-value is expected to be num_pval/num_pval (or 1). Calculate the vector of expected P-values for the chi-square test. Save these in the vector called “exp_pvals”.

min(pvals) / num_pval
max(pvals)
min.pvals <- min(pvals)
min.pvals

num_pval # total number of pvals
exp_pvals <- rep(NA, 1, 4014) # empty vector with 1 row, 4014 col to store data
# Now try to create a loop so that it obtains the lowest pvalue + 1 and divids it by the num_pval. Then store all the data in exp.pvals vector
for(ii in 1:length(pvals)){
  exp_pvals[ii] <- (pvals[ii] + 1) / num_pval
}
exp_pvals


# Exercise 1e
# The observed P-values in the “pvals” vector are in the order that they SNPs appear across the chromosome. We need to sort them,  smallest to largest. Use the “sort” function to sort the P-values. Store them in the vector “sort_pvals”.

sort_pval <- sort(exp_pvals, decreasing = TRUE)
head(exp_pvals) # not in decreasing order?

# Exercise 1f
# In order to see what is happening with the small P-values (these are the ones we really care about), people often take the –log10(Pvalue). Find the –log10 of the observed and expected P-values. Store these in the vector “log_sort_pvals” and “log_exp_pvals”.

log_sort_pvals <- -log10(sort_pval) # these have the same data?
log_exp_pvals <- -log10(sort_pval)


# Exercise 1g
# You’re ready to make the QQ plot! Plot the “log_sort_pvals” vs. the “log_exp_pvals”

qqplot(log_exp_pvals, log_sort_pvals,
       xlab = "-log10(expected P-value)",
       ylab = "-log10(observed P-value")
