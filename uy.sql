
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories (category_id) ON DELETE SET NULL
);

INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronic'),
(2, 'Mebelar');
INSERT INTO products (product_id, product_name, category_id)
VALUES
(1, 'Dazmol', 1),
(2, 'Telivizor', 1),
(3, 'Stol', 2),
(4, 'Parta', 2),
(5, 'Daftar', 3),
SELECT product_name, category_name
FROM products 
JOIN categories  ON category_id = category_id;
SELECT category_name, product_name
FROM categories 
LEFT JOIN products ON category_id = category_id;
SELECT category_name, product_name
FROM categories 
LEFT JOIN products  ON category_id = category_id
WHERE product_id IS NULL OR category_id IS NOT NULL;
SELECT product_name
FROM products
WHERE category_id IS NULL;
SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT DISTINCT category_id FROM products);
SELECT category_name, product_name
FROM categories c
FULL OUTER JOIN products p ON category_id = category_id;
SELECT category_name
FROM categories
WHERE category_id NOT IN (SELECT DISTINCT category_id FROM products);

SELECT product_name
FROM products
WHERE category_id IS NULL;
SELECT category_name, product_name
FROM categories
CROSS JOIN products;
SELECT category_name, product_name
FROM categories
NATURAL JOIN products;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(id)
);
INSERT INTO employees (id, first_name, last_name, manager_id)
VALUES
(1, 'Asadbek', 'Karimov', NULL),
(2, 'Azamat', 'Toirova', 1),
(3, 'Shohajahon', 'Abdullayev', 1),
(4, 'Diyor', 'Abdullayeva', 2),
(5, 'Hushnud', 'Aliyev', 2);
SELECT e1.first_name AS employee_name, e2.first_name AS manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.id;
CREATE TABLE actors (
    actor_id INT PRIMARY KEY,
    actor_name VARCHAR(100)
);

CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    movie_name VARCHAR(100)
);

CREATE TABLE movies_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id)
);

INSERT INTO actors (actor_id, actor_name)
VALUES
(1, 'Hulk'),
(2, 'Spider man'),
(3, 'Pantera'),
(4, 'Tor');
INSERT INTO movies (movie_id, movie_name)
VALUES
(1, 'Forsaj7'),
(2, 'Avangards'),

INSERT INTO movies_actors (movie_id, actor_id)
VALUES
(1, 1), 
(2, 2),
