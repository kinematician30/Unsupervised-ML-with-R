# Clustering Countries in direst needs for HELP international using unsupervised model algorithm.

To categorise the countries using socio-economic and health factors that determine the overall development of the country using R Unsupervised ML algorithm.

**Data Source** [Here](https://www.kaggle.com/datasets/rohan0301/unsupervised-learning-on-country-data)

## **About organization:**

HELP International is an international humanitarian NGO that is committed to fighting poverty and providing the people of developing and underdeveloped countries with basic amenities and relief during the time of economic downturns, disasters and natural calamities.

## **Problem Statement:**

HELP International have been able to raise around \$ 10 million. Now the CEO of the NGO needs to decide how to use this money strategically and effectively. So, CEO has to make decision to choose the countries that are in the direst need of aid. Hence, your Job as a Data scientist is to categorise the countries using some socio-economic and health factors that determine the overall development of the country. Then you need to suggest the countries which the CEO needs to focus on the most.

**Why Scaling?**

Algorithms like K-Means are sensitive to the scale of the features. For example, 'income' has a much larger range than 'health'. Without scaling, the distance calculations in K-Means would be heavily influenced by 'income', potentially leading to clusters that are more based on income differences than on the other important socio-economic and health factors.

We'll use standardization (scaling to have a mean of 0 and a standard deviation of 1) to bring all the features to a comparable scale.

Although your problem statement suggests three priority categories, it's good practice to use some data-driven methods to confirm if k=3 is a reasonable choice for the number of clusters.

We'll use two common methods:

1.  **Elbow Method:** This method plots the within-cluster sum of squares (WSS) against the number of clusters (k). The "elbow" point in the plot, where the rate of decrease in WSS starts to diminish, is often considered a good estimate for k.

2.  **Silhouette Analysis:** This method calculates the silhouette coefficient for each data point, which measures how well it fits into its assigned cluster compared to other clusters. The average silhouette width over all data points provides a measure of how well the data has been clustered. Higher average silhouette widths are generally desirable.

    -   **Elbow Plot:** Look for a point where the decrease in WSS starts to level off, forming an "elbow."

    -   **Silhouette Plot:** Look for the number of clusters that yields the highest average silhouette width.

    -   **NbClust Results:** This provides a consensus based on multiple indices for the optimal number of clusters.
