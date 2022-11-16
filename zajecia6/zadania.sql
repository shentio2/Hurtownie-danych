use AdventureWorksDW2019;

-- zad1
with tmp as 
(
SELECT
	OrderDate,
	sum(SalesAmount) as Sales
  FROM FactInternetSales
  group by OrderDate
)
select OrderDate, 
avg(Sales) over (order by [OrderDate] rows between 3 preceding and current row ) as moving_avg
from tmp

-- zad2
select month,
	[0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10]
from 
(
select 
      SalesTerritoryKey,
      SalesAmount,
	  month(OrderDate) as month
  from FactInternetSales
  where year([OrderDate]) = 2011
) as SourceTable
pivot
(
 sum(SalesAmount)
  for SalesTerritoryKey IN ([0],[1],[2],[3],[4],[5],[6],[7],[8],[9],[10])
) as PivotTable
order by month

-- zad3
SELECT 
  OrganizationKey, 
  DepartmentGroupKey, 
  sum(Amount) as amount
  FROM FactFinance
  group by rollup( OrganizationKey, DepartmentGroupKey)
  order by OrganizationKey

-- zad4

SELECT 
  OrganizationKey, 
  DepartmentGroupKey, 
  sum(Amount) as amount
  FROM FactFinance
  group by cube( OrganizationKey, DepartmentGroupKey)
  order by OrganizationKey

-- zad5
with cte as
 (
 select 
	OrganizationKey, 
	sum(Amount) as amount_sum
 from FactFinance
 where year(date) = 2012
 group by OrganizationKey
 )

SELECT 
	d.OrganizationKey, 
	amount_sum, 
	OrganizationName, 
	PERCENT_RANK() over(order by amount_sum) as percental
  from cte
  join DimOrganization d on cte.OrganizationKey = d.OrganizationKey
  order by percental

-- zad6

with cte as
 (
SELECT 
	OrganizationKey, 
	stdev(Amount) as amount_std
 from FactFinance
 where year(date) = 2012
 group by OrganizationKey
 )

SELECT 
	d.OrganizationKey, 
	amount_std, 
	OrganizationName, 
	PERCENT_RANK() over(order by amount_std) as percental
  from cte
  join DimOrganization d on cte.OrganizationKey = d.OrganizationKey
  order by percental