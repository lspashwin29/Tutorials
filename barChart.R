library(ggplot2)

# Set the working directory to the folder where you have this csv saved
ugmajor <- read.csv("ugMajor.csv")

# Force the column types
ugmajor$Breakdown <- as.numeric(ugmajor$Breakdown)
ugmajor$Major <- factor(ugmajor$Major, levels=ugmajor[order(ugmajor$Breakdown, decreasing = TRUE), "Major"])

# Plot it!
ggplot(ugmajor, aes(x = Major, y = Breakdown)) + geom_bar(stat="identity", fill = "#EC842D", colour = "black") + scale_y_continuous(breaks = c(5, 10, 15, 20, 25, 30, 35)) + 
  scale_x_discrete(labels = gsub(" ", "\n", c("Business", "Economics", "Engine- ering", "Liberal Arts/ Sciences", "Physical Sciences", "Other", "Law"))) + 
  theme_solarized() + theme(legend.position = "none") + ggtitle("% Breakdown of Undergraduate Major")
