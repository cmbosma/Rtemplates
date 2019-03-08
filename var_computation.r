## Code for common variable computation 
## Colin Bosma

## Reverse scoring
# Note: subtract value one more than absolute value of all levels of variable 
# For example, if abs value is 4, then subtract by 5

df[,c("vec1", "vec2")] <- x-df[,c

# Example using CAMS-R 
data[,c("cams_r_2", "cams_r_6", "cams_r_7")] <- 5-data[,c("cams_r_2", "cams_r_6", "cams_r_7")]

## Rowise sum

df$vec <- rowSums(df[c("vec1", "vec2")], na.rm = FALSE)

# example using ERQ suppression subscale score:
data$erq_sup <- rowSums(data[c("erq_2", "erq_4", "erq_6", "erq_9")], na.rm = FALSE)

## Rowise means 

df$vec <- rowMean(df[c("vec1", "vec2")], na.rm = FALSE)

## Rowise SD

new_vec <- df %>%
  rowwise() %>%
  mutate(vec = sd(c(vec1, vec2, vec3)), na.rm = TRUE) %>%
  select(vec) %>%
  glimpse()

df[ , "new_vec"] <- new_vec # Amend df

# Example: Rowwise standard devation of happy VAS scales
happy_vas_sd <- data %>%
  rowwise() %>%
  mutate(happy_vas_sd = sd(c(vas_1_3_1, vas_2_3_1, vas_3_3_1)), na.rm = TRUE) %>%
  select(happy_vas_sd) %>%
  glimpse()

data[ , "happy_vas_sd"] <- happy_vas_sd
class(data$happy_vas_sd)
summary(data$happy_vas_sd) 
                         
                               
## Creating resdidualized variables

# Build linear model to pull residuals from 
# If longitudinal, DV = time 2
new_mod <- lm(time2_vec ~ time1_vec, data = df, na.action = na.exclude)
ls(new_mod) # list objects in model
df$resid_vec <- resid(new_mod)                              

# Example                              
# Build linear model to pull residuals from
panas_pa_model <- lm(panas_pos_tot_postmi ~ panas_pos_tot_baseline,
                      data = data, na.action = na.exclude) # Keep missing values to keep dimensions of data frame
ls(panas_pa_model) # list of objects in model
data$panas_pa_react_resid <- resid(panas_pa_model) # assign to new var
describe(data$panas_pa_react_resid) # checking work
                               
  

