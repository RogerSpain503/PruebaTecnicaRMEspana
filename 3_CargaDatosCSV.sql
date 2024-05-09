CREATE OR ALTER PROCEDURE STAGE.dbo.CargarDatosCSV
AS
BEGIN 
    DECLARE @RutaArchivo NVARCHAR(255);
    DECLARE @SQL NVARCHAR(MAX);

    SET @RutaArchivo = 'C:\ArchivosCSV\';

    -- Tabla "orders_stage"
    SET @SQL = 'BULK INSERT STAGE.dbo.orders_stage
                FROM ''' + @RutaArchivo + 'olist_orders_dataset.csv''
                WITH (
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = ''\n'',
                    FIRSTROW = 2
                );';
    EXEC sp_executesql @SQL;

    -- Tabla "order_items_stage"
    SET @SQL = 'BULK INSERT STAGE.dbo.order_items_stage
                FROM ''' + @RutaArchivo + 'olist_order_items_dataset.csv''
                WITH (
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = ''\n'',
                    FIRSTROW = 2
                );';
    EXEC sp_executesql @SQL;

    -- Tabla "products_stage"
    SET @SQL = 'BULK INSERT STAGE.dbo.products_stage
                FROM ''' + @RutaArchivo + 'olist_products_dataset.csv''
                WITH (
                    FIELDTERMINATOR = '','',
                    ROWTERMINATOR = ''\n'',
                    FIRSTROW = 2
                );';
    EXEC sp_executesql @SQL;
END;