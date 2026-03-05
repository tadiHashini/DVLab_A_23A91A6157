# Load dataset
data(HairEyeColor)

# check structure
str(HairEyeColor)
View(HairEyeColor)
?HairEyeColor

# very basic Mosaic Plot(BaseR)
mosaicplot(HairEyeColor)

# add titles and colours
mosaicplot(HairEyeColor,
           main = "Mosaic Plot: Hair, Eye Color and Sex",
           color = "blue")

# two-variable mosaic plot
HairEye2D <- margin.table(HairEyeColor, c(1,2))
mosaicplot(HairEye2D,
           main = "Hair vs Eye Color Mosaic Plot",
           color = "blue")

# Mosaic plot by sex
par(mfrow=c(1,2))
mosaicplot(HairEyeColor[,,"Male"], main = "Male", color = "black")
mosaicplot(HairEyeColor[,,"Female"], main = "Female", color = "pink")
par(mfrow=c(1,1))

# Custom colors
mosaicplot(HairEye2D,
           col = c("brown","black","red","yellow"),
           main = "Hair vs Eye Color (Custom)")

# advanced Mosaic plot using 'vcd'
install.packages("vcd")
library(vcd)

mosaic(HairEyeColor,
       shade = TRUE,
       legend = TRUE,
       main = "Shaded Mosaic Plot (vcd)")

# Convert Dataset to data frame (For ggplot)
hair_eye_df <- as.data.frame(HairEyeColor)
head(hair_eye_df)

# ggplot alternative
library(ggplot2)

ggplot(hair_eye_df, aes(x = Hair, y = Freq, fill = Eye)) +
  geom_bar(stat = "identity", position = "fill") +
  facet_wrap(~Sex) +
  labs(
    title = "Proportional Distribution of Eye Color by Hair",
    y = "Proportion"
  ) +
  theme_minimal()

# Advanced Mosaic with Residual Shading
mosaic(~Hair + Eye + Sex,
       data = hair_eye_df,
       shade = TRUE,
       legend = TRUE)