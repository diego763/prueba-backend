--listado de vigilantes y las sucursales en las que ha trabajado y en cual esta activo trabajando
SELECT e.employee_name, o.office_address, vho.active
FROM employee AS e 
INNER JOIN vigilant_has_office AS vho ON vho.vigilant_id=e.employee_id
INNER JOIN office AS o ON vho.office_code=o.office_code
WHERE e.employee_vigilant=1
LIMIT 10