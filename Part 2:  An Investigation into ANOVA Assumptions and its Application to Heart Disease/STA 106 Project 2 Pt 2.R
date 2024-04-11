#STA 106 Project Pt1
library(NSM3)
library(car)
library(factoextra)
library(cluster)
HDdata <- read.csv("Desktop/Classes/STA 106/heart_disease_health_indicators_BRFSS2015.csv")
HDdata

#Check equal variance
#   Ig the n(n-1) formula whatever it may be for each
#   nah he wants contingency table
#Check normality
#   I think he also wants odd ratios of smth with contingency table
#HC Tree
#   This is gonna need me to search up the r data

#print(is.data.frame(HDdata))
#print(ncol(HDdata))
#print(nrow(HDdata))

#Education, Smoker, HvyAlcoholConsump, High Bp

HighBP = HDdata$HighBP
BMIBP = (subset(HDdata, HighBP==1))$BMI
Education = HDdata$Education
BMIBP

#EdSmAlcBP1111 = subset(HDdata, Education==1 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
#EdSmAlcBP1110 = subset(HDdata, Education==1 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
#EdSmAlcBP1101 = subset(HDdata, Education==1 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
#EdSmAlcBP1100 = subset(HDdata, Education==1 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
#EdSmAlcBP1011 = subset(HDdata, Education==1 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
#EdSmAlcBP1010 = subset(HDdata, Education==1 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP1001 = subset(HDdata, Education==1 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP1000 = subset(HDdata, Education==1 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP2111 = subset(HDdata, Education==2 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
#EdSmAlcBP2110 = subset(HDdata, Education==2 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP2101 = subset(HDdata, Education==2 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP2100 = subset(HDdata, Education==2 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
#EdSmAlcBP2011 = subset(HDdata, Education==2 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
#EdSmAlcBP2010 = subset(HDdata, Education==2 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP2001 = subset(HDdata, Education==2 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP2000 = subset(HDdata, Education==2 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP3111 = subset(HDdata, Education==3 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP3110 = subset(HDdata, Education==3 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP3101 = subset(HDdata, Education==3 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP3100 = subset(HDdata, Education==3 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
#EdSmAlcBP3011 = subset(HDdata, Education==3 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP3010 = subset(HDdata, Education==3 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP3001 = subset(HDdata, Education==3 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP3000 = subset(HDdata, Education==3 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP4111 = subset(HDdata, Education==4 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP4110 = subset(HDdata, Education==4 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP4101 = subset(HDdata, Education==4 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP4100 = subset(HDdata, Education==4 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP4011 = subset(HDdata, Education==4 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP4010 = subset(HDdata, Education==4 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP4001 = subset(HDdata, Education==4 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP4000 = subset(HDdata, Education==4 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP5111 = subset(HDdata, Education==5 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP5110 = subset(HDdata, Education==5 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP5101 = subset(HDdata, Education==5 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP5100 = subset(HDdata, Education==5 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP5011 = subset(HDdata, Education==5 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP5010 = subset(HDdata, Education==5 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP5001 = subset(HDdata, Education==5 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP5000 = subset(HDdata, Education==5 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP6111 = subset(HDdata, Education==6 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP6110 = subset(HDdata, Education==6 & Smoker == 1 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP6101 = subset(HDdata, Education==6 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP6100 = subset(HDdata, Education==6 & Smoker == 1 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
EdSmAlcBP6011 = subset(HDdata, Education==6 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 1)$BMI
EdSmAlcBP6010 = subset(HDdata, Education==6 & Smoker == 0 & HvyAlcoholConsump == 1 & HighBP == 0)$BMI
EdSmAlcBP6001 = subset(HDdata, Education==6 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 1)$BMI
EdSmAlcBP6000 = subset(HDdata, Education==6 & Smoker == 0 & HvyAlcoholConsump == 0 & HighBP == 0)$BMI
Edu1 = subset(HDdata, Education==1)$BMI
Edu2 = subset(HDdata, Education==1)$BMI
Edu3 = subset(HDdata, Education==1)$BMI
Edu4 = subset(HDdata, Education==1)$BMI
Edu5 = subset(HDdata, Education==1)$BMI
Edu6 = subset(HDdata, Education==1)$BMI

