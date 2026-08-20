-- ============================================================
-- FOODTRACK DB
-- Script: 04_drop_column.sql
-- Descripción: Eliminación de la columna comments de orders.
-- ============================================================

ALTER TABLE orders
DROP COLUMN comments;