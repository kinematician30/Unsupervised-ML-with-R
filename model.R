# Load necessary libraries
library(dplyr)      # For data manipulation
library(ggplot2)    # For visualization
library(cluster)    # For clustering algorithms and evaluation
library(factoextra) # For visualizing clustering results
library(NbClust)    # For helping determine the number of clusters

# Load the data
country_data <- readr::read_csv(".\\data\\Country-data.csv")

# Store country names for later use
country_names <- country_data$country
country_data <- country_data %>% select(-country) # Remove country column

print("\nSummary statistics of the data:")
print(summary(country_data))

# Scaling
# Data Preprocessing: Scaling
scaled_data <- scale(country_data)

# Convert the scaled data back to a data frame (for easier handling later)
scaled_data <- as.data.frame(scaled_data)

print("\nSummary statistics of the scaled data:")
print(summary(scaled_data))

# --- Determining the Optimal Number of Clusters (k) for K-Means ---

# Elbow Method
wss <- (nrow(scaled_data) - 1) * sum(apply(scaled_data, 2, var))
for (i in 2:10) {
   kmeans_result <- kmeans(scaled_data, centers = i, nstart = 10)
   wss[i] <- sum(kmeans_result$withinss)
}

elbow_plot <- ggplot(data.frame(clusters = 1:10, WSS = wss[-1]), aes(x = clusters, y = WSS)) +
   geom_line() +
   geom_point() +
   geom_vline(xintercept = 3, linetype = "dashed", color = "red") + # Indicating k=3
   labs(title = "Elbow Method for Optimal k",
        x = "Number of Clusters (k)",
        y = "Within-Cluster Sum of Squares (WSS)") +
   theme_minimal()

print(elbow_plot)

# Silhouette Analysis
silhouette_scores <- c()
for (i in 2:10) {
   kmeans_result <- kmeans(scaled_data, centers = i, nstart = 10)
   silhouette_avg <- silhouette(kmeans_result$cluster, dist(scaled_data)) %>%
      summary() %>%
      .$avg.width
   silhouette_scores <- c(silhouette_scores, silhouette_avg)
}

silhouette_plot <- ggplot(data.frame(clusters = 2:10, Silhouette = silhouette_scores), aes(x = clusters, y = Silhouette)) +
   geom_line() +
   geom_point() +
   geom_vline(xintercept = 3, linetype = "dashed", color = "red") + # Indicating k=3
   labs(title = "Silhouette Analysis for Optimal k",
        x = "Number of Clusters (k)",
        y = "Average Silhouette Width") +
   theme_minimal()

print(silhouette_plot)

# 3. Using the NbClust package (provides multiple indices)
nbclust_result <- NbClust(scaled_data, min.nc = 2, max.nc = 5, method = "kmeans")
print("\nNbClust Results:")
print(nbclust_result$Best.nc)

hist(country_data$income, breaks=30, col='orange')
hist(scaled_data$income, breaks=30, col='orange')

boxplot(country_data$income, col = "blue")
boxplot(scaled_data$income, col = "blue")

