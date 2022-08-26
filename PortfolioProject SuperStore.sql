Select * 
From [dbo].[SuperStore Orders]

--Difference between current Months Sales with previous Month Sales.

Select Year([Order Date]) as Year, Month([Order Date]) as Month, Sum(Sales) as Sales ,-
Lag(Sum(Sales))  Over (Order by Year([Order Date]), Month([Order Date])) as Last_Month_Sales_Difference
From [dbo].[SuperStore Orders]
Group by Year([Order Date]), Month([Order Date])

--Difference between Months Sales and same Month Sales previous year.

Select Year([Order Date]) as Year, Month([Order Date]) as Month, Sum(Sales) as Sales ,-
Lag(Sum(Sales), 12)  Over (Order by Year([Order Date]), Month([Order Date])) as Last_Month_Sales_Difference
From [dbo].[SuperStore Orders]
Group by Year([Order Date]), Month([Order Date])


--Total Number of orders by state

Select State, count([Order ID]) as Total_Order
From [dbo].[SuperStore Orders]
Group by State
Order by Total_Order desc

--Orders per Shipping

Select [Ship Mode] as Shipping, count([Order ID]) as Total_Order
From [dbo].[SuperStore Orders]
Group by [Ship Mode]
Order by Total_Order Desc

--Yearly/Monthy Quantity and Sales

Select Year([Order Date]) as Year, Month([Order Date]) as Month, Sum([Quantity]) as Total_Quantity, Sum([Sales]) as Total_Sales
From [dbo].[SuperStore Orders]
Group by Year([Order Date]),  Month([Order Date])
Order by Year, Month Desc

--Yearly Profit

Select Year([Order Date]) as Yr, Sum([Profit]) as Total_Profit, Sum([Sales]) as Total_Sales
From [dbo].[SuperStore Orders]
Group by Year([Order Date])
Order by Total_Profit

--Category Sales

Select [Category], [Genre], Sum([Sales]) as Total_Sales
From [dbo].[SuperStore Orders]
Group by [Category], [Genre]
Order by [Category], Total_Sales Desc


