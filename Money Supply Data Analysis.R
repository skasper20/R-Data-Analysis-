#Descriptive statistics 
#mean of government net borrowing in millions 
mean(debt$`General government net borrowing (£ million)`)
#median of government net borrowing in millions
median(debt$`General government net borrowing (£ million)`)
#mode of government net borrowing in millions
mode(debt$`General government net borrowing (£ million)`)
#mean of government gross consolidated debt in millions  
mean(debt$`General government gross consolidated debt at nominal value (£ million)`)
#median of government gross consolidated debt
median(debt$`General government gross consolidated debt at nominal value (£ million)`)
#mode of government gross consolidated debt
mode(debt$`General government gross consolidated debt at nominal value (£ million)`)
#mean GDP at Current Market Price 
mean(debt$`Gross domestic product (GDP) at current market prices (£ million) [note 2]`)
#median GDP at Current Market Price 
median(debt$`Gross domestic product (GDP) at current market prices (£ million) [note 2]`)
#mode GDP at Current Market Price 
mode(debt$`Gross domestic product (GDP) at current market prices (£ million) [note 2]`)
#mean Net borrowing as a %
mean(debt$`Net borrowing as a percentage of GDP (percentage points) [note 2]`)
#median  Net borrowing as a %
median(debt$`Net borrowing as a percentage of GDP (percentage points) [note 2]`)
#mode  Net borrowing as a %
mode(debt$`Net borrowing as a percentage of GDP (percentage points) [note 2]`)


#correlation test 
cor.test(debt$`Gross domestic product (GDP) at current market prices (£ million) [note 2]`,debt$`General government gross consolidated debt at nominal value (£ million)`)

#persentatage change 

#Data Visualisati
library(ggplot2)
graphofborrowing<-plot(debt$`Time period`,debt$`General government net borrowing (£ million)`,xlab="Years",ylab="Government net borrowing in Millions", main="Government net borrowing from 1992-2022")
graphofconsolidateddebt<-plot(debt$`Time period`,debt$`General government gross consolidated debt at nominal value (£ million)`,type = "b", xlab = "Years",ylab="Government gross debt in millions", main="Government Gross Debt over 1992,2022")
graphofGDP<-plot(debt$`Time period`,debt$`Gross domestic product (GDP) at current market prices (£ million) [note 2]`,xlab = "Years",ylab = "Gross Domestic Product (GDP)", main = "Gross Domestic Product GDP from Years 1992-2022")
