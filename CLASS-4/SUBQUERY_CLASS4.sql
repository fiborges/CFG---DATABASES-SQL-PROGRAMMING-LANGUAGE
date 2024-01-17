USE customers;

-- etrieve the first_name and last_name from the customer_details table 
-- where the customer's phone number is '555-3344'

SELECT f_name AS first_name, l_name AS last_name
FROM customer_details
WHERE customer_id = (
    SELECT phone_number_customer_id
    FROM phone_numbers
    WHERE phone_number = '555-3344'
);

/*
The inner subquery finds the customer_id from the phone_numbers table where the
 phone_number is '555-3344'.
The outer query then uses this customer_id to retrieve the corresponding first_name 
and last_name from the customer_details table.
This query uses a subquery to perform a lookup based on the phone number 
and then retrieves the associated customer details.
*/

