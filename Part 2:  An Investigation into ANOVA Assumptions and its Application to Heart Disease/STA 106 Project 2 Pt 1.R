#STA 106 Project Pt1
library(VGAM)
library(factoextra)
library(cluster)
HDdata <- read.csv("Desktop/Classes/STA 106/heart_disease_health_indicators_BRFSS2015.csv")

#------------Hierarchical clustering
#Best choice for doing dendrogram is to calculate samples but to find community structures
#is it possible to find which groups hold which samples
#bc if each like main cluster primarily holds from sample 3 while the other 2 are mixed then yknow

sample1 = rnorm(30,mean=mu, sd=sqrt(1))
sample2 = rnorm(30,mean=mu + 5, sd=sqrt(1))
sample3 = rnorm(30,mean=mu, sd=sqrt(1))
sample1 = cbind(sample1, 1)
sample2 = cbind(sample2, 2)
sample3 = cbind(sample3, 3)
mydata = rbind(sample1, sample2, sample3)
colnames(mydata) = c("sample data", "sample")
mydata = as.data.frame(mydata)
mydata

gap_stat <- clusGap(mydata, FUN = hcut, K.max = 10,hc_method = "average")
fviz_gap_stat(gap_stat)

clusters = hclust(dist(mydata))

plot(clusters, xlab='', main='Dendrogram')
clusterCut <- cutree(clusters, 2)
rect.hclust(clusters, k=2)

table(clusterCut, mydata$sample)

mu = 0
numSamples = 100


#------------------------------------------- dif distributions
n = 1000
mu = 0
sigma = 1
numSamples = 100

powerDeterm = function(mu, sigma){
  rejectCount = 0
  #correctCount = 0
  for(x in 1:numSamples){
    #determine sample based on given distributions with a mean parameter
    
    #sample1 = rcauchy(100,location=mu+0.5, scale=3)
    #sample2 = rcauchy(100,location=mu, scale=3)
    #sample3 = rcauchy(100,location=mu, scale=3)
    
    samples = c(rep("sample1", 100), rep("sample2", 100), rep("sample3", 100))
    bigSample = c(sample1, sample2, sample3)
    df <- data.frame(samples, bigSample)
    anovaInfo = oneway.test(bigSample ~ samples, data=df, var.equal = TRUE)
    if(anovaInfo$p.value < 0.05){
      rejectCount = rejectCount + 1
    }
  }
  return(rejectCount/numSamples)
  
  #return proportion of correct rejection
  #RN since mu is the same, if it rejects it it's wrong
  #power = rejectCount/numSamples
  #return(power)
}

powerCount = 0
for(x in 1:numDist){
  check1 = powerDeterm(mu, sigma)
  powerCount = powerCount + check1
}
Power = powerCount/numDist
Power

#----------------------------------------- Imbalances

mu = 0
numSamples = 100
powerDeterm = function(mu, sigma){
  rejectCount = 0
  #correctCount = 0
  for(x in 1:numSamples){
    #determine sample based on given distributions with a mean parameter
    
    #WEIRD SIZE (and in this case, dif mu)
    #sample1 = rnorm(100,mean=mu, sd=sqrt(1))
    #sample2 = rnorm(100,mean=mu+1, sd=sqrt(20))
    #(and mu gets weirder)
    #sample3 = rnorm(100,mean=mu, sd=sqrt(1))
    #power drops significantly
    #but when mu >1, it's a lot more clearly defined
    #sample4 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample5 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample6 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample7 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample8 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample9 = rnorm(100000,mean=mu, sd=sqrt(1))
    #sample10 = rnorm(100000,mean=mu, sd=sqrt(1))
    
    hist(sample1)
    samples = c(rep("sample1", 100), rep("sample2", 100), rep("sample3", 100))
    #rep("sample4", 100000), rep("sample5", 100000), rep("sample6", 100000),
    #rep("sample7", 100000), rep("sample8", 100000), rep("sample9", 100000),
    #rep("sample10", 100000))
    bigSample = c(sample1, sample2, sample3)
    #sample4, sample5, sample6,
    #sample7, sample8, sample9, sample10)
    df <- data.frame(samples, bigSample)
    anovaInfo = oneway.test(bigSample ~ samples, data=df, var.equal = TRUE)
    if(anovaInfo$p.value < 0.05){
      rejectCount = rejectCount + 1
    }
  }
  return(rejectCount/numSamples)
  
  #return proportion of correct rejection
  #RN since mu is the same, if it rejects it it's wrong
  #power = rejectCount/numSamples
  #return(power)
}

powerCount = 0
for(x in 1:numDist){
  check1 = powerDeterm(mu, sigma)
  powerCount = powerCount + check1
}
Power = powerCount/numDist
Power

