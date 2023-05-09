SELECT DISTINCT e1.E_firstName AS first_name, e2.eid AS id_2, w.e_salary AS salary, SUM(o.quantity) AS quantity
FROM employee e1
         JOIN ASHLOSBE.employee e2 ON e1.e_firstname = e2.efirst
         JOIN work w ON e1.e_id = w.e_id
         JOIN ASHLOSBE.MY_ORDER o ON e2.eid = o.eid
WHERE o.quantity > 5 AND w.e_salary < 50000
GROUP BY e1.E_firstName, e1.e_id, e2.eid, w.e_salary;

SELECT c.Company_names, c2.SPHONE AS Phone_number
FROM
    (SELECT SNAME AS Company_names
     FROM ASHLOSBE.SUPPLIER
              MINUS
         SELECT S_COMPANY AS Company_names
     FROM SUPPLIER) c
        JOIN ASHLOSBE.SUPPLIER c2 ON c.Company_names = c2.SNAME;

SELECT m.K_name as Kitchen_name
FROM kitchen k
         NATURAL JOIN ASHLOSBE.EQUIPMENT e
         JOIN meal m ON k.k_name = m.k_name AND m.m_id = e.eqid
WHERE m.m_price > 45;