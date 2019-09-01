setwd("C:/Users/Ted/Desktop/endbegin/test1/Cardio/")

data <- read.csv("Cardiotocographic.csv")

data$NSP <- as.factor(data$NSP)

set.seed(1234)

#partition data into test and validate

pd <- sample(2,nrow(data),replace = TRUE,prob = c(0.8,0.2))
train1 <- data[pd==1,]
validate1 <- data[pd==2,]



library(partykit)

tree <- ctree(NSP~LB+AC+FM,data = train1, controls = ctree_control(mincriterion = 0.99,minsplit = 500))
tree
plot(tree)  

##predict the tree score again the validate data##

predict(tree,validate1,type = "prob")


##misclassification for the train data##

tab <- table(predict(tree),train1$NSP)
print(tab)

1-sum(diag(tab))/sum(tab)







