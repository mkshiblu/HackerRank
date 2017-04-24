SELECT c.company_code, MAX(founder) AS founder
	, COUNT(DISTINCT lm.lead_manager_code) AS lead_manager_count
	, COUNT(DISTINCT sm.senior_manager_code) AS senior_manager_count
	, COUNT(DISTINCT m.manager_code) AS manager_count
	, COUNT(DISTINCT e.employee_code) AS employee_count
FROM Company AS c
LEFT JOIN Lead_Manager AS lm ON (lm.company_code = c.company_code)
LEFT JOIN Senior_Manager AS sm ON (sm.company_code = c.company_code)
LEFT JOIN Manager AS m ON (m.company_code = c.company_code)
LEFT JOIN Employee AS e ON (e.company_code = c.company_code)
GROUP BY c.company_code
ORDER BY c.company_code;