library(tidyverse)


# number of data points in the model
n = 200

# number of simulation iterations
iter = 5000

# max number of OLS regressors
max_regressors = 6

# set up output df to track false positives
false_positives = data.frame(regressors = 1:max_regressors)
false_positives$positives = NA
false_positives$positives_corrected_bonf = NA


for (n_regressors in 1:max_regressors){
  # initialize empty outcomes vector for each number of regressors
  outcomes = c()
  
  # See how many times out of n_
  for (i in 1:iter){
    # a matrix full of gaussian noise. 
    m = matrix(rnorm(n*(n_regressors + 1)), ncol = n_regressors + 1)
    df = data.frame(m)
    
    # regress first column on all others
    model = lm(data = df, X1 ~ .)
    model_summary = summary(model)
    
    # get p values
    p_values = model_summary$coefficients[-1, 4]
    
    # minimum p_value
    min_pval = min(p_values)
    outcomes = c(outcomes, min_pval)
  }
  # uncorrected vs. bonferroni corrected signifiance for the min pval
  false_positives$positives[n_regressors] = sum(outcomes < .05)
  false_positives$positives_corrected_bonf[n_regressors] = sum(outcomes < (.05/n_regressors))
}

# gather false positive rates to long
false_positives_long = false_positives %>%
  pivot_longer(contains('positive')) %>%
  dplyr::mutate(positive_rate = value/iter)

# plot error rate as a functions of regressors
ggplot(false_positives_long, aes(x = regressors, y = positive_rate, color = name)) +
  geom_hline(yintercept = .05, lty = 2, color = 'black') +
  geom_point() + 
  geom_line() +
  labs(x = '# of regressors in multiple regression model', y = 'P(Any regressor is significant at p < .05)',
       title = 'Chance of seeing at least 1 significant regression coefficient\nAll predictors are independent gaussian noise') +
  theme_bw() 

