gv<- read.csv(file= "gun_violence-data.csv", header = TRUE)

plot(gv$state,gv$n_killed, type = 'line', main = "No of people killed")

agegroup<- c("Adult", "Teen", "Child")
gv$adult_age_count<- str_count(gv$participant_age_group, agegroup[1])
gv$teen_age_count<- str_count(gv$participant_age_group, agegroup[2])
gv$child_age_count<- str_count(gv$participant_age_group, agegroup[3])

gender<- c("Female", "Male")
gv$female_count<- str_count(gv$participant_gender, gender[1])
gv$male_count<- str_count(gv$participant_gender, gender[2])

View(gv_sample)

gv_sample<- gv[1:100,]

barplot(height = gv_sample$child_age_count, main = "Number of Children involved 
        in the gun violence" )

barplot(height = gv_sample$teen_age_count, main = "Number of Teens involved 
        in the gun violence")

barplot(height = gv_sample$adult_age_count, main = "Number of Adults involved 
        in the gun violence")

# Looking at the first 100 rows of the dataset, we see that the number of children
# involed in the violence is lesser compared to Teens and Adults.

barplot(height = gv_sample$female_count, main = "Number of Female involved 
        in the gun violence")

barplot(height = gv_sample$male_count, main = "Number of Male involved 
        in the gun violence")

# Looking at the first 100 rows of the dataset, we see that the number of Female 
# involed in the violence is lesser than Male