# Boosting Sales and Efficiency for E-Commerce: Data-Driven Insights and Recommendations
Established in 2018, Unboxed is a US-based e-commerce company that sells popular consumer electronics and accessories to a global clientele. As the company has grown and expanded in the last few years, it has encountered increasingly fierce competition as well as unique challenges and opportunities brought on by the COVID-19 pandemic. 

Unboxed has data on more than 100,000 customer transactions across several dimensions and metrics, including sales, products, marketing efforts, operations, and its loyalty program. To help the company's Head of Operations understand the company's performance over the last several years (2019 - 2022), a thorough and comprehensive analysis was conducted on the company's data. The analysis uncovered insights that can be leveraged by different teams across the company to improve processes and boost Unboxed's commercial performance. The insights and recommendations center on the following key areas:

* **Sales trends** - Focusing on key metrics of sales revenue, number of orders placed, and average order value (AOV).
* **Loyalty program evaluation** - Evaluating the effectiveness of the company's loyalty program and providing recommendations to maximize customer engagement and retention.
* **Product performance** - Analyzing different product lines, market impact, and refund rates to inform strategic product decisions.
* **Operational effectiveness** - Evaluating logistics and operational efficiency to identify areas for improvement.
* **Marketing channel performance** - Analyzing campaign performance across channels to identify most effective ones to increase brand awareness and acquire new customers.

---
## Data Structure, Processing, and Cleaning

The dataset contains a total of 108,127 records stored in 4 tables, as shown below. 

<div align="center">

  <img src="https://github.com/ruiruigao/unboxed_ecommerce/assets/67876553/94406a15-ba71-4109-b0f8-b97fd7876acb" width="60%">
  
  <sub>Entity relationship diagram (ERD) of Unboxed's data.</sub>
</div>

A series of data processing and cleaning steps were first undertaken to understand and address data quality issues, including missing and nonsensical values in several columns, as well as inconsistent formatting. These steps were carried out in Excel and are documented [here]().

---
## Summary of Insights

### Sales trends

#### Growth rates
* _Overall performance_: From 2019 to 2022, over 108K orders were placed for a total revenue of $28M, with an average order value (AOV) of $260. North America, which accounts for 51% of Unboxed's total revenue, is its biggest market, followed by Europe, the Middle East, and Africa (30%), the Asia-Pacific region (12%), and Latin America (6%).

* _Pandemic-driven growth_: The company saw explosive growth in 2020 across all markets, likely related to increased spending during the COVID-19 pandemic: AOV and order count rose by 31% and 101% respectively, driving the highest yearly revenue on record ($10M, a 163% increase from the previous year). A closer look at the month-over-month growth rates in 2020 reveals that order count and revenue both rose by approximately 50% in March, the highest growth rate on record. This timing coincides with the start of pandemic-related lockdowns, suggesting that the company's impressive growth in 2020 was driven by consumers with an increased appetite for consumer electronics amidst lockdown restrictions.

* _Post-pandemic sales slump_: While the company was able to maintain its pandemic sales boost into 2021, 2022 saw a slump in sales across all markets. Revenue fell by 46% from the previous year, driven by a significant decrease in number of sales (down 40% from the previous year). 

#### Seasonality
* Unboxed's sales trends exhibit seasonality, with a consistent upward tick in sales in August, September, November, and December. These months coincide with the start of the school year and shopping-heavy holidays like Christmas, suggesting a potential reason for this seasonality. 

### Loyalty program
* Overall, across all four years, non-loyalty program customers surpassed loyalty program customers in all three key sales metrics (AOV, order count, and revenue). In 2019 and 2020, loyalty customers placed fewer orders than non-loyalty customers, and their orders were less expensive than those of non-loyalty customers. 

* However, in 2021 and 2022, not only did loyalty customers place more orders than non-loyalty customers, but they also spent $30 more on average per order than non-loyalty customers. In 2022, purchases made by loyalty customers accounted for 55% of the yearly total revenue and 52% of the total orders placed.

* The performance of the loyalty program was especially strong in North America, the only region where loyalty customers surpassed non-loyalty customers in across all key metrics (AOV, order count, and revenue) in 2022.

### Product performance
* Overall, 4 out of the company's 8 product offerings accounted for **96%** of the total revenue earned across all years. Two of these products (Apple Airpods Headphones and the 27in 4K Gaming Monitor) drove 67% of all sales. The Apple Airpods Headphones are the company's best-selling product, accounting for 45% of all sales for a total revenue of $7.7M. Revenue-wise, the 27in 4K Gaming Monitor is the most profitable product, accounting for $9.9M in total revenue. 

* Higher-ticket items (laptops and phones) had the highest refund rates, potentially due to the fact that customers are more likely to seek out a refund when they are unsatisfied with an expensive product. 
---
## Recommendations
* We would recommend continuing with the loyalty program, since this segment of customers has been placing more orders, as well as more expensive orders, than non-loyalty customers in recent years. 

---
## Showcase

The image below showcases some visualizations generated as part of the analysis. 

Click here for the full dashboard.
