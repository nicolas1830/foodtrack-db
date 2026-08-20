-- ============================================================
-- FOODTRACK DB
-- Script: 01_create_tables.sql
-- Descripción: Creación de las tablas de la base de datos
--              y definición de sus relaciones.
-- ============================================================

-- Seleccionar la base de datos sobre la que vamos a trabajar
USE foodtrack_db;


-- ============================================================
-- Tabla: foodtrucks
-- Almacena la información básica de cada foodtruck.
-- ============================================================

CREATE TABLE foodtrucks (
    foodtruck_id INT PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    cuisine_type NVARCHAR(100) NOT NULL,
    city NVARCHAR(100) NOT NULL
);


-- ============================================================
-- Tabla: locations
-- Almacena las ubicaciones de los foodtrucks.
-- Cada ubicación pertenece a un foodtruck existente.
-- ============================================================

CREATE TABLE locations (
    location_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    location_date DATE NOT NULL,
    zone NVARCHAR(100) NOT NULL,

    -- Relación con la tabla foodtrucks
    FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);


-- ============================================================
-- Tabla: products
-- Almacena los productos ofrecidos por cada foodtruck.
-- Cada producto pertenece a un foodtruck existente.
-- ============================================================

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    name NVARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,

    -- Relación con la tabla foodtrucks
    FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);


-- ============================================================
-- Tabla: orders
-- Almacena los pedidos realizados a los foodtrucks.
-- Cada pedido pertenece a un foodtruck existente.
-- ============================================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    foodtruck_id INT NOT NULL,
    order_date DATE NOT NULL,
    status NVARCHAR(50) NOT NULL,
    total DECIMAL(10,2) NOT NULL,

    -- Relación con la tabla foodtrucks
    FOREIGN KEY (foodtruck_id)
        REFERENCES foodtrucks(foodtruck_id)
);


-- ============================================================
-- Tabla: order_items
-- Almacena los productos incluidos en cada pedido.
-- Relaciona los pedidos con los productos.
-- ============================================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,

    -- Relación con la tabla orders
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    -- Relación con la tabla products
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);