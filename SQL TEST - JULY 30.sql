SELECT * FROM customer.customer;

#QN 1
SELECT Customer.cust_name AS "Customer",
Customer.grade AS "Grade",Orders.ord_no AS "Order No."
FROM Orders, Salesman, Customer
WHERE Orders.customer_id = Customer.custemor_id
AND orders.salesman_id = salesman.salesman_id
AND Salesman.city IS NOT NULL
AND Customer.grade IS NOT NULL;

#QN 2
SELECT ord_no, purch_amt, ord_date, salesman_id 
FROM orders 
WHERE salesman_id IN(
SELECT salesman_id FROM salesman
WHERE commision = (SELECT MAX(commision) FROM salesman));

#QN 3
SELECT * FROM Orders
WHERE salesman_id =
    (SELECT salesman_id FROM Salesman 
     WHERE city='nagpur');
     
#QN 4
SELECT ord_date, SUM(purch_amt), 
SUM(purch_amt)*.15 
FROM Orders 
GROUP BY ord_date 
ORDER BY ord_date;

#QN 5
SELECT *
FROM orders
WHERE purch_amt >
    (SELECT  AVG(purch_amt) FROM orders);
    
#QN 6
SELECT DISTINCT customer_id FROM Orders ORDER BY purch_amt DESC LIMIT 5,1;

#QN 7
#What is Entity and Relationship?
#An entity is a table in DBMS, and it represents a real-world object.
#A relationship signifies an association among the entities. There are three types of relationships that can exist between the entities. 
#They are the binary, recursive and the ternary relationship. 

#QN 8
#Entities are connected to each other using relationships. 
#Thus, the difference between entity and relationship in DBMS is that the entity is a real-world object 
#while the relationship is an association between the entities.

#QN 8
SELECT customer_id , bank_account_details.account_number, CASE WHEN ifnull(balance_amount,0) = 0 THEN Transaction_amount ELSE balance_amount END AS balance_amount
FROM bank_account_details INNER JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
AND account_type = "Credit Card";

#QN 9
Select bank_account_details.account_number, balance_amount, transaction_amount
from bank_account_details inner join bank_account_transaction on bank_account_details.account_number = bank_account_transaction.account_number
And (date_format(Transaction_Date , '%Y-%m')  between "2020-03" and "2020-04");

#QN 10
SELECT bank_account_details.customer_id, bank_account_details.account_number, balance_amount, transaction_amount
FROM bank_account_details LEFT JOIN bank_account_transaction ON bank_account_details.account_number = bank_account_transaction.account_number
LEFT JOIN bank_customer ON bank_account_details.customer_id = bank_customer.customer_id
AND NOT ( date_format(Transaction_Date , '%Y-%m') = "2020-03" );