BEGIN
	DECLARE
		@sql NVARCHAR(MAX)

	SET @sql = 'DELETE FROM customer WHERE customer_id = @cid'

	EXEC sp_executesql 
		@stmp = @sql,
		@params = N'@cid AS INT',
		@cid = 5

END ;
