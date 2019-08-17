print(" now it lives on GitHub")

trainL1 <- read.csv("train.csv", header = TRUE)
testL2 <- read.csv("test.csv", header = TRUE)

test.survived <- data.frame(Survived=rep("None",nrow(testL2)),testL2[,])

data.combined <- rbind(trainL1,test.survived)

str(data.combined)

plot(data.combined$Age,data.combined$Fare)

ggplot(trainL1,aes(x=Pclass,fill = factor(Survived)))+
  geom_bar(width = 0.5)+
  xlab("Pclass")+
  ylab("Totalcount")
 