#par(mfrow = c(5, 8))

#hist(EdSmAlcBP1111)
#hist(EdSmAlcBP1110)
#hist(EdSmAlcBP1101)
#hist(EdSmAlcBP1100)
#hist(EdSmAlcBP1011)
#hist(EdSmAlcBP1010)
hist(EdSmAlcBP1001)
hist(EdSmAlcBP1000)
hist(EdSmAlcBP2111)
#hist(EdSmAlcBP2110)
hist(EdSmAlcBP2101)
hist(EdSmAlcBP2100)
#hist(EdSmAlcBP2011)
#hist(EdSmAlcBP2010)
hist(EdSmAlcBP2001)
hist(EdSmAlcBP2000)
hist(EdSmAlcBP3111)
hist(EdSmAlcBP3110)
hist(EdSmAlcBP3101)
hist(EdSmAlcBP3100)
#hist(EdSmAlcBP3011)
hist(EdSmAlcBP3010)
hist(EdSmAlcBP3001)
hist(EdSmAlcBP3000)
hist(EdSmAlcBP4111)
hist(EdSmAlcBP4110)
hist(EdSmAlcBP4101)
hist(EdSmAlcBP4100)
hist(EdSmAlcBP4011)
hist(EdSmAlcBP4010)
hist(EdSmAlcBP4001)
hist(EdSmAlcBP4000)
hist(EdSmAlcBP5111)
hist(EdSmAlcBP5110)
hist(EdSmAlcBP5101)
hist(EdSmAlcBP5100)
hist(EdSmAlcBP5011)
hist(EdSmAlcBP5010)
hist(EdSmAlcBP5001)
hist(EdSmAlcBP5000)
hist(EdSmAlcBP6111)
hist(EdSmAlcBP6110)
hist(EdSmAlcBP6101)
hist(EdSmAlcBP6100)
hist(EdSmAlcBP6011)
hist(EdSmAlcBP6010)
hist(EdSmAlcBP6001)
hist(EdSmAlcBP6000)

#FILTERED FOR NORMALITY VARIABLES
#sampleNames = c('EdSmAlcBP1001', 'EdSmAlcBP1000', 
#                   'EdSmAlcBP2111', 'EdSmAlcBP2101', 'EdSmAlcBP2100', 'EdSmAlcBP2001', 'EdSmAlcBP2000', 
#                   'EdSmAlcBP3111', 'EdSmAlcBP3110', 'EdSmAlcBP3101', 'EdSmAlcBP3100', 'EdSmAlcBP3010', 'EdSmAlcBP3001', 'EdSmAlcBP3000', 
#                   'EdSmAlcBP4111', 'EdSmAlcBP4110', 'EdSmAlcBP4101', 'EdSmAlcBP4100', 'EdSmAlcBP4011', 'EdSmAlcBP4010', 'EdSmAlcBP4001', 'EdSmAlcBP4000', 
#                   'EdSmAlcBP5111', 'EdSmAlcBP5110', 'EdSmAlcBP5101', 'EdSmAlcBP5100', 'EdSmAlcBP5011', 'EdSmAlcBP5010', 'EdSmAlcBP5001', 'EdSmAlcBP5000', 
#                   'EdSmAlcBP6111', 'EdSmAlcBP6110', 'EdSmAlcBP6101', 'EdSmAlcBP6100', 'EdSmAlcBP6011', 'EdSmAlcBP6010', 'EdSmAlcBP6001', 'EdSmAlcBP6000')
bigSample =c(EdSmAlcBP1001, EdSmAlcBP1000, 
             EdSmAlcBP2111, EdSmAlcBP2101, EdSmAlcBP2100, EdSmAlcBP2001, EdSmAlcBP2000, 
             EdSmAlcBP3111, EdSmAlcBP3110, EdSmAlcBP3101, EdSmAlcBP3100, EdSmAlcBP3010, EdSmAlcBP3001, EdSmAlcBP3000, 
             EdSmAlcBP4111, EdSmAlcBP4110, EdSmAlcBP4101, EdSmAlcBP4100, EdSmAlcBP4011, EdSmAlcBP4010, EdSmAlcBP4001, EdSmAlcBP4000, 
             EdSmAlcBP5111, EdSmAlcBP5110, EdSmAlcBP5101, EdSmAlcBP5100, EdSmAlcBP5011, EdSmAlcBP5010, EdSmAlcBP5001, EdSmAlcBP5000, 
             EdSmAlcBP6111, EdSmAlcBP6110, EdSmAlcBP6101, EdSmAlcBP6100, EdSmAlcBP6011,EdSmAlcBP6010, EdSmAlcBP6001, EdSmAlcBP6000)

