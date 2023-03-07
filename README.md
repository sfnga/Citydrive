# Citydrive
Citydrive 
## [Задание на pandas](https://github.com/sfnga/Citydrive/blob/main/task_pandas.ipynb)
В файле функция для решения задачи и тестовый пример

Функция:
```
def task(order_df, city_df):
    # получаем id Москвы
    city_id = city_df.query('city_name=="Москва"')['city_id'].values
    # группируем заказы в Москве по пользователю и считаем выручку и количество заказов
    result_df = order_df[order_df.city_id.isin(city_id)].groupby(
        'user_id').agg({
            'order_id': 'count',
            'revenue': 'sum'
        })
    # переименовываем результирующие столбцы
    result_df.columns = ['orders_count', 'revenue_sum']

    return result_df
```

## [Задание на SQL]
В файле запрос по заданию, а также создание и заполнение таблиц для проверки результата

Результирующий запрос:
```
SELECT user_id, COUNT(*) as orders_count, SUM(revenue) as revenue_sum
FROM ORDER_TABLE
WHERE city_id IN (SELECT city_id from CITY WHERE city_name='Москва')
GROUP BY user_id
```
