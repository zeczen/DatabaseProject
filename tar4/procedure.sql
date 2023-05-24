
-- Procedures
CREATE
OR REPLACE PROCEDURE GenerateMonthlySalesReport(target_month IN NUMBER, target_year IN NUMBER) IS
BEGIN
   -- Create a table to store the monthly sales report
CREATE TABLE MonthlySalesReport
(
    ProductCategory VARCHAR2(100),
    TotalSales      NUMBER,
    AverageSales    NUMBER,
    MaxSales        NUMBER
);


-- Insert the monthly sales data into the report table
INSERT INTO MonthlySalesReport
SELECT ProductCategory,
       SUM(SalesAmount) AS TotalSales,
       AVG(SalesAmount) AS AverageSales,
       MAX(SalesAmount) AS MaxSales
FROM SalesTable
WHERE EXTRACT(MONTH FROM SalesDate) = target_month
  AND EXTRACT(YEAR FROM SalesDate) = target_year
GROUP BY ProductCategory;


-- Display the generated sales report
SELECT *
FROM MonthlySalesReport;
END;
/

CREATE
OR REPLACE PROCEDURE CalculateOrderTotal(p_order_id IN NUMBER) AS
 v_total_amount NUMBER;
BEGIN
SELECT SUM(item_price)
INTO v_total_amount
FROM order_items
WHERE order_id = p_order_id;


UPDATE orders
SET total_amount = v_total_amount
WHERE order_id = p_order_id;


COMMIT;
DBMS_OUTPUT
.
PUT_LINE
('Total amount calculated and updated for Order ID: ' || p_order_id);
EXCEPTION
 WHEN NO_DATA_FOUND THEN
   DBMS_OUTPUT.PUT_LINE('No items found for Order ID: ' || p_order_id);
WHEN OTHERS THEN
   DBMS_OUTPUT.PUT_LINE('Error occurred while calculating total amount for Order ID: ' || p_order_id);
END;
/

