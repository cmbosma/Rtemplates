## Code for common variable computation 
## Colin Bosma

## Rowise sum

df$vec <- rowSums(df[c("vec1", "vec2")], na.rm = FALSE)

# example using BDI-II:
data$bdi_s1 <- rowSums(data[c("bdi_ii_1", "bdi_ii_2", "bdi_ii_3",
                              "bdi_ii_4", "bdi_ii_5", "bdi_ii_6",
                              "bdi_ii_7", "bdi_ii_8", "bdi_ii_9",
                              "bdi_ii_10", "bdi_ii_11", "bdi_ii_12",
                              "bdi_ii_13", "bdi_ii_14", "bdi_ii_15",
                              "bdi_ii_16", "bdi_ii_17", "bdi_ii_18",
                              "bdi_ii_19", "bdi_ii_20", "bdi_ii_21")],
                       na.rm = FALSE)

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
