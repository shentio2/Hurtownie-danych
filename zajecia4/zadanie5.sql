CREATE TABLE DIMDate (
	date_key INT,
	date DATE,
	quarter INT,
	year INT,
	month INT,
	week INT
)

DECLARE @StartDate  date = '20150101';

DECLARE @CutoffDate date = DATEADD(DAY, -1, DATEADD(YEAR, 10, @StartDate));

;WITH seq(n) AS 
(
  SELECT 0 UNION ALL SELECT n + 1 FROM seq
  WHERE n < DATEDIFF(DAY, @StartDate, @CutoffDate)
),
d(d) AS 
(
  SELECT DATEADD(DAY, n, @StartDate) FROM seq
),
src AS
(
  SELECT
    Date_id = ROW_NUMBER() OVER(Order by d),
    TheDate = CONVERT(date, d),
    TheDay = DATEPART(DAY, d),
    TheDayOfWeek = DATEPART(WEEKDAY, d),
    TheMonth = DATEPART(MONTH, d),
    TheQuarter = DATEPART(Quarter, d),
    TheYear = DATEPART(YEAR, d)
  FROM d
)
SELECT * FROM src
  ORDER BY TheDate
  OPTION (MAXRECURSION 0);