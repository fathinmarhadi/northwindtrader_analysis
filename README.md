# Northwind Trader Analysis 
This is my analytical repository of Sales and order data for Northwind Traders from [Maven Analytics](https://mavenanalytics.io "Maven Analytics"), a fictional gourmet food supplier, including information about customers, products, orders, shippers, and employees. I conducted 4 analysis consisting of:
- [**Customer Segmentation Analysis**](https://github.com/fathinmarhadi/northwindtrader_analysis/blob/f0d39b538bff2613e20ee202ded19f82a2ea0549/Customer%20Segmentation%20Analysis.sql "Customer Segmentation Analysis")
- [**Geographical Analysis and Market Penetration**](https://github.com/fathinmarhadi/northwindtrader_analysis/blob/f0d39b538bff2613e20ee202ded19f82a2ea0549/Geographical%20Analysis%20and%20Market%20Penetration.sql "**Geographical Analysis and Market Penetration**")
- [**Order Fulfillment and Supply Chain Optimization**](https://github.com/fathinmarhadi/northwindtrader_analysis/blob/f0d39b538bff2613e20ee202ded19f82a2ea0549/Order%20Fulfillment%20and%20Supply%20Chain%20Optimization.sql "**Order Fulfillment and Supply Chain Optimization**")
- [**Product Performance and Market Basket Analysis**](https://github.com/fathinmarhadi/northwindtrader_analysis/blob/f0d39b538bff2613e20ee202ded19f82a2ea0549/Product%20Performance%20and%20Market%20Basket%20Analysis.sql "**Product Performance and Market Basket Analysis**")



The analysis was carried out using SQL as a tool.

You can visit the [Maven Analytics Playground](https://mavenanalytics.io/data-playground?search=north "Maven Analytics Playground") to access the available datasets.

###### *Documentation of the analysis results will be published soon*
### Data Dictionary 
|Table        |Field          |Description                                                                                     |
|-------------|---------------|------------------------------------------------------------------------------------------------|
|orders       |orderID        |Unique identifier for each order                                                                |
|orders       |customerID     |The customer who placed the order                                                               |
|orders       |employeeID     |The employee who processed the order                                                            |
|orders       |orderDate      |The date when the order was placed                                                              |
|orders       |requiredDate   |The date when the customer requested the order to be delivered                                  |
|orders       |shippedDate    |The date when the order was shipped                                                             |
|orders       |shipperID      |The ID of the shipping company used for the order                                               |
|orders       |freight        |The shipping cost for the order (USD)                                                           |
|order_details|orderID        |The ID of the order this detail belongs to                                                      |
|order_details|productID      |The ID of the product being ordered                                                             |
|order_details|unitPrice      |The price per unit of the product at the time the order was placed (USD - discount not included)|
|order_details|quantity       |The number of units being ordered                                                               |
|order_details|discount       |The discount percentage applied to the price per unit                                           |
|customers    |customerID     |Unique identifier for each customer                                                             |
|customers    |companyName    |The name of the customer's company                                                              |
|customers    |contactName    |The name of the primary contact for the customer                                                |
|customers    |contactTitle   |The job title of the primary contact for the customer                                           |
|customers    |city           |The city where the customer is located                                                          |
|customers    |country        |The country where the customer is located                                                       |
|products     |productID      |Unique identifier for each product                                                              |
|products     |productName    |The name of the product                                                                         |
|products     |quantityPerUnit|The quantity of the product per package                                                         |
|products     |unitPrice      |The current price per unit of the product (USD)                                                 |
|products     |discontinued   |Indicates with a 1 if the product has been discontinued                                         |
|products     |categoryID     |The ID of the category the product belongs to                                                   |
|categories   |categoryID     |Unique identifier for each product category                                                     |
|categories   |categoryName   |The name of the category                                                                        |
|categories   |description    |A description of the category and its products                                                  |
|employees    |employeeID     |Unique identifier for each employee                                                             |
|employees    |employeeName   |Full name of the employee                                                                       |
|employees    |title          |The employee's job title                                                                        |
|employees    |city           |The city where the employee works                                                               |
|employees    |country        |The country where the employee works                                                            |
|employees    |reportsTo      |The ID of the employee's manager                                                                |
|shippers     |shipperID      |Unique identifier for each shipper                                                              |
|shippers     |companyName    |The name of the company that provides shipping services 



