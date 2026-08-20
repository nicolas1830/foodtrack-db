-- ============================================================
-- FOODTRACK DB
-- Script: 03_alter_orders.sql
-- Descripción: Modificación de la tabla orders para agregar
--              información adicional sobre los pedidos.
-- ============================================================

-- Agregar una columna para almacenar comentarios del pedido
ALTER TABLE orders
ADD comments NVARCHAR(255);