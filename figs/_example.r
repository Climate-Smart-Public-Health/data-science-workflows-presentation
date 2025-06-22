library(ggplot2)
library(dplyr)

model <- lm(mpg ~ wt + hp, data = mtcars)
new_data <- data.frame(wt = c(2.5, 3.0, 3.5), hp = c(100, 150, 200))
predictions <- predict(model, newdata = new_data)

plot <- ggplot(new_data, aes(x = wt, y = hp)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  geom_text(aes(label = round(predictions, 2)), vjust = -1, color = "red") +
  labs(title = "Predicted MPG based on Weight and Horsepower",
       x = "Weight (1000 lbs)",
       y = "Horsepower")
print(plot)
