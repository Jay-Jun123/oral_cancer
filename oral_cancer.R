########## packages install ##########
#.libPaths("C:/Program Files/R/R-4.1.2/library")

install.packages('stringr')
install.packages('psych')
install.packages('dplyr')

library(stringr)
library(psych)
library(dplyr)

########## make feature data csv ##########
# make oral, sex, smoke, drink, age variable
set.seed(9)
patient = 1:546
oral = rbinom(n=546,size=1,prob=0.33)
sex = rbinom(n=546,size=1,prob=0.5)
smoke = rbinom(n=546,size=1,prob=0.2)
drink = rbinom(n=546,size=1,prob=0.4)
age = sample(x=10:70, size=546, replace=T)

# make first dataframe
feature = data.frame(patient,oral,sex,age,smoke,drink)
feature

# make csv file
write.csv(feature,'D:\\github\\oral_cancer\\data\\sample_feature.csv', row.names = F)


########## make polar data csv ##########
# make polar 1-82
polar = data.frame(patient)
for (i in 1:82){
  set.seed(i)
  polar_sample = sample(x=i^2+0:i^2+20, size=546, replace=T)
  polar = cbind(polar, polar_sample)
  names(polar)[i+1] <- gsub(" ","",paste('polar_',i))
}
print(polar)

# make csv file
write.csv(polar,'D:\\github\\oral_cancer\\data\\sample_polar.csv', row.names = F)


########## merge data ##########
feature = read.csv('D:\\github\\oral_cancer\\data\\sample_feature.csv')
polar = read.csv('D:\\github\\oral_cancer\\data\\sample_polar.csv')

oral = merge(feature, polar, by='patient')
oral

# Frequency
table(oral$oral)
table(oral$sex)
table(oral$smoke)
table(oral$drink)

# description(mean, std, median, q1, q3)
describe(oral$age)

oral_columns = names(oral)[7:88]
oral_columns

oral_summary = summary(oral)
oral_summary

### 분석 결과를 csv로 추출할 수 있게 작성