bigSampleNames = c(
                rep('EdSmAlcBP1001', length(EdSmAlcBP1001)), rep('EdSmAlcBP1110', length(EdSmAlcBP1000)),
                rep('EdSmAlcBP2111', length(EdSmAlcBP2111)), rep('EdSmAlcBP2101', length(EdSmAlcBP2101)), rep('EdSmAlcBP2100', length(EdSmAlcBP2100)),
                rep('EdSmAlcBP2001', length(EdSmAlcBP2001)), 
                rep('EdSmAlcBP2000', length(EdSmAlcBP2000)), 
                rep('EdSmAlcBP3111', length(EdSmAlcBP3111)), rep('EdSmAlcBP3110', length(EdSmAlcBP3110)), rep('EdSmAlcBP3101', length(EdSmAlcBP3101)),
                rep('EdSmAlcBP3100', length(EdSmAlcBP3100)), rep('EdSmAlcBP3010', length(EdSmAlcBP3010)),
                rep('EdSmAlcBP3001', length(EdSmAlcBP3001)), rep('EdSmAlcBP3110', length(EdSmAlcBP3000)),
                rep('EdSmAlcBP4111', length(EdSmAlcBP4111)), rep('EdSmAlcBP4110', length(EdSmAlcBP4110)), rep('EdSmAlcBP4101', length(EdSmAlcBP4101)),
                rep('EdSmAlcBP4100', length(EdSmAlcBP4100)), rep('EdSmAlcBP4011', length(EdSmAlcBP4011)), rep('EdSmAlcBP4010', length(EdSmAlcBP4010)),
                rep('EdSmAlcBP4001', length(EdSmAlcBP4001)), rep('EdSmAlcBP4110', length(EdSmAlcBP4000)),
                rep('EdSmAlcBP5111', length(EdSmAlcBP5111)), rep('EdSmAlcBP5110', length(EdSmAlcBP5110)), rep('EdSmAlcBP5101', length(EdSmAlcBP5101)),
                rep('EdSmAlcBP5100', length(EdSmAlcBP5100)), rep('EdSmAlcBP5011', length(EdSmAlcBP5011)), rep('EdSmAlcBP5010', length(EdSmAlcBP5010)),
                rep('EdSmAlcBP5001', length(EdSmAlcBP5001)), rep('EdSmAlcBP5110', length(EdSmAlcBP5000)),
                rep('EdSmAlcBP6111', length(EdSmAlcBP6111)), rep('EdSmAlcBP6110', length(EdSmAlcBP6110)), rep('EdSmAlcBP6101', length(EdSmAlcBP6101)),
                rep('EdSmAlcBP6100', length(EdSmAlcBP6100)), rep('EdSmAlcBP6011', length(EdSmAlcBP6011)), rep('EdSmAlcBP6010', length(EdSmAlcBP6010)),
                rep('EdSmAlcBP6001', length(EdSmAlcBP6001)), rep('EdSmAlcBP6110', length(EdSmAlcBP6000)))

