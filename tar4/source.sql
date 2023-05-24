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

-- Procedures

CREATE
OR REPLACE PROCEDURE EmployeeSalary IS
  idEmp NUMBER;
  monthCounter
NUMBER;
  salaryEmp
NUMBER;
  M
NUMBER;
  totalSalaries
NUMBER;
CURSOR employeeIterator IS
SELECT EXTRACT(MONTH FROM sales_date) AS m, employee_id, salary
FROM employee
         NATURAL JOIN sales
WHERE sales_id IN (SELECT sales_id
                   FROM sales
                   WHERE sales_date >= TO_DATE('01/01/2017', 'DD/MM/YYYY')
                     AND sales_date < TO_DATE('01/01/2018', 'DD/MM/YYYY'))
ORDER BY employee_id, sales_date;
BEGIN
  monthCounter
:= 0;
  idEmp
:= 0;
  totalSalaries
:= 0;

FOR emp_rec IN employeeIterator LOOP
    IF idEmp = emp_rec.employee_id AND M != emp_rec.m THEN
      monthCounter := monthCounter + 1;
ELSE
      IF idEmp != 0 THEN
        DBMS_OUTPUT.PUT_LINE('employee_id: ' || idEmp || ' salary for this year: ' || salaryEmp * monthCounter);
        totalSalaries
:= totalSalaries + (salaryEmp * monthCounter);
END IF;
      monthCounter
:= 1;
      idEmp
:= emp_rec.employee_id;
      salaryEmp
:= emp_rec.salary;
      M
:= emp_rec.m;
END IF;
END LOOP;

    CREATE
OR REPLACE PROCEDURE UpdateProductPrice(p_product_id IN NUMBER, p_new_price IN NUMBER) IS
BEGIN
UPDATE products
SET price = p_new_price
WHERE product_id = p_product_id;

COMMIT;
END UpdateProductPrice;
/
