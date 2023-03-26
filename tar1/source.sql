-- Insert values to Employee
INSERT INTO Employee (E_Id, E_FirstName, E_LastName, E_Telephone, E_Address, E_Age)
VALUES (1, 'John', 'Doe', '054-1234567', '123 Main St.', 30),
       (2, 'Jane', 'Smith', '055-2345678', '456 Oak Ave.', 25),
       (3, 'Bob', 'Johnson', '056-3456789', '789 Maple Rd.', 35),
       (4, 'Alice', 'Williams', '052-4567890', '246 Elm St.', 28),
       (5, 'Mike', 'Brown', '050-5678901', '135 Pine Ave.', 42),
       (6, 'Karen', 'Taylor', '058-6789012', '678 Cedar Ln.', 31),
       (7, 'David', 'Wilson', '051-7890123', '910 Oak Rd.', 27),
       (8, 'Amy', 'Miller', '059-8901234', '345 Elm Ave.', 29),
       (9, 'Chris', 'Lee', '056-9012345', '789 Maple St.', 33),
       (10, 'Maria', 'Garcia', '052-0123456', '246 Oak Ave.', 26),
       (11, 'Tom', 'Anderson', '057-1234567', '123 Pine St.', 38),
       (12, 'Emily', 'Clark', '055-2345678', '456 Cedar Ave.', 24),
       (13, 'Josh', 'Wright', '058-3456789', '789 Maple Rd.', 30),
       (14, 'Samantha', 'Martin', '050-4567890', '246 Oak St.', 32);

-- Insert values to Supplier
INSERT INTO Supplier (S_Company, S_Telephone, S_Address)
VALUES ('ABC Inc.', '050-1234567', '123 Main St.'),
       ('XYZ Corp.', '055-2345678', '456 Oak Ave.'),
       ('123 Co.', '056-3456789', '789 Maple Rd.'),
       ('456 Ltd.', '052-4567890', '246 Elm St.'),
       ('789 LLC', '050-5678901', '135 Pine Ave.'),
       ('DEF Inc.', '058-6789012', '678 Cedar Ln.'),
       ('GHI Corp.', '051-7890123', '910 Oak Rd.'),
       ('JKL Co.', '059-8901234', '345 Elm Ave.'),
       ('MNO Ltd.', '056-9012345', '789 Maple St.'),
       ('PQR LLC', '052-0123456', '246 Oak Ave.'),
       ('STU Inc.', '057-1234567', '123 Pine St.'),
       ('VWX Corp.', '055-2345678', '456 Cedar Ave.'),
       ('YZA Co.', '058-3456789', '789 Maple Rd.'),
       ('BCD Ltd.', '050-4567890', '246 Oak St.');

-- Insert values to Customer
INSERT INTO Customer (C_FirstName, C_LastName, C_Id)
VALUES ('John', 'Doe', 1),
       ('Jane', 'Doe', 2),
       ('Michael', 'Smith', 3),
       ('Rachel', 'Green', 4),
       ('Ross', 'Geller', 5),
       ('Monica', 'Geller', 6),
       ('Chandler', 'Bing', 7),
       ('Phoebe', 'Buffay', 8),
       ('Joey', 'Tribbiani', 9),
       ('Ted', 'Mosby', 10),
       ('Barney', 'Stinson', 11),
       ('Lily', 'Aldrin', 12),
       ('Marshall', 'Eriksen', 13),
       ('Robin', 'Scherbatsky', 14);

