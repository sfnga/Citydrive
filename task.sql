/* создание таблицы CITY */
CREATE TABLE CITY(
    city_id INT,
    city_name TEXT);
/* заполнение таблицы CITY */   
INSERT INTO CITY
  (city_id, city_name)
VALUES
  (77, 'Москва'), 
  (78, 'Санкт-Петербург'),
  (61, 'Ростов-на-Дону');
/* создание таблицы ORDER */
CREATE TABLE ORDER_TABLE(
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    created_at timestamp default NULL,
    finished_at timestamp default NULL,
    city_id INT,
    revenue DECIMAL(5,2));
/* заполнение таблицы ORDER */
/* выручку и город для каждого клиента взял из решения на pandas*/
INSERT INTO ORDER_TABLE
  (user_id, created_at, finished_at, city_id, revenue)
VALUES
  (3, DEFAULT, DEFAULT, 61, 300),
  (2, DEFAULT, DEFAULT, 78, 700),
  (3, DEFAULT, DEFAULT, 61, 800), 
  (2, DEFAULT, DEFAULT, 78, 600),
  (1, DEFAULT, DEFAULT, 77, 100),
  (4, DEFAULT, DEFAULT, 77, 900),
  (4, DEFAULT, DEFAULT, 77, 400),
  (2, DEFAULT, DEFAULT, 78, 500),
  (2, DEFAULT, DEFAULT, 78, 200);
select * from CITY;
select * from ORDER_TABLE;

/* решение задачи*/
SELECT user_id, COUNT(*) as orders_count, SUM(revenue) as revenue_sum
FROM ORDER_TABLE
WHERE city_id IN (SELECT city_id from CITY WHERE city_name='Москва')
GROUP BY user_id