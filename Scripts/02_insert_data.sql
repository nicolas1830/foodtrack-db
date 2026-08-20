-- ============================================================
-- FOODTRACK DB
-- Script: 02_insert_data.sql
-- Descripción: Inserción de los datos iniciales en las tablas
--              de la base de datos FoodTrack.
-- ============================================================


-- ============================================================
-- Tabla: foodtrucks
-- Inserta los foodtrucks disponibles en la plataforma.
-- ============================================================

INSERT INTO foodtrucks
    (foodtruck_id, name, cuisine_type, city)
VALUES
    (1, 'Taco Loco', 'Mexicana', 'Ciudad de México'),
    (2, 'Burger Bros', 'Americana', 'Buenos Aires');


-- ============================================================
-- Tabla: locations
-- Inserta las ubicaciones asociadas a cada foodtruck.
-- El foodtruck_id debe existir previamente en foodtrucks.
-- ============================================================

INSERT INTO locations
    (location_id, foodtruck_id, location_date, zone)
VALUES
    (1, 1, '2023-09-01', 'Centro'),
    (2, 2, '2023-09-01', 'Parque');


-- ============================================================
-- Tabla: products
-- Inserta los productos ofrecidos por cada foodtruck.
-- El foodtruck_id debe existir previamente en foodtrucks.
-- ============================================================

INSERT INTO products
    (product_id, foodtruck_id, name, price, stock)
VALUES
    (101, 1, 'Taco al pastor', 50, 100),
    (102, 1, 'Quesadilla', 40, 80),
    (103, 2, 'Cheeseburger', 70, 120),
    (104, 2, 'Papas fritas', 30, 150);


-- ============================================================
-- Tabla: orders
-- Inserta los pedidos realizados a los foodtrucks.
-- El foodtruck_id debe existir previamente en foodtrucks.
-- ============================================================

INSERT INTO orders
    (order_id, foodtruck_id, order_date, status, total)
VALUES
    (1001, 1, '2023-09-01', 'entregado', 90),
    (1002, 2, '2023-09-01', 'pendiente', 100);


-- ============================================================
-- Tabla: order_items
-- Inserta los productos incluidos en cada pedido.
-- order_id debe existir en orders y product_id en products.
-- ============================================================

INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity)
VALUES
    (1, 1001, 101, 1),
    (2, 1002, 103, 1),
    (3, 1002, 104, 1);