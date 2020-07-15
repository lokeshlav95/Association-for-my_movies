movies=read.csv("my_movies.csv")
View(movies)
my_movies=movies[,6:15]
View(my_movies)
install.packages("arules")
library(arules)
install.packages("arulesViz")
library(arulesViz)
attach(my_movies)
str(my_movies) #to check the type of data set 
class(my_movies)
# making rules using apriori algorithm 
#  changing support and confidence values to obtain different rules
?apriori
# Apriori algorithm for support =0.02,confidence =0.5
arules=apriori(as.matrix(my_movies),parameter=list(support=0.02,confidence=0.5))
arules # set of 108 rules

inspect((sort(arules,by="lift")))
# The lift ratio highest is 10 and the combination is if he/she will buy {Gladiator,Green.Mile}and also he/she will buy {LOTR} 
# And the lift ratio is 10,if he/she will buy  {Sixth.Sense,Gladiator,Green.Mile}  and also he/she will buy {LOTR} 

arules1=apriori(as.matrix(my_movies),parameter=list(support=0.002,confidence=0.6))
arules
inspect((sort(arules1,by="lift")))
plot(arules)
plot(arules,method="gruoped")