#----------------
#Segregate it by education level again
edu1  = c(EdSmAlcBP1001, EdSmAlcBP1000)
edu1Names = c(rep('EdSmAlcBP1001', length(EdSmAlcBP1001)), rep('EdSmAlcBP1110', length(EdSmAlcBP1000)))
edu2 = c(EdSmAlcBP2111, EdSmAlcBP2101, EdSmAlcBP2100, EdSmAlcBP2001, EdSmAlcBP2000)
edu2Names = c(rep('EdSmAlcBP2111', length(EdSmAlcBP2111)), rep('EdSmAlcBP2101', length(EdSmAlcBP2101)), rep('EdSmAlcBP2100', length(EdSmAlcBP2100)),
              rep('EdSmAlcBP2001', length(EdSmAlcBP2001)), 
              rep('EdSmAlcBP2000', length(EdSmAlcBP2000)))
edu3 = c(EdSmAlcBP3111, EdSmAlcBP3110, EdSmAlcBP3101, EdSmAlcBP3100, EdSmAlcBP3010, EdSmAlcBP3001, EdSmAlcBP3000)
edu3Names = c( rep('EdSmAlcBP3111', length(EdSmAlcBP3111)), rep('EdSmAlcBP3110', length(EdSmAlcBP3110)), rep('EdSmAlcBP3101', length(EdSmAlcBP3101)),
               rep('EdSmAlcBP3100', length(EdSmAlcBP3100)), rep('EdSmAlcBP3010', length(EdSmAlcBP3010)),
               rep('EdSmAlcBP3001', length(EdSmAlcBP3001)), rep('EdSmAlcBP3110', length(EdSmAlcBP3000)))
edu4 = c(EdSmAlcBP4111, EdSmAlcBP4110, EdSmAlcBP4101, EdSmAlcBP4100, EdSmAlcBP4011, EdSmAlcBP4010, EdSmAlcBP4001, EdSmAlcBP4000)
edu4Names = c(rep('EdSmAlcBP4111', length(EdSmAlcBP4111)), rep('EdSmAlcBP4110', length(EdSmAlcBP4110)), rep('EdSmAlcBP4101', length(EdSmAlcBP4101)),
              rep('EdSmAlcBP4100', length(EdSmAlcBP4100)), rep('EdSmAlcBP4011', length(EdSmAlcBP4011)), rep('EdSmAlcBP4010', length(EdSmAlcBP4010)),
              rep('EdSmAlcBP4001', length(EdSmAlcBP4001)), rep('EdSmAlcBP4110', length(EdSmAlcBP4000)))
edu5 = c(EdSmAlcBP5111, EdSmAlcBP5110, EdSmAlcBP5101, EdSmAlcBP5100, EdSmAlcBP5011, EdSmAlcBP5010, EdSmAlcBP5001, EdSmAlcBP5000)
edu5Names = c(rep('EdSmAlcBP5111', length(EdSmAlcBP5111)), rep('EdSmAlcBP5110', length(EdSmAlcBP5110)), rep('EdSmAlcBP5101', length(EdSmAlcBP5101)),
              rep('EdSmAlcBP5100', length(EdSmAlcBP5100)), rep('EdSmAlcBP5011', length(EdSmAlcBP5011)), rep('EdSmAlcBP5010', length(EdSmAlcBP5010)),
              rep('EdSmAlcBP5001', length(EdSmAlcBP5001)), rep('EdSmAlcBP5110', length(EdSmAlcBP5000)))
edu6 = c(EdSmAlcBP6111, EdSmAlcBP6110, EdSmAlcBP6101, EdSmAlcBP6100, EdSmAlcBP6011,EdSmAlcBP6010, EdSmAlcBP6001, EdSmAlcBP6000)
edu6Names = c(rep('EdSmAlcBP6111', length(EdSmAlcBP6111)), rep('EdSmAlcBP6110', length(EdSmAlcBP6110)), rep('EdSmAlcBP6101', length(EdSmAlcBP6101)),
              rep('EdSmAlcBP6100', length(EdSmAlcBP6100)), rep('EdSmAlcBP6011', length(EdSmAlcBP6011)), rep('EdSmAlcBP6010', length(EdSmAlcBP6010)),
              rep('EdSmAlcBP6001', length(EdSmAlcBP6001)), rep('EdSmAlcBP6110', length(EdSmAlcBP6000)))
dfEd <-data.frame(edu1Names, edu1)

