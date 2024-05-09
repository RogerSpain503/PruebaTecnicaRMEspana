CREATE OR ALTER PROCEDURE datawarehouse.dbo.ETLSQL
AS
BEGIN 

-- Extracción y transformación: tabla orden
INSERT INTO datawarehouse.dbo.ordenes (id_orden, id_cliente, 
estatus, fecha_de_compra, fecha_de_aprobacion, fecha_entrega_transportista, 
fecha_entrega_cliente, fecha_entrega_estimada, fecha_carga_dw)
SELECT A.*, GETDATE() FROM STAGE.dbo.orders_stage;

-- Extracción y transformación: tabla items_orden
INSERT INTO datawarehouse.dbo.items_orden (id_item_orden, id_orden, id_producto, 
categoria_producto, precio, fecha_carga_dw)
SELECT A.order_item_id, A.order_id, A.product_id, B.product_category_name, A.price, GETDATE() 
FROM STAGE.dbo.order_items_stage A 
LEFT OUTER JOIN STAGE.dbo.products_stage B 
ON A.product_id = B.product_id 
order by 1,2,3;

END;