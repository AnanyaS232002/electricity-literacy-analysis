# Convert to panel data
pdata <- pdata.frame(
  panel_data,
  index = c("district_id", "year")
)

# Inspect panel structure
pdim(pdata)

# Display panel indexes
head(index(pdata))

#1 Pooled OLS Regression
model_ols <- plm(
  lit ~ ele,
  data = pdata,
  model = "pooling"
)

summary(model_ols)

plot(model_ols)

#2 Multiple Regression
model_multiple <- plm(
  lit ~ ele + urb + tap,
  data = pdata,
  model = "pooling"
)

summary(model_multiple)
plot(model_multiple)

#3Two-way Fixed Effects Regression
model_fe <- plm(
  lit ~ ele + urb + tap,
  data = pdata,
  model = "within",
  effect = "twoways"
)

summary(model_fe)
plot(model_fe)

#calculating robust standard errors
robust_se <- vcovHC(
  model_fe,
  method = "arellano",
  type = "HC1",
  cluster = "group"
)

# Robust regression results
coeftest(
  model_fe,
  vcov = robust_se
)

#Comparing fixed effects and random effects
# Individual fixed effects
model_fe_ind <- plm(
  lit ~ ele + urb + tap,
  data = pdata,
  model = "within",
  effect = "individual"
)

# Individual random effects
model_re <- plm(
  lit ~ ele + urb + tap,
  data = pdata,
  model = "random",
  effect = "individual"
)

# Hausman test
hausman_test <- phtest(
  model_fe_ind,
  model_re
)

print(hausman_test)

# Test for district fixed effects
pFtest(
  model_fe_ind,
  model_ols
)

# Test whether year effects add explanatory power
pFtest(
  model_fe,
  model_fe_ind
)

#Compare all three models
# Compare regression coefficients
stargazer::stargazer(
  model_ols,
  model_multiple,
  model_fe,
  type = "text",
  title = "Electricity and Literacy Regression Results",
  column.labels = c(
    "Pooled OLS",
    "Multiple Regression",
    "Two-way Fixed Effects"
  ),
  dep.var.labels = "Literacy Rate",
  digits = 4
)
