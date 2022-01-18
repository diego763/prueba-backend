--Listado de reportes de los vigilantes y la oficina-banco
SELECT r.report_title, r.report_description, r.report_date_crated, e.employee_name, o.office_address, b.bank_name
FROM report AS r
INNER JOIN employee AS e ON r.employee_id=e.employee_id
INNER JOIN office AS o ON r.office_code=o.office_code
INNER JOIN bank AS b ON o.bank_code=b.bank_code
LIMIT 10