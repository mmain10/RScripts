## Difference of Proportions Z-Test
# Help desk One-Off
# Created Date: 1/8/2015
# Created By: Mitch Main
##

library(MASS)

# Caveats:
# It's important to note that we are assuming the populations normality
# this acceptable for several reasons:
#     the shape IS "approximately" normal
#     Central Limit Theorem lets us assume normality due to a large sample size
#     It's a decently safe assumption to have each customer represent "independent events"


#Get the Data
data <- data.frame(c(953,4864), c(1779,11767))
colnames(data) <- c('vested','total')
rownames(data) <- c('contacted','uncontacted')

#calculate the test
test <- prop.test(x = data$vested, n = data$total, p = NULL, alternative = 'greater', conf.level = .95, correct = FALSE);

#print the results
print(test)
