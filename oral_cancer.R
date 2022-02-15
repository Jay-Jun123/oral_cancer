########## make feature data csv ##########
# make oral, sex, smoke, drink, age variable
set.seed(9)
patient = 1:546
oral = rbinom(n=546,size=1,prob=0.33)
sex = rbinom(n=546,size=1,prob=0.5)
smoke = rbinom(n=546,size=1,prob=0.2)
drink = rbinom(n=546,size=1,prob=0.4)
age = sample(x=10:70, size=546, replace=T)
table(patient)

# make first dataframe
feature = data.frame(patient,oral,sex,age,smoke,drink)
feature

# make csv file
write.csv(feature,'D:\\github\\oral cancer\\sample_feature.csv')


########## make polar data csv ##########
# make polar 1-82
polar = data.frame(patient)
for (i in 1:82){
  set.seed(i)
  polar_sample = sample(x=i^2+0:i^2+20, size=546, replace=T)
  polar = cbind(polar, polar_sample)
  names(polar)[i+1] <- paste('polar_',i)
}
print(polar)

# make csv file
write.csv(polar,'D:\\github\\oral cancer\\sample_polar.csv')
