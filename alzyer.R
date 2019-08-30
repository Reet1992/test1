setwd("C:/Users/Ted/Desktop/endbegin/test1")

bd2 <- read.csv("oasis_cross-sectional.csv")


#sp <-  ggplot(d3_cdr,aes(x=d3.Age, fill = factor(d3.CDR))) +
      # geom_bar(width = 0.5) +
       #xlab("Age")+
       #ylab("CDR")+
       #labs(fill="d3.CDR")


#sp + facet_grid(.~d3.CDR)

set1 <- data.frame(bd2$Age,bd2$MMSE,bd2$CDR,bd2$nWBV)

set1_cond1 <- set1[((set1$bd2.Age) > 50),]

library(dplyr)

set1_cond1_index <- mutate(set1_cond1,alz_index = ((set1_cond1$bd2.Age*set1_cond1$bd2.CDR)-set1_cond1$bd2.MMSE))

    
 plot1<- ggplot(set1_cond1_index,aes(x=set1_cond1_index$bd2.Age, fill = factor(set1_cond1_index$alz_index))) +
 geom_bar(width = 0.5) +
 xlab("Age")+
 ylab("Index")+
 labs(fill="set1_cond1_index.alz_index")
 
 
 ggplot(set1_cond1_index,aes(set1_cond1_index$bd2.Age, set1_cond1_index$alz_index)) +
   +     geom_point() +
   +     xlab("Age")+
   +     ylab("Index")+
   +     stat_smooth()+
   + facet_wrap(~set1_cond1_index$bd2.CDR)

 plot1 <- plot1 + facet_wrap( ~ bd2.CDR)
