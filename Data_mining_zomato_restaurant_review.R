data<- read.csv(file.choose(), header = T)

str(data)

data$Country.Code[(data$Country.Code == 1)] = 'India'
data$Country.Code[(data$Country.Code == 14)] = 'Australia'
data$Country.Code[(data$Country.Code == 30)] = 'Brazil'
data$Country.Code[(data$Country.Code == 37)] = 'Canada'
data$Country.Code[(data$Country.Code == 94)] = 'Indonesia'
data$Country.Code[(data$Country.Code == 148)] = 'New Zealand'
data$Country.Code[(data$Country.Code == 162)] = 'Phillipines'
data$Country.Code[(data$Country.Code == 166)] = 'Qatar'
data$Country.Code[(data$Country.Code == 184)] = 'Singapore'
data$Country.Code[(data$Country.Code == 189)] = 'South Africa'
data$Country.Code[(data$Country.Code == 191)] = 'Sri Lanka'
data$Country.Code[(data$Country.Code == 208)] = 'Turkey'
data$Country.Code[(data$Country.Code == 214)] = 'UAE'
data$Country.Code[(data$Country.Code == 208)] = 'United Kingdom'
data$Country.Code[(data$Country.Code == 216)] = 'United States'

a<- lm(Aggregate.rating ~ Has.Online.delivery + Price.range, data = data)
summary(a)

n=nrow(data)
indexes = sample(n,n*(80/100))
trainset = data[indexes,]
testset = data[-indexes,]

# Applying simple linear regression

a_train<- lm(Aggregate.rating ~ Avg.cost.for.two.in.Dollars, data = trainset)
summary(a_train)

a_test<- lm(Aggregate.rating ~ Avg.cost.for.two.in.Dollars, data = testset)
summary(a_test)

a_train<- lm(Aggregate.rating ~ Has.Table.booking, data = trainset)
summary(a_train)

a_test<- lm(Aggregate.rating ~ Has.Table.booking, data = testset)
summary(a_test)

a_train<- lm(Aggregate.rating ~ Has.Online.delivery, data = trainset)
summary(a_train)

a_test<- lm(Aggregate.rating ~ Has.Online.delivery, data = testset)
summary(a_test)

# Applying multi linear regression

a_train<- lm(Aggregate.rating ~ Avg.cost.for.two.in.Dollars + Has.Table.booking + Has.Online.delivery , data = trainset)
summary(a_train)

a_test<- lm(Aggregate.rating ~ Avg.cost.for.two.in.Dollars + Has.Table.booking + Has.Online.delivery , data = testset)
summary(a_test)

