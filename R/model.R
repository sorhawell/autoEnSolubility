library(randomForest)

setwd("C:/Users/sowe/Documents/GitHub/autoEnSolubility/R")
Data =read.csv("../data/palmer.moe.txt")
names(Data)

#define dataset
y = Data[,"LogS.mols.L."] #the target
#X = Data[,which(names(Data)=="apol"):dim(Data)[2]]

#option A
## use all features from Molecular operating software
## X = Data[,which(names(Data)=="apol"):dim(Data)[2]]
## X = X[,!names(X)%in%"logS"]

#option B
#use specific reasonable subset of features
X = Data[,c("SlogP",  #the features
         "SMR"           ,
         "PEOE_RPC..1"   ,
         "PEOE_VSA_FPOL" ,
         "PEOE_VSA_FNEG" ,
         "TPSA"          ,
         "a_acc"         ,
         "a_don"         ,
         "weinerPol"     ,
         "a_aro"         ,
         "b_rotR"        ,
         "chi1_C")]



rf = randomForest(X,y,importance=T,nperm=1,ntree=250)

print(rf)
#produce encoders that can lower the mean square error even further!
