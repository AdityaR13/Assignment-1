store <- as.data.frame(Store24_A_)
summary(store)
library(psych)
describe(store$Profit)
describe(store$MTenure)
describe(store$CTenure)
library(dplyr)
store1 <- select(store, store, Sales, Profit, MTenure, CTenure)
newdata <- store1[order(store1$Profit), ]
names(newdata)[1] <- "StoreID"
newdata[1:10, ]
newdata[66:75, ]
scatterplot(store$Profit ~ store$MTenure, main = "Scatterplot of Profit vs. MTenure", xlab = "MTenure", ylab = "Profit")
scatterplot(store$Profit ~ store$CTenure, main = "Scatterplot of Profit vs. CTenure", xlab = "CTenure", ylab = "Profit")
cor(store)
cor(store$Profit, store$MTenure)
cor(store$Profit, store$CTenure)
library(corrgram)
corrgram(store, order = TRUE, lower.panel = panel.shade, upper.panel = panel.pie, text.panel = panel.txt, main = "Corrgram of Store variables")
cor.test(store$Profit, store$MTenure)
cor.test(store$Profit, store$CTenure)
fit <- lm(Profit ~ MTenure + CTenure + Comp + Pop + PedCount + Res + Hours24 + Visibility, data = store)
summary(fit)

