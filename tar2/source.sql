-- 1
SELECT k.K_Name, e.E_FirstName, e.E_LastName, w.E_Salary
FROM Kitchen k
         JOIN Work w ON k.K_Name = w.K_Name
         JOIN Employee e ON w.E_Id = e.E_Id
WHERE w.E_Salary = (
    SELECT MAX(w2.E_Salary)
    FROM Work w2
    WHERE w2.K_Name = k.K_Name
)
  AND k.K_Name IN (
    SELECT k2.K_Name
    FROM Kitchen k2
             JOIN Meal m ON k2.K_Name = m.K_Name
             JOIN "ORDER" o ON m.M_Id = o.M_Id
    GROUP BY k2.K_Name
    HAVING COUNT(DISTINCT o.C_Id) > 1
);
-- not help
CREATE INDEX idx_k_type on Kitchen(k_Type);


-- 2
SELECT k.K_Name, SUM(w.E_Salary) AS Total_Salary
FROM Kitchen k
         JOIN Work w ON k.K_Name = w.K_Name
         JOIN Employee e ON w.E_Id = e.E_Id
WHERE e.E_Age > 67
GROUP BY k.K_Name;

-- Help
CREATE INDEX idx_employee_age ON Employee (E_Age);
-- Not help
CREATE INDEX idx_e_pn ON Employee (E_telephone);

--3
SELECT k.K_Name, m.M_Name, MAX(m.M_Price) AS Max_Price
FROM Kitchen k
         JOIN Meal m ON k.K_Name = m.K_Name
         JOIN "ORDER" o ON m.M_Id = o.M_Id
GROUP BY k.K_Name, m.M_Name
HAVING COUNT(*) >= ALL (
    SELECT COUNT(*)
    FROM "ORDER" o2
             JOIN Meal m2 ON o2.M_Id = m2.M_Id
    WHERE m2.K_Name = k.K_Name
    GROUP BY m2.M_Id
)

--4
SELECT e.E_FirstName, e.E_LastName, k.K_Name, COUNT(*) AS Num_Ingredients_In_Stock
FROM Employee e
         JOIN Work w ON e.E_Id = w.E_Id
         JOIN Kitchen k ON w.K_Name = k.K_Name
         JOIN Stock s ON k.K_Name = s.K_Name
         JOIN (
    SELECT K_Name, COUNT(*) AS Num_Ingredients
    FROM Stock
    GROUP BY K_Name
) st ON k.K_Name = st.K_Name
GROUP BY e.E_FirstName, e.E_LastName, k.K_Name, st.Num_Ingredients
HAVING COUNT(*) = st.Num_Ingredients;

CREATE INDEX stock_kname_idx ON Stock (K_Name);

--5
SELECT k.K_Name
FROM Kitchen k
         JOIN Meal m ON k.K_Name = m.K_Name
         JOIN Recipe r ON m.M_Id = r.M_Id
         JOIN Ingredient i ON r.I_Id = i.I_Id
GROUP BY k.K_Name
HAVING SUM(i.I_Calories) > (SELECT AVG(Total_Calories) FROM
    (SELECT SUM(i.I_Calories) AS Total_Calories
     FROM Meal m
              JOIN Recipe r ON m.M_Id = r.M_Id
              JOIN Ingredient i ON r.I_Id = i.I_Id
     GROUP BY m.M_Id) subquery);

CREATE INDEX idx_work_salary ON Work (E_Salary);

--6
SELECT k.K_Name, e.E_FirstName, e.E_LastName, MAX(m.M_Price) AS Max_Price
FROM Kitchen k
         JOIN Meal m ON k.K_Name = m.K_Name
         JOIN Work w ON k.K_Name = w.K_Name
         JOIN Employee e ON w.E_Id = e.E_Id
WHERE m.M_Price = (
    SELECT MAX(M_Price)
    FROM Meal
    WHERE K_Name = k.K_Name
)
GROUP BY k.K_Name, e.E_FirstName, e.E_LastName;

CREATE INDEX meal_kname_price_idx ON Meal (K_Name, M_Price);

--7
SELECT k.K_Name, m.M_Name
FROM Kitchen k
         JOIN Meal m ON k.K_Name = m.K_Name
         JOIN Recipe r ON m.M_Id = r.M_Id
         JOIN Ingredient i ON r.I_Id = i.I_Id
         JOIN Stock s ON k.K_Name = s.K_Name
GROUP BY k.K_Name, m.M_Name
HAVING COUNT(DISTINCT i.I_Id) >= (SELECT COUNT(DISTINCT I_Id) / 2 FROM Stock WHERE K_Name = k.K_Name);

--8
SELECT k.K_Name, COUNT(o.M_Id) AS TotalMeals, SUM(m.M_Price) AS TotalRevenue
FROM Kitchen k
         LEFT JOIN Meal m ON k.K_Name = m.K_Name
         LEFT JOIN ”ORDER” o ON m.M_Id = o.M_Id
WHERE o.Order_Date >= TO_DATE('2022-01-01','YYYY-MM-DD') AND o.Order_Date < TO_DATE('2023-10-01','YYYY-MM-DD')
GROUP BY k.K_Name
ORDER BY TotalRevenue DESC;


