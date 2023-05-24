CREATE VIEW MealIngredients AS
SELECT M.M_Name, M.M_Price, I.I_Name, I.I_Type
FROM Meal M
         JOIN Recipe R ON M.M_Id = R.M_Id
         JOIN Ingredient I ON R.I_Id = I.I_Id;

SELECT MI.M_Name,
       MI.M_Price,
       MI.I_Name,
       MI.I_Type,
       S.S_Company
FROM MealIngredients MI
         INNER JOIN Ingredient I ON MI.I_Name = I.I_Name
         INNER JOIN Supplier S ON I.S_Company = S.S_Company;


SELECT MI.I_Type,
       COUNT(DISTINCT MI.M_Name) AS MealCount
FROM MealIngredients MI
GROUP BY MI.I_Type
ORDER BY MealCount DESC;
