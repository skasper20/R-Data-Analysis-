#cleaning data
install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggplot2")
library(dplyr)
library(ggplot2)
#removing ,and "" from the dataset so that gamesplayed would be numeric 
removeddata<-ARAM_Golbal_September_Status<-as.numeric(gsub(",","",ARAM_Golbal_September_Status,fixed = TRUE))
head(removeddata)
#summary statistics
summary_stats<-summary(ARAM_EUW_September_Status)  
head(summary_stat)
#identify the numeric coloms 
numeric_columns<-names(ARAM_EUW_September_Status)[sapply(ARAM_EUW_September_Status,is.numeric)]
print(numeric_columns)
#dataset with only numeric values 
numeric_data<-ARAM_EUW_September_Status[,c("Win.Rate","Pick.Rate","CS","Games.played")]
#corrlelation matric 
correlation_matrix<-cor(numeric_data)
#top ten champions by games played 
top_ten_champsgp<-ARAM_EUW_September_Status%>%
arrange(desc(Games.played))%>%
head(10)  
top_ten_champs
#top ten champions by win rate 
top_ten_champs_by_win_rate<-ARAM_EUW_September_Status%>%
arrange(desc(Win.Rate))%>%
  head(10)
top_ten_champs_by_win_rate
#create the histogram   
win_rate_histi<-hist(ARAM_EUW_September_Status$Win.Rate,breaks = 10,xlab = "Win Rate",ylab = "Frequency",main = "Distribution of Win Rate")
cs_hist<-hist(ARAM_EUW_September_Status$CS,breaks = 10,xlab = "CS",ylab = "Frequency",main = "Distribution of CS")
#Create the scatter plot  
plot(ARAM_EUW_September_Status$Gold,ARAM_EUW_September_Status$CS,xlab = "Gold",ylab = "CS",main = "Relationship between Gold and CS")
#Define the calculate tier functions
calculate_tier <- function(tier_value) {
  if (tier_value >= 1.75) {
    return("S Tier")
  } else if (tier_value >= 1.4) {
    return("A Tier")
  } else if (tier_value >= 1.2) {
    return("B Tier")
  } else if (tier_value >= 1.05) {
    return("C Tier")
  } else {
    return("D Tier")
  }
#Convert the columns to the appropriate data types
  ARAM_EUW_September_Status$Win.Rate<- as.numeric(ARAM_EUW_September_Status$Win.Rate)
  ARAM_EUW_September_Status$Pick.Rate <- as.numeric(ARAM_EUW_September_Status$Pick.Rate)
  ARAM_EUW_September_Status$KDA <- as.numeric(as.character(ARAM_EUW_September_Status$KDA))
ARAM_EUW_September_Status$TierValue<-(ARAM_EUW_September_Status$Win.Rate+ARAM_EUW_September_Status$Pick.Rate+ARAM_EUW_September_Status$KDA)/3
#Apply the calculate tier function to create the "Tier" column 
ARAM_EUW_September_Status$Tier<-sapply(ARAM_EUW_September_Status$TierValue,calculate_tier)
#Create a new data frame with selected columns
result_df<-ARAM_EUW_September_Status[c("Champion","Tier","Tier Value")]
#Define the order of the tiers 
tier_orders<-c("S Tier","A Tier","B Tier", "C Tier", "D Tier")
#Set "Tier" coloums as ordered factor
result_df$Tier<-factor(result_df$Tier,levels = tier_orders,ordered = TRUE)
#Sort the data frame by "Tiers" coloum in decenting order 
result_df<-result_df[order(result_df$Tier,decreasing = TRUE)]
View(result_df)
#linear reggression between pick rate and win rate 
linear_model<-lm(Win.Rate~Pick.Rate,data = numeric_data)
summary(linear_model)
plot(numeric_data$Pick.Rate,numeric_data$Win.Rate,xlab = "Pick Rate",ylab = "Win Rate",main = "Linear Regression between pick rate and win rate")
abline(linear_model,col="red")
