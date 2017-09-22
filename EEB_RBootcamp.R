install.packages("APE") 
install.packages("GEIGER")
install.packages("ggplot2")
install.packages(c("plyr", "reshape2"))

# Chapter 9: Data structures in R
# Section 1: Vectors

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