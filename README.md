# Supermart Analytics

This Project has 4 parts to it. 
1) Data Cleaning - There is a corresponding sql file to this part on this repository.
2) Data Analysis - There is a corresponding sql file to this part on this repository.
3) Tableau Dashboard - https://public.tableau.com/app/profile/nicholas.harakh/viz/supermartDashboard/Dashboard1
4) Report - On this page below.
 ## Basic Info

Before we continue any further the following information is crucial in understanding how this data set is used to provide insights.

1.	The way grocery stores work is that they purchase goods in large quantities from wholesalers and sell them in smaller quantities for profit.

2.	Grocery stores have sales because. 
a) They can purchase goods at a discount from the wholesaler, 
b) the Product is expiring, and they need to sell it; otherwise, they lose money.

3.	Profit Margins for large grocery stores are low. They can range from 1 to 3 percent. They make money because they sell many products in many different locations. 

4.	Profit margins for smaller grocery stores are higher because they make money by selling at higher prices and retaining customers.


## Case 

### Intro
Supermart Grocery is a (fictional) grocery store based in India. Their Store is in the Tamil Nadu state and has customers from south, east, central, and western regions.  

### Questions and Stakeholders:

The stakeholders in this project are the CEO, COO, purchasing lead, and store planning lead. 
We want them to know: 

1)	How has the company performed over the years and is it a good time to expand?

2)	What are the best months to hold a sale? 

3)	What is the optimal product assortment?

4)	Which products are losing the most money due to discounts?




## How has the company performed over the years and is it a good time to expand?

### Insights 

From 2015 to 2016 profits slightly increased as they went from ~$752k to ~797k. From 2016 to 2017 profits increased from ~797k to ~953k. Finally, from 2017 to 2018 profits have increased from ~953k to ~1.2mil. From 2015 to 2016 sales slightly increased as they went from ~$2.9mil to ~3.1mil. From 2016 to 2017 sales increased from ~3.1mil to ~3.8mil. Finally, from 2017 to 2018 sales have increased from ~3.8mil to ~4.9mil.

### Recommendations

As sales and profits have nearly doubled from 2015 to 2018, and because profit margins must be low from the discrepancy between sales and profits, I recommend that supermart begins expanding. Discussions should start immediately regarding the opening of new stores and potential locations. From the data we can conclude that Supermart is a high-performing company and is in a rapid growth phase at the moment. 



## What are the best and worst performing months? 



![Profit Vs Sales](https://github.com/nharakh00/Retail_Analytics_Project/assets/45838914/f50e2a88-be85-45d0-9f80-3e3d6e145a9a)
Figure 1

### Insights 
Figure 1 displays Supermart sales and profits for each month from 2015-2018. This chart shows that sales and profits peak in September, November, and December.


### Recommendations 
Since September, November, and December are the best months for sales and profits, supermart should hold its sales and special promotions during these years. At these times, if the wholesaler offers products at discounts, I recommend stocking up and having a sale. In addition, I recommend buying more products than usual during these months.

![category](https://github.com/nharakh00/Retail_Analytics_Project/assets/45838914/26b91df0-a973-471b-8313-16eb512552aa) 
Figure 2


![subcategory](https://github.com/nharakh00/Retail_Analytics_Project/assets/45838914/7a44704f-2c3a-43ed-b40a-a5dbefe8916d)
Figure 3

## What is the optimal product assortment?

### Insights 
To determine optimal product assortment, I have chosen profits as the primary KPI because it's essential to consider revenues and expenses when deciding which products to carry. From Figure 3, we can see that the overall top categories for profit are snacks and meat products. Oils and masalas are at the bottom, and the remaining products are similar in profits. Figure 4 shows that the top 10 subcategories are products from the beverage, snacks, bakery, and edible oil categories.

### Recommendations 
Since the categories for top selling subcategories are beverage, snacks, bakery, and edible oil categories, I recommend looking into additional products in these categories. Some examples of subcategories that are currently not offered are chips, pastries, and freeze-dried herbs.  


## Which products are losing the most money due to discounts?

### Insights
From both Figure 3 and Figure 4, we can see that money lost due to discount roughly corresponds with profits for both categories and subcategories. The key things to note are that meat products and grains are losing more money than normal, and oil and masalas are losing the least.

### Recommendations
Overall, things are okay the way they are, for the most part, as different products spoil at different rates. I recommend being more careful with meat products and grain products. The former is understandable, as meat tends to spoil quickly. However, grain products last long, and caution should be taken here. Stocking up on masala products from the data and their long shelf life is okay.



## Further Reading 

https://en.wikipedia.org/wiki/Retail

https://en.wikipedia.org/wiki/Grocery_store

https://thegrocerystoreguy.com/why-do-grocery-stores-have-sales/

https://www.posnation.com/blog/grocery-store-profit-margins