clusters = hclust(dist(dfEd))
bigDF <- data.frame(bigSampleNames, bigSample)
clusters = hclust(dist(bigDF))

plot(clusters, xlab='', main='Dendrogram')
clusterCut <- cutree(clusters, 10)
rect.hclust(clusters, k=10)

table(clusterCut, dfEd$edu6Names)
#-------------
df <- data.frame(bigSampleNames, bigSample)
df = as.data.frame(df)
oneway.test(bigSample ~ bigSampleNames, data=df, var.equal = TRUE)
fligner.test(bigSample ~ bigSampleNames, data = df)
fit1 = aov(bigSample ~ bigSampleNames, data=df)
fitted(fit1)
residuals(fit1)
cbind(df, 'fitted value' = fitted(fit1), 'residuals' = residuals(fit1))
anova(fit1)
tukey = TukeyHSD(fit1, conf.level=0.95)
tukey
#I think the new move is to create multiple tukey plots but only do it with stuff like
#"to check in each education level or smth and create new data frames based on separating those variables
par(mfrow=c(1,1))
plot(tukey)
#pKW(x=bigSample, g=bigSampleNames)


#UNFILTERED VARIABLES
#sampleNames = c('EdSmAlcBP1111', 'EdSmAlcBP1110', 'EdSmAlcBP1101', 'EdSmAlcBP1100', 'EdSmAlcBP1011', 'EdSmAlcBP1010', 'EdSmAlcBP1001', 'EdSmAlcBP1000', 
#                   'EdSmAlcBP2111', 'EdSmAlcBP2110', 'EdSmAlcBP2101', 'EdSmAlcBP2100', 'EdSmAlcBP2011', 'EdSmAlcBP2010', 'EdSmAlcBP2001', 'EdSmAlcBP2000', 
#                   'EdSmAlcBP3111', 'EdSmAlcBP3110', 'EdSmAlcBP3101', 'EdSmAlcBP3100', 'EdSmAlcBP3011', 'EdSmAlcBP3010', 'EdSmAlcBP3001', 'EdSmAlcBP3000', 
#                   'EdSmAlcBP4111', 'EdSmAlcBP4110', 'EdSmAlcBP4101', 'EdSmAlcBP4100', 'EdSmAlcBP4011', 'EdSmAlcBP4010', 'EdSmAlcBP4001', 'EdSmAlcBP4000', 
#                   'EdSmAlcBP5111', 'EdSmAlcBP5110', 'EdSmAlcBP5101', 'EdSmAlcBP5100', 'EdSmAlcBP5011', 'EdSmAlcBP5010', 'EdSmAlcBP5001', 'EdSmAlcBP5000', 
#                   'EdSmAlcBP6111', 'EdSmAlcBP6110', 'EdSmAlcBP6101', 'EdSmAlcBP6100', 'EdSmAlcBP6011', 'EdSmAlcBP6010', 'EdSmAlcBP6001', 'EdSmAlcBP6000')

#bigSample =c(EdSmAlcBP1111, EdSmAlcBP1110, EdSmAlcBP1101, EdSmAlcBP1100, EdSmAlcBP1011, EdSmAlcBP1010, EdSmAlcBP1001, EdSmAlcBP1000, 
#             EdSmAlcBP2111, EdSmAlcBP2110, EdSmAlcBP2101, EdSmAlcBP2100, EdSmAlcBP2011, EdSmAlcBP2010, EdSmAlcBP2001, EdSmAlcBP2000, 
#             EdSmAlcBP3111, EdSmAlcBP3110, EdSmAlcBP3101, EdSmAlcBP3100, EdSmAlcBP3011, EdSmAlcBP3010, EdSmAlcBP3001, EdSmAlcBP3000, 
#             EdSmAlcBP4111, EdSmAlcBP4110, EdSmAlcBP4101, EdSmAlcBP4100, EdSmAlcBP4011, EdSmAlcBP4010, EdSmAlcBP4001, EdSmAlcBP4000, 
#             EdSmAlcBP5111, EdSmAlcBP5110, EdSmAlcBP5101, EdSmAlcBP5100, EdSmAlcBP5011, EdSmAlcBP5010, EdSmAlcBP5001, EdSmAlcBP5000, 
#             EdSmAlcBP6111, EdSmAlcBP6110, EdSmAlcBP6101, EdSmAlcBP6100, EdSmAlcBP6011,EdSmAlcBP6010, EdSmAlcBP6001, EdSmAlcBP6000)

