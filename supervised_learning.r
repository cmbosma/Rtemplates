## Helpful code for supervised learning projects

## Libraries
library(sigr) # useful for printing test statistics
library(broom) # useful for examining linear models



## Examinting regression models
##------------------------------------------------------------------------------------------

# Examining the model
broom::glance(fitted_model)

# Print test statistics
sigr::wrapFTest(fitted_model)

# Predicting values using 'predict()'
df$predition <- predict(fitted_model)

ggplot(df, aes(x = prediction, y = outcome_var) + 
       geom_point() +
       geom_abline(color = "blue")

# Apply model to different data
pred <- predict(fitted_model, newdata = new_df)
pred

## Evaluating models graphically 
##------------------------------------------------------------------------------------------
       

