--Listado de empleados y si ingresaron fuera de horario el día 2022-01-17
SELECT e.employee_name, e.employee_rut
FROM employee AS e
LEFT JOIN entry_record AS er ON e.employee_id=er.employee_id
WHERE er.entry_out_time=1 AND er.entry_date_created="2022-01-17"