#bigSampleNames = c(rep('EdSmAlcBP1111', length(EdSmAlcBP1111)), rep('EdSmAlcBP1110', length(EdSmAlcBP1110)), rep('EdSmAlcBP1101', length(EdSmAlcBP1101)),
#                rep('EdSmAlcBP1100', length(EdSmAlcBP1100)), rep('EdSmAlcBP1011', length(EdSmAlcBP1011)), rep('EdSmAlcBP1010', length(EdSmAlcBP1010)),
#                rep('EdSmAlcBP1001', length(EdSmAlcBP1001)), rep('EdSmAlcBP1110', length(EdSmAlcBP1000)),
#                rep('EdSmAlcBP2111', length(EdSmAlcBP2111)), rep('EdSmAlcBP2110', length(EdSmAlcBP2110)), rep('EdSmAlcBP2101', length(EdSmAlcBP2101)),
#                rep('EdSmAlcBP2100', length(EdSmAlcBP2100)), rep('EdSmAlcBP2011', length(EdSmAlcBP2011)), rep('EdSmAlcBP2010', length(EdSmAlcBP2010)),
#                rep('EdSmAlcBP2001', length(EdSmAlcBP2001)), rep('EdSmAlcBP2110', length(EdSmAlcBP2000)),
#                rep('EdSmAlcBP3111', length(EdSmAlcBP3111)), rep('EdSmAlcBP3110', length(EdSmAlcBP3110)), rep('EdSmAlcBP3101', length(EdSmAlcBP3101)),
#                rep('EdSmAlcBP3100', length(EdSmAlcBP3100)), rep('EdSmAlcBP3011', length(EdSmAlcBP3011)), rep('EdSmAlcBP3010', length(EdSmAlcBP3010)),
#                rep('EdSmAlcBP3001', length(EdSmAlcBP3001)), rep('EdSmAlcBP3110', length(EdSmAlcBP3000)),
#                rep('EdSmAlcBP4111', length(EdSmAlcBP4111)), rep('EdSmAlcBP4110', length(EdSmAlcBP4110)), rep('EdSmAlcBP4101', length(EdSmAlcBP4101)),
#                rep('EdSmAlcBP4100', length(EdSmAlcBP4100)), rep('EdSmAlcBP4011', length(EdSmAlcBP4011)), rep('EdSmAlcBP4010', length(EdSmAlcBP4010)),
#                rep('EdSmAlcBP4001', length(EdSmAlcBP4001)), rep('EdSmAlcBP4110', length(EdSmAlcBP4000)),
#                rep('EdSmAlcBP5111', length(EdSmAlcBP5111)), rep('EdSmAlcBP5110', length(EdSmAlcBP5110)), rep('EdSmAlcBP5101', length(EdSmAlcBP5101)),
#                rep('EdSmAlcBP5100', length(EdSmAlcBP5100)), rep('EdSmAlcBP5011', length(EdSmAlcBP5011)), rep('EdSmAlcBP5010', length(EdSmAlcBP5010)),
#                rep('EdSmAlcBP5001', length(EdSmAlcBP5001)), rep('EdSmAlcBP5110', length(EdSmAlcBP5000)),
#                rep('EdSmAlcBP6111', length(EdSmAlcBP6111)), rep('EdSmAlcBP6110', length(EdSmAlcBP6110)), rep('EdSmAlcBP6101', length(EdSmAlcBP6101)),
#                rep('EdSmAlcBP6100', length(EdSmAlcBP6100)), rep('EdSmAlcBP6011', length(EdSmAlcBP6011)), rep('EdSmAlcBP6010', length(EdSmAlcBP6010)),
#                rep('EdSmAlcBP6001', length(EdSmAlcBP6001)), rep('EdSmAlcBP6110', length(EdSmAlcBP6000)))
