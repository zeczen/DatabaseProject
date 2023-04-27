SELECT i.S_Company, COUNT(*) AS Num_Ingredients
FROM Ingredient i
GROUP BY i.S_Company
ORDER BY Num_Ingredients DESC;

SELECT k.K_Name
FROM Kitchen k
WHERE EXISTS (SELECT *
              FROM Work w
                       JOIN Employee e ON w.E_Id = e.E_Id
              WHERE w.K_Name = k.K_Name
                AND e.E_Age > 50);

SELECT E_FirstName, E_LastName
FROM Employee
         JOIN “WORK” ON Employee.E_Id = “WORK”.E_Id
GROUP BY E_Id, E_FirstName, E_LastName
HAVING COUNT (DISTINCT K_Name) > 1;

SELECT M_Name, COUNT(*) AS total_orders
FROM Order
         JOIN Meal ON Order.M_Id = Meal.M_Id
GROUP BY M_Name
ORDER BY total_orders DESC LIMIT 1;
-- To use indexing, we can create an index on the M_Id column in the Order table since it's being used in the join condition. This index will allow for a faster lookup of rows in the Order table when performing the join operation.
CREATE INDEX order_m_id ON Order (M_Id);

SELECT c.C_Id, c.C_FirstName, c.C_LastName, SUM(m.M_Price) AS Total_Cost
FROM Customer c
         JOIN "ORDER" o ON c.C_Id = o.C_Id
         JOIN Meal m ON o.M_Id = m.M_Id
GROUP BY c.C_Id, c.C_FirstName, c.C_LastName
ORDER BY Total_Cost DESC;

SELECT m.M_Name, m.M_Price, k.K_Name
FROM Meal m
         JOIN Kitchen k ON m.K_Name = k.K_Name
ORDER BY m.M_Price DESC

SELECT i.S_Company, COUNT(*) AS Num_Ingredients
FROM Ingredient i
GROUP BY i.S_Company
ORDER BY Num_Ingredients DESC;


SELECT DISTINCT C_FirstName, C_LastName
FROM Customer
         JOIN Order ON Customer.C_Id = Order.C_Id
         JOIN Meal ON Order.M_Id = Meal.M_Id
         JOIN Kitchen ON Meal.K_Name = Kitchen.K_Name
WHERE Kitchen.K_Name = 'Italian Kitchen'
  AND Order_Date BETWEEN '2022-01-01' AND '2022-03-31';
-- To use indexing, we can create an index on the K_Name and Order_Date columns in the Order table since they're being used in the join condition and the WHERE clause. These indexes will allow for faster lookup of rows in the Order table when performing the join operation and filtering by date range.
CREATE INDEX order_k_name ON Order (K_Name);
CREATE INDEX order_order_date ON Order (Order_Date);

SELECT Ingredient.I_Name, SUM(Ingredient.I_Calories) AS total_calories
FROM Ingredient
         JOIN Recipe ON Ingredient.I_Id = Recipe.I_Id
         JOIN Meal ON Recipe.M_Id = Meal.M_Id
WHERE Meal.M_Name = 'Spaghetti Carbonara'
GROUP BY Ingredient.I_Id;
-- To use indexing, we can create an index on the M_Id column in the Recipe table since it's being used in the join condition. This index will allow for faster lookup of rows in the Recipe table when performing the join operation.
CREATE INDEX recipe_m_id ON Recipe (M_Id);

SELECT *
FROM Meal
WHERE M_Price < 10;
CREATE INDEX idx_Meal_Price ON Meal (M_Price);


SELECT DISTINCT M_Name
FROM Meal
         JOIN Recipe ON Meal.M_Id = Recipe.M_Id
         JOIN Ingredient ON Recipe.I_Id = Ingredient.I_Id
WHERE Ingredient.I_Name = 'Pasta';
-- To use indexing, we can create an index on the I_Name column in the Ingredient table since it's being used in the join condition. This index will allow for faster lookup of rows in the Ingredient table when performing the join operation.
CREATE INDEX ingredient_i_name ON Ingredient (I_Name);


-- Here are 2 indexes that will not improve the performance on any of the queries:
-- 1. The index on the M_Id column in the Meal table will not improve the performance of the query in the first question because the M_Id column is not being used in the join condition or the WHERE clause.
CREATE INDEX meal_m_id ON Meal (M_Id);
-- 2. The index on the I_Id column in the Ingredient table will not improve the performance of the query in the second question because the I_Id column is not being used in the join condition or the WHERE clause.
CREATE INDEX ingredient_i_id ON Ingredient (I_Id);

