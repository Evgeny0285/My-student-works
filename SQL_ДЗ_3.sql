/** Описание задания:**

Написать запросы, по следующим задачам:
*/

/*Какое количество платежей было совершено */
select count(amount) from orders o

/* Какое количество наименований? товаров находится в категории “Игрушки”*/
SELECT category as "категории", count(*) AS "количество"
FROM product 
JOIN category on product.category_id = category.category_id
group by category.category_id
having category.category like 'Игрушки'

/* В какой категории находится больше всего наименований? товаров*/
SELECT category as "категории", count(*) AS "количество" 
FROM product 
JOIN category on product.category_id = category.category_id
group by category.category_id
order by count(*) desc 
limit 1

/*Сколько “Черепах” купила Williams Linda?*/
select customer.last_name, customer.first_name, product.product, order_product_list.amount
from product
full join order_product_list on product.product_id = order_product_list.product_id
full join orders on order_product_list.order_id = orders.order_id
full join customer on orders.customer_id = customer.customer_id
group by customer.last_name, customer.first_name, product.product, order_product_list.amount
having last_name = 'Williams' and first_name = 'Linda' and product = 'Черепаха'

/*С кем живет Williams Linda?*/
select address.address_id, staff.address_id, address.address, customer.last_name, customer.first_name, staff.last_name, staff.first_name
from address
full join customer on address.address_id = customer.address_id
full join staff on customer.address_id = staff.address_id
where customer.address_id = staff.address_id

select address.address_id, staff.address_id, address.address, 
concat(customer.last_name, ' ', customer.first_name) as "ФИО покупателя", 
concat(staff.last_name, ' ', staff.first_name) as "ФИО курьера"
from address
full join customer on address.address_id = customer.address_id
full join staff on customer.address_id = staff.address_id
where customer.address_id = staff.address_id