CREATE VIEW fact_table_carrier WITH SCHEMABINDING AS (
    SELECT 
        fact.[order_details_id],
        fact.[order_id],
        fact.[pizza_id],
        fact.[quantity],
        fact.[date],
        fact.[time],
        car.[carrier_id],
        car.[carrier_name],
        car.[address],
        car.[tax_id],
        car.[contact_person]
    FROM [dbo].[carrier] car
    JOIN [dbo].[FactTable] fact
    ON car.[carrier_id] = fact.[carrier_id]
)

CREATE UNIQUE CLUSTERED INDEX index_fact_carrier ON [dbo].[carrier_factTable] (
       [order_details_id]
      ,[order_id]
      ,[pizza_id]
      ,[quantity]
      ,[date]
      ,[time]
      ,[carrier_id]
      ,[carrier_name]
      ,[address]
      ,[tax_id]
      ,[contact_person]
)