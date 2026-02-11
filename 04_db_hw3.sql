use db03;

/*
- Визначте, скільки рядків ви отримали (за допомогою оператора COUNT).
*/
SELECT 
    COUNT(*) rows_count
FROM
    order_details od
        INNER JOIN
    orders o ON od.order_id = o.id
        INNER JOIN
    customers c ON o.customer_id = c.id
        INNER JOIN
    employees e ON o.employee_id = e.employee_id
        INNER JOIN
    products p ON od.product_id = p.id
        INNER JOIN
    categories cat ON p.category_id = cat.id
        INNER JOIN
    suppliers s ON p.supplier_id = s.id
        INNER JOIN
    shippers sh ON o.shipper_id = sh.id; 
    
/*
	Змініть декілька операторів `INNER` на `LEFT` чи `RIGHT`. 
    Визначте, що відбувається з кількістю рядків. Чому? 
    Напишіть відповідь у текстовому файлі. (Див. 04_ans.txt)
*/
SELECT 
    o.id AS order_id,
    o.date AS order_date,
    c.name AS customer_name,
    c.country AS customer_country,
    e.first_name,
    e.last_name,
    p.name AS product_name,
    p.price,
    od.quantity,
    cat.name AS category_name,
    s.name AS supplier_name,
    sh.name AS shipper_name
FROM
    order_details od
        LEFT JOIN
    orders o ON od.order_id = o.id
        LEFT JOIN
    customers c ON o.customer_id = c.id
        INNER JOIN
    employees e ON o.employee_id = e.employee_id
        INNER JOIN
    products p ON od.product_id = p.id
        INNER JOIN
    categories cat ON p.category_id = cat.id
        INNER JOIN
    suppliers s ON p.supplier_id = s.id
        INNER JOIN
    shippers sh ON o.shipper_id = sh.id;

/*
    На основі запита з пункта 3 виконайте наступне: оберіть тільки ті рядки, де `employee_id` > 3 та ≤ 10.
    Згрупуйте за іменем категорії, порахуйте кількість рядків у групі, середню кількість товару (кількість товару знаходиться в `order_details.quantity`)
    Відфільтруйте рядки, де середня кількість товару більша за 21.
    Відсортуйте рядки за спаданням кількості рядків.
    Виведіть на екран (оберіть) чотири рядки з пропущеним першим рядком.
*/

SELECT 
    cat.name,
    COUNT(*) count_category,
    AVG(od.quantity) avg_quantity
FROM
    order_details od
        INNER JOIN
    orders o ON od.order_id = o.id
        INNER JOIN
    customers c ON o.customer_id = c.id
        INNER JOIN
    employees e ON o.employee_id = e.employee_id
        AND e.employee_id > 3
        AND e.employee_id <= 10
        INNER JOIN
    products p ON od.product_id = p.id
        INNER JOIN
    categories cat ON p.category_id = cat.id
        INNER JOIN
    suppliers s ON p.supplier_id = s.id
        INNER JOIN
    shippers sh ON o.shipper_id = sh.id
GROUP BY cat.name
HAVING AVG(od.quantity) > 21
ORDER BY count_category DESC
LIMIT 4 OFFSET 1

