SELECT CASE
		WHEN A = B AND B = C THEN 'Equilateral'
		--WHEN A = B OR B = C OR A = C THEN 'Isosceles'
		WHEN NOT(A + B > C AND  A + C > B AND B + C > A) THEN 'Not A Triangle'
		WHEN A != B AND A != C AND B != C THEN 'Scalene'
		ELSE 'Isosceles'
	  END AS [Type]
FROM TRIANGLES;