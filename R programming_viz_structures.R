#**************************# 
## 1 Data Visualisation I ## 
#**************************# 

## (i) Load the MASS library, and access the dataset quine 
library(MASS) 

## (ii) What command is used to access the description of the dataset? 
?quine

## (iii) Use the par(mfrow = c(1, 2)) command to help you to create two histograms on 
## a single panel showing the number of days absent, with one histogram displaying the 
## data for Aboriginal students and one histogram displaying the data for non-Aboriginal 
## students (just use the basic hist(data) command for these histograms) 
## creating subset for number of days absent for Aborginal and non-Aborginal students 

par(mfrow = c(1,2))
a <- subset(quine, quine$Eth == 'A', select = c(1,5))  ## Aborginal 
hist(a$Days)
an<- subset(quine, quine$Eth == 'N', select = c(1,5))  ## Non-Aborginal 
hist(an$Days)

## include an argument that means all histograms have the same y-axis (and so 
## can be compared easily)

hist(a$Days , ylab = 'Ethinicity')
hist(an$Days, ylab = 'Ethinicity')

## change the default position of the numbers on the y-axis, so that they are horizontal 
## rather than vertical

par(mfrow = c(1,2), las =1)
hist(a$Days, ylab = 'Ethinicity')
hist(an$Days, ylab = 'Ethinicity')

## change the x-axis labels to something sensible

hist(a$Days, xlab = 'Number of Days Absent', ylab = 'Ethinicity')
hist(an$Days, xlab = 'Number of Days Absent', ylab = 'Ethinicity')

## include a sensible main title

hist(a$Days, main = 'Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity')
hist(an$Days, main = 'Non Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity')

## colour each histogram differentlly

hist(a$Days, main = 'Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity', col = 'red')
hist(an$Days, main = 'Non Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity', col = 'green')

## experiment with the breaks argument to see which value best suits the data

hist(a$Days, breaks = 20, main = 'Absenteeism Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity', col = 'red')
hist(an$Days, breaks = 20, main = 'Absenteeism Non Aboriginal Students', xlab = 'Number of Days Absent', ylab = 'Ethinicity', col = 'green')

## (v) Comment on whether you think there is any evidence of a difference between the two groups

## answer: From the graphs it is evident that the Absenteeism is less among Non Aborginal Students

#***************************# 
## 1 Data Visualisation II ## 
#***************************#

## (i) Load the MASS library, and access the dataset crabs. Read the help ???le to see what the dataset contains. 

library(MASS)
crabs
?crabs

## (ii) Use the par(mfrow = c(1, 2)) command to help you to create two boxplots on a single panel. The ???rst 
## should contain the rear width for male and female crabs separately, and the second should contain the 
## rear width for blue and orange crabs separately. You should investigate arguments in the boxplot() 
## function to make your plots look 'nice': think of including labels, improving the axes, including a 
## main title, a legend, colour, and anything else you think will improve the plot.

boxplot(crabs$RW~crabs$sex, main = 'Rear Width of Male and Female Crabs', xlab = 'Male & Female', ylab = 'Rear Width', col = 'Green')

legend("topright", legend = c("F - Female", "M - Male"), col = "red")

boxplot(crabs$RW~crabs$sp, main = 'Rear Width of Blue and Orange Crabs', xlab = 'Color of Crabs', ylab = 'Rear Width', col = 'Red')

legend("topright", legend = c("B - Blue Crabs", "O - Orange Crabs"), col = "red")

## (iii) Comment on the two plots: what's the general relationship between rear width of the crabs and the 
## two categorical variables?

## Answer: The rear width for female crabs is greater when compared to male crabs. comparing Blue and Orange crabs
## we see that the rare width for the Orange crabs is greater 

## (iv) Use the par(mfrow = c(1, 1)) command to return to a one plot/one panel setup. Can you ???nd the 
## command to produce a boxplot which shows the data split by sex and species? (i.e., you should have 
## four boxplots in a single plotting window - blue female crabs, blue male crabs, orange female crabs
## and orange male crabs). Again, make this plot look 'nice'.

par(mfrow = c(1, 1))
library(ggplot2)

boxplot(crabs$RW~crabs$sp+crabs$sex, data=crabs, col = c('blue', 'orange', 'blue', 'orange'))
title("Comparing the Rear Width of Crabs")


#****************************#
## 3 Programming Structures ##
#****************************#

## (i) Set x to be 2 and y to be 10. Write a while() loop which prints x+y and then squares both x and y.
## The loop should stop when either x is greater than or equal to 40, or y is greater than or equal 
## to 1000.

x<-2
y<-10
a<-0
while(x<=40 | y<=1000)
{
  a=x+y
  x<-x*x
  y<-y*y
  print(a)
}

## answer: 12 104 10016

## (ii) Create a matrix of size 100 x 30. Write a double for() loop which ???lls this matrix with values
## equal to the product of the row index by the column index. e.g., the [1, 1] entry should be 1 × 1 = 1,
## the [3, 4] entry should be 3 × 4 = 12 etc

M<- matrix(nrow= 100, ncol= 30)

for (i in 1:100) {
  for (j in 1:30) {
    M[i,j]=i*j
    j=j+1
  }
  i=i+1
}

View(M)

## (iii) Set i to be 1. Write a repeat() loop which doubles i until i is greater than 100. What value is 
## i now?

i=1
repeat{
  i=i+i
    print(i)
  if(i>100)break
}

## answer: 128

## answer: value of i is 128

#****************************#
## 4 Web Scapping ##
#****************************#

## Return to ???le3.txt from Tutorial 8 (which contains the html webpage output of the IMDB 
## top 250 ???lms). Scan this in again, and then answer the following questions:

film<- scan(file = "file3.txt", what = "character", sep = '\n')

## (i) In how many of the top 250 ???lms does the actress Jodie Foster appear? 

grep("Jodie Foster", film)
length(grep("Jodie Foster", film))

## answer: 2

## (ii) What are the names of the ???lms in which she appears?

film[1723]
film[4193]

## answer: JOdie Foster appears in two movies The Silence of the Lambs and Taxi Driver

## (iii) In how many of the top 250 ???lms does the director have S as the ???rst initial of 
## their ???rst name?

grep("title=\"S", film)

length(grep("title=\"S", film))

## answer: 27

## (iv) How many of the top 250 ???lms have 'The' as the ???rst word in their title?

q<- film[grep("title=", film)]

length(q[grep(">The ", q)])

## answer: 54 movies

## (v) How many of 0the top 250 ???lms have a score of 8.4 or greater?

filmrating<- film[grep("<strong title", film)]

filmrating

## answer: 68 movies have a rating more than 8.4

## (vi) How many user ratings in total are used to de???ne the top 250 ???lms? 

tst<- substr(filmrating, 41, 47)
tst<- gsub(",", "", tst)
sum(as.numeric(tst))

## answer: 85843074
