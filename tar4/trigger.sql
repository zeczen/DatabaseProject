CREATE
OR REPLACE TRIGGER Check_Stock
AFTER INSERT ON "Order"
FOR EACH ROW
DECLARE
v_StockQuantity INTEGER;
BEGIN
  -- Check if there is enough quantity of ingredients in stock for the ordered meal
SELECT Quantity
INTO v_StockQuantity
FROM Stock
WHERE K_Name = :NEW.K_Name
  AND I_Id = (SELECT I_Id FROM Recipe WHERE M_Id = :NEW.M_Id);

IF
v_StockQuantity < 1 THEN
    -- Raise an error or take appropriate action (e.g., notify staff, prevent the order)
    RAISE_APPLICATION_ERROR(-20001, 'Insufficient quantity of ingredients in stock');
ELSE
    -- Update the stock by decrementing the quantity of ingredients used in the ordered meal
UPDATE Stock
SET Quantity = Quantity - 1
WHERE K_Name = :NEW.K_Name
  AND I_Id = (SELECT I_Id FROM Recipe WHERE M_Id = :NEW.M_Id);
END IF;
END;
/



CREATE
OR REPLACE TRIGGER Update_Salary
AFTER
UPDATE ON Work
    FOR EACH ROW
BEGIN
  -- Update the employee's salary in the Employee table
UPDATE Employee
SET E_Salary = :NEW.E_Salary
WHERE E_Id = :NEW.E_Id;
COMMIT; -- Commit the changes to make them permanent
END;
/
