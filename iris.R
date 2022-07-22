View(iris)
ggplot(iris, aes(x=Sepal.Length, y=Sepal.Width, fill=Species))+ geom_tile()
ggplot(iris, aes(x=Petal.Length, y=Petal.Width, fill=Species))+ geom_tile()

#install packages
install.packages(c("stats", "dplyr","randomForest"))

nrow(iris)
#index to split the data
index = sample(2, nrow(iris), replace=TRUE, prob=(c(0.7,0.3)))

#trainingData
Training = iris[index==1,]  # 70% of the iris data

Testing = iris[index==2,]   #30% of the iris data


RFM = randomForest(Species~., data=Training)

newIris <- data.frame(Sepal.Length= 4.0, Sepal.Width=3.5, Petal.Length=1.5, Petal.Width=0.25)

predict(RFM, newIris) # output prediction based off of single iris

SpecPred <- predict(RFM, Testing) #output prediction for test data set
Testing$Species_Pred= SpecPred
View(Testing)

