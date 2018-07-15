# Finding Pareto optimal set

library(ggplot2)

# n^2 solution
# generate 1000 2D random points, uniformly distributed
x <- runif(1000)
y <- runif(1000)
df <- data.frame(x, y)
pareto = 1:length(x)
# loop through all the points to check which are pareto optimal
for(i in 1:length(x)){
  for (n in 1:length(x)){
    if(x[n]>=x[i] & y[n]>=y[i] & !(x[n]==x[i] & y[n]==y[i])){
      pareto[i]=NA
      break}}}
# add a colomn of the pareto optimal set to the data frame
df$pareto <- is.na(pareto)
# visualization
ggplot(df, aes(x=x, y=y, color=pareto)) + geom_point()

# nlogn solution
# generate 1000 2D random points, uniformly distributed
x <- runif(1000)
y <- runif(1000)
# order the points
x.sort <- sort(x, decreasing=T)
y.sort <- y[order(x, decreasing=T)]
df <- data.frame(x.sort, y.sort)
is.pareto = rep(0, length(x))
is.pareto[1]=T
#set ymax to the y value of the maximal x value
ymax <- y.sort[1]
# loop through all the points to check which are pareto optimal
for (n in 2:length(x)) {
  if(y.sort[n]>ymax){
    ymax<-y.sort[n]
    is.pareto[n]=T}}
# add a colomn of the pareto optimal set to the data frame
df$pareto <- is.pareto==T
# visualization
ggplot(df, aes(x=x.sort, y=y.sort, color=pareto)) + geom_point()
