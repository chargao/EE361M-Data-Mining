library(Matrix)
library(glmnet)

data = read.csv("prostate.csv")
rows = nrow(data)
lastIndex = rows/3
lastIndex = as.integer(lastIndex)
ridgeAlphas = c(0.00001, 0.0001,0.001, 0.005, 0.01, 0.05, 0.1, 1, 5, 10, 100)
lassoAlphas = c(0.0001, 0.0005, 0.001, 0.005, 0.01, 0.05, 0.1, 0.2, 0.3, 0.4, 0.5)
trainData = data[1:lastIndex,]
testData = data[lastIndex+1:rows-lastIndex,]

trainDataX = trainData
trainDataX$lcavol <- NULL
trainDataY = trainData["lcavol"]

testDataX = testData
testDataX$lcavol <- NULL
testDataY = testData["lcavol"]

trainDataX = as.matrix(trainDataX)
trainDataY = as.matrix(trainDataY)
testDataX = as.matrix(testDataX)
testDataY = as.matrix(testDataY)


bestRidgeLambda = 10
bestLassoLambda = 0.1


#part 3
ridgeModel <- glmnet(trainDataX, trainDataY, alpha=0)
lassoModel <- glmnet(trainDataX, trainDataY, alpha=1)
linearModel <- lm(trainDataY~trainDataX)


