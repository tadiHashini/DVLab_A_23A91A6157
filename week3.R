data(iris)
?iris

# Show first 10 rows
head(iris, 10)

str(iris)
class(iris)

iris$Species
View(iris)

# Bar plot - Count of Iris Species
barplot(
  table(iris$Species),
  main = "Count of Iris Species",
  xlab = "Species",
  ylab = "Number of Items",
  col = "steelblue"
)

# Mean Sepal Length per Species
mean_sepal <- tapply(iris$Sepal.Length, iris$Species, mean)
mean_sepal

barplot(
  mean_sepal,
  col = "orange",
  main = "Average Sepal Length by Species",
  xlab = "Species",
  ylab = "Mean Sepal Length"
)

# Grouped data - Sepal & Petal Length
group_mean <- rbind(
  Sepal = tapply(iris$Sepal.Length, iris$Species, mean),
  Petal = tapply(iris$Petal.Length, iris$Species, mean)
)

group_mean

# Clustered Bar Chart
barplot(
  group_mean,
  beside = TRUE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Clustered Bar Chart: Sepal vs Petal"
)

# Stacked Bar Chart
barplot(
  group_mean,
  beside = FALSE,
  col = c("skyblue", "pink"),
  legend.text = TRUE,
  main = "Stacked Bar Chart: Sepal vs Petal"
)