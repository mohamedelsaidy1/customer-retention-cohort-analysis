WITH BaseData AS (
    SELECT
        CustomerID,
        InvoiceDate,
        DATETRUNC(MONTH, InvoiceDate) AS OrderMonth,
        Quantity * UnitPrice AS Revenue
    FROM OnlineRetail
    WHERE CustomerID IS NOT NULL
      AND Quantity > 0
      AND UnitPrice > 0
)
, First_purchase_CTE AS 
(
SELECT 
    CustomerID,
    MiN(OrderMonth) AS CohartMonth
FROM BaseData
GROUP BY CustomerID
)
,Cohart_Date AS
(
SELECT 
    b.CustomerID,
    b.OrderMonth,
    f.CohartMonth,
    DATEDIFF(Month,f.CohartMonth,b.OrderMonth) AS CohartIndex
FROM BaseData b 
JOIN First_purchase_CTE f
    ON b.CustomerID=f.CustomerID
)
,RetentioCount_CTE AS 
(
SELECT 
    CohartMonth,
    CohartIndex,
    COUNT(DISTINCT CustomerID) AS CustomerCount 
FROM Cohart_Date
GROUP BY CohartMonth,CohartIndex
)
,Cohart_Size AS
(
SELECT
    CohartMonth,
    CustomerCount AS CohartSize
FROM RetentioCount_CTE
WHERE CohartIndex = 0
)
SELECT
    r.CohartMonth,
    r.CohartIndex,
    r.CustomerCount,
    ROUND(1.0*r.CustomerCount / cs.CohartSize,4) AS RetentionRate

FROM RetentioCount_CTE r
JOIN Cohart_Size cs
    ON r.CohartMonth =cs.CohartMonth
ORDER BY r.CohartMonth, r.CohartIndex;