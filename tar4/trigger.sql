CREATE
OR REPLACE TRIGGER Update_Stock_Quantity
BEFORE INSERT OR
UPDATE ON Stock
    FOR EACH ROW
BEGIN
  IF
:NEW.Quantity = 0 THEN
    :NEW.Quantity := 10;
END IF;
END;
/


CREATE
OR REPLACE TRIGGER Delete_Employee_If_Supplier
AFTER INSERT ON Employee
FOR EACH ROW
DECLARE
v_Supplier_Count INTEGER;
BEGIN
  -- Check if the new employee's telephone number exists in the Supplier table
SELECT COUNT(*)
INTO v_Supplier_Count
FROM Supplier
WHERE S_Telephone = :NEW.E_Telephone;

-- If a match is found, delete the employee
IF
v_Supplier_Count > 0 THEN
DELETE
FROM Employee
WHERE E_Id = :NEW.E_Id;
-- Display a message or log the deletion
DBMS_OUTPUT
.
PUT_LINE
('Employee with telephone number ' || :NEW.E_Telephone || ' is already a supplier. Employee record deleted.');
END IF;
END;
/
