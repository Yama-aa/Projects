# Finding Pareto optimal solution set 
# https://en.wikipedia.org/wiki/Pareto_efficiency

library(ggplot2)

# n^2 solution
x <- runif(1000)
y <- runif(1000)
df <- data.frame(x, y)
pareto = 1:length(x)

for(i in 1:length(x)){
  for (n in 1:length(x)){
    if(x[n]>=x[i] & y[n]>=y[i] & !(x[n]==x[i] & y[n]==y[i])){
      pareto[i]=NA
      break}}}

df$pareto <- is.na(pareto)
ggplot(df, aes(x=x, y=y, color=pareto)) + geom_point()

# nlogn solution
x <- runif(1000)
y <- runif(1000)
x.sort <- sort(x, decreasing=T)
y.sort <- y[order(x, decreasing=T)]
df <- data.frame(x.sort, y.sort)
is.pareto = rep(0, length(x))
is.pareto[1]=T
ymax <- y.sort[1]

for (n in 2:length(x)) {
  if(y.sort[n]>ymax){
    ymax<-y.sort[n]
    is.pareto[n]=T}}

df$pareto <- is.pareto==T
ggplot(df, aes(x=x.sort, y=y.sort, color=pareto)) + geom_point()
