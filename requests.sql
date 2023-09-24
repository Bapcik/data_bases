#task-1
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE to_stock = (SELECT id FROM stores WHERE store= 'store-2')
AND date >= '2015-01-01' AND date <= '2016-01-01'
GROUP BY product
ORDER BY sum_qua DESC;

#task-2
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE from_stock = (SELECT id FROM stores WHERE store= 'store-2')
AND date >= '2015-01-01' AND date <= '2016-01-01'
GROUP BY product
ORDER BY sum_qua DESC;

#task-3
SELECT category, sum(quantity) as sum_qua
FROM stock_balance
INNER JOIN categories c ON product_id = c.id
WHERE to_stock = (SELECT id FROM stores WHERE store= 'store-2')
AND date >= '2015-01-01' AND date <= '2016-01-01'
GROUP BY category
ORDER BY sum_qua DESC;


#task-5
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE to_stock = (SELECT id FROM stores WHERE store= 'store-2')
AND date >= '2015-01-01' AND date <= '2016-01-01'
GROUP BY product
ORDER BY sum_qua DESC;


#task-6
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE to_counteragent = (SELECT id FROM counteragents WHERE counteragent ='people-2')
AND date >= '2014-01-01' AND date <= '2018-01-01'
GROUP BY product
ORDER BY sum_qua DESC;

#task-7
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE to_counteragent = (SELECT id FROM counteragents WHERE counteragent ='people-2')
AND to_stock = (SELECT id FROM stores WHERE store ='store-1')
AND date >= '2014-01-01' AND date <= '2018-01-01'
GROUP BY product
ORDER BY sum_qua DESC;

#task-8
SELECT product, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN products p ON product_id = p.id
WHERE from_counteragent = (SELECT id FROM counteragents WHERE counteragent ='people-2')
AND from_stock = (SELECT id FROM stores WHERE store ='store-1')
AND date >= '2014-01-01' AND date <= '2018-01-01'
GROUP BY product
ORDER BY sum_qua DESC;


#task-9
SELECT counteragent, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN counteragents c ON to_counteragent = c.id
WHERE product_id = (SELECT id FROM products WHERE product ='Monitor B19')
AND date >= '2014-01-01' AND date <= '2017-01-01'
GROUP BY counteragent
ORDER BY sum_qua DESC;


#task-10
SELECT counteragent, sum(quantity) as sum_qua
FROM stock_balance
LEFT JOIN counteragents c ON stock_balance.from_counteragent = c.id
WHERE product_id = (SELECT id FROM products WHERE product ='MB-2')
AND date >= '2014-01-01' AND date <= '2017-01-01'
GROUP BY counteragent
ORDER BY sum_qua DESC;


