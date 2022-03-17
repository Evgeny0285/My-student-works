/*Найдите категорию товара, у которой наибольшее процентное отношение количества товаров от общего количества товаров*/

SELECT c.category, (SUM(p.remains)*100 / 
(SELECT SUM(remains) FROM product p2)) s  
 FROM category c
 join product p on c.category_id = p.category_id
 GROUP BY c.category
 order by 2 desc 
 limit 1