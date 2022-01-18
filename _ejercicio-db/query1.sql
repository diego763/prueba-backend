--Listado de empleados mayores a 30
SELECT e.employee_name, e.employee_rut, e.employee_age 
FROM employee AS e 
WHERE e.employee_age>=30
LIMIT 10