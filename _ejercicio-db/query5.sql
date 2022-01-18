--Listado de bancos que tengan al menos 1 sucursal
SELECT b.bank_name, (SELECT COUNT (*) FROM office WHERE bank_code=b.bank_code ) AS total_sucursales
FROM bank AS b 
GROUP BY b.bank_name
HAVING total_sucursales>=1