-- Insert values to Kitchen
INSERT INTO Kitchen (K_Name, K_Type VALUES ('Italiano', 'parve'),
    ('Sushi House',
                     'meat'), ('Burger Joint', 'dairy'), ('Kebab House', 'dairy'), ('Wok n Roll', 'meat'), ('La Patisserie', 'dairy'), ('El Mariachi', 'dairy'), ('Spice Route', 'meat'), ('The Greek', 'dairy'), ('Aloha Kitchen', 'meat'), ('Noodle House', 'meat'), ('Fish n Chips', 'parve'), ('Waffle House', 'dairy'), ('Pizza Planet', 'dairy');

-- Insert values to Work
INSERT INTO Work (E_Salary, E_Id, K_Name)
VALUES (5000, 1, 'Italiano'),
       (4000, 2, 'Sushi House'),
       (4500, 3, 'Burger Joint'),
       (3500, 4, 'Kebab House'),
       (6000, 5, 'Wok n Roll'),
       (3500, 6, 'La Patisserie'),
       (4000, 7, 'El Mariachi'),
       (5000, 8, 'Spice Route'),
       (4500, 9, 'The Greek'),
       (5500, 10, 'Aloha Kitchen'),
       (3500, 11, 'Noodle House'),
       (4000, 12, 'Fish n Chips'),
       (3000, 13, 'Waffle House'),
       (5500, 14, 'Pizza Planet');

-- Insert values to Ingredient
INSERT INTO Ingredient (I_Calories, I_Casherout, I_Name, I_Type, I_Id, I_Price, S_Company)
VALUES (100.5, 'True', 'Flour', 'parve', 1, 2.5, 'ABC Bakery'),
       (150.2, 'True', 'Sugar', 'parve', 2, 4.0, 'ABC Bakery'),
       (80.0, 'True', 'Salt', 'parve', 3, 1.5, 'XYZ Company'),
       (200.0, 'True', 'Olive Oil', 'parve', 4, 8.0, 'Best Oil'),
       (150.0, 'True', 'Soy Sauce', 'parve', 5, 4.5, 'Soy Company'),
       (250.0, 'True', 'Beef', 'meat', 6, 12.0, 'Meat Delight'),
       (200.0, 'True', 'Chicken', 'meat', 7, 10.0, 'Fresh Farms'),
       (150.0, 'False', 'Shrimp', 'parve', 8, 15.0, 'Ocean Seafood'),
       (100.0, 'True', 'Lemon', 'parve', 9, 3.0, 'Fruit Express'),
       (80.0, 'True', 'Tomato', 'parve', 10, 2.5, 'Green Valley'),
       (50.0, 'True', 'Garlic', 'parve', 11, 1.5, 'Green Valley'),
       (30.0, 'True', 'Onion', 'parve', 12, 1.0, 'Green Valley'),
       (120.0, 'True', 'Paprika', 'parve', 13, 2.0, 'Spice World'),
       (100.0, 'True', 'Cinnamon', 'parve', 14, 3.0, 'Spice World');

-- Insert values to Meal
INSERT INTO Meal (M_Name, M_Price, M_Id, K_Name)
VALUES ('Hamburger', 10.99, 101, 'Italiano'),
       ('Pizza', 15.99, 102, 'Sushi House'),
       ('Sushi', 18.99, 103, 'Burger Joint'),
       ('Steak', 25.99, 104, 'Kebab House'),
       ('Pad Thai', 12.99, 105, 'Wok n Roll'),
       ('Tacos', 8.99, 106, 'La Patisserie'),
       ('Salmon', 22.99, 107, 'El Mariachi'),
       ('Fried Rice', 9.99, 108, 'Spice Route'),
       ('Pasta', 11.99, 109, 'The Greek'),
       ('Kebab', 16.99, 110, 'Aloha Kitchen'),
       ('Soup', 6.99, 111, 'Noodle House'),
       ('BBQ Ribs', 24.99, 112, 'Fish n Chips'),
       ('Falafel', 7.99, 113, 'Waffle House'),
       ('Pho', 13.99, 114, 'Pizza Planet');

-- Insert values to Order table
INSERT INTO Order (Order_Id, Payment, Order_Date, M_Id, C_Id)
VALUES (1, 'Cash', '2022-01-01', 101, 1),
       (2, 'Credit Card', '2022-01-02', 102, 2),
       (3, 'Cash', '2022-01-03', 103, 3),
       (4, 'Credit Card', '2022-01-04', 104, 4),
       (5, 'Cash', '2022-01-05', 105, 5),
       (6, 'Credit Card', '2022-01-06', 106, 6),
       (7, 'Cash', '2022-01-07', 107, 7),
       (8, 'Credit Card', '2022-01-08', 108, 8),
       (9, 'Cash', '2022-01-09', 109, 9),
       (10, 'Credit Card', '2022-01-10', 110, 10),
       (11, 'Cash', '2022-01-11', 111, 11),
       (12, 'Credit Card', '2022-01-12', 112, 12),
       (13, 'Cash', '2022-01-13', 113, 13),
       (14, 'Credit Card', '2022-01-14', 114, 14);

-- Insert values to Stock table
INSERT INTO Stock (Quantity, K_Name, I_Id)
VALUES (10, 'Italiano', 1),
       (20, 'Sushi House', 2),
       (15, 'Burger Joint', 3),
       (5, 'Kebab House', 4),
       (30, 'Wok n Roll', 5),
       (25, 'La Patisserie', 6),
       (12, 'El Mariachi', 7),
       (8, 'Spice Route', 8),
       (18, 'The Greek', 9),
       (7, 'Aloha Kitchen', 10),
       (13, 'Noodle House', 11),
       (22, 'Fish n Chips', 12),
       (9, 'Waffle House', 13),
       (16, 'Pizza Planet', 14);

-- Insert values to Recipe table
INSERT INTO Recipe (M_Id, I_Id)
VALUES (101, 1),
       (101, 2),
       (101, 3),
       (102, 4),
       (102, 5),
       (102, 6),
       (103, 7),
       (103, 8),
       (103, 9),
       (104, 10),
       (104, 11),
       (104, 12),
       (105, 13),
       (105, 14);

INSERT INTO Customer (C_FirstName, C_LastName, C_Id)
VALUES ('John', 'Doe', 15);

INSERT INTO Meal (M_Name, M_Price, M_Id, K_Name)
VALUES ('Chicken Caesar Salad', 14.5, 115, 'La Patisserie');

INSERT INTO Order (Order_Id, Payment, Order_Date, M_Id, C_Id)
VALUES (15, 'Cash', '2022-03-28', 12, 2);

INSERT INTO Kitchen (K_Name, K_Type)
VALUES ('Juice Bar', 'parve');

DELETE
FROM Order
WHERE customer_id = 10;

DELETE
FROM Ingredient
WHERE id NOT IN (SELECT DISTINCT ingredient_id
                 FROM MealIngredient);

DELETE
FROM Meal
WHERE id NOT IN (SELECT DISTINCT meal_id
                 FROM OrderMeal);

DELETE
FROM Employee
WHERE id IN (SELECT employee_id
             FROM KitchenEmployee
             WHERE employee_id NOT IN (SELECT DISTINCT employee_id
                                       FROM MealPreparation));

UPDATE Meal
SET price = price * 1.1;

UPDATE Customer
SET phone_number = '050-1876543'
WHERE customer_id IN (SELECT DISTINCT customer_id
                      FROM `Order`);

UPDATE Ingredient
SET quantity = quantity + 50;

UPDATE Work
SET E_Salary = E_Salary + 1000;


SELECT *
FROM `Order`
WHERE Customer_ID = 101;



SELECT Ingredient.Name
FROM MealIngredient
         JOIN Ingredient ON MealIngredient.Ingredient_ID = Ingredient.ID
WHERE MealIngredient.Meal_ID = 5;



SELECT Customer.Name, SUM(Order.Total_Price) AS Total_Spent
FROM `Order`
         JOIN Customer ON Order.Customer_ID = Customer.ID
GROUP BY Customer.ID;



SELECT Meal.Name, COUNT(OrderMeal.Meal_ID) AS Popularity
FROM OrderMeal
         JOIN Meal ON OrderMeal.Meal_ID = Meal.ID
GROUP BY Meal.ID
ORDER BY Popularity DESC;


CREATE TABLE Menu
(
    item_id     INT PRIMARY KEY,
    item_name   VARCHAR(50)    NOT NULL,
    description VARCHAR(100),
    price       DECIMAL(10, 2) NOT NULL
);



CREATE TABLE Payment
(
    payment_id   INT PRIMARY KEY,
    order_id     INT            NOT NULL,
    payment_date DATE           NOT NULL,
    amount       DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id)
);


CREATE TABLE Reservation
(
    reservation_id   INT PRIMARY KEY,
    table_number     INT      NOT NULL,
    reservation_date DATETIME NOT NULL,
    customer_id      INT      NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer (customer_id)
);


CREATE TABLE Promotion
(
    promotion_id     INT PRIMARY KEY,
    promotion_name   VARCHAR(50)   NOT NULL,
    start_date       DATE          NOT NULL,
    end_date         DATE          NOT NULL,
    discount_percent DECIMAL(5, 2) NOT NULL
);


DROP TABLE Employees;



DROP TABLE Kitchen;

DROP TABLE Work;


DROP TABLE Order;