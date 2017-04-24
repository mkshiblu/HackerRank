SELECT Doctor AS Doctors, Professor AS Professors, Singer AS Singers, Actor AS Actors
FROM
(
	SELECT Name, Occupation
		,ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS row_num
	FROM OCCUPATIONS
) AS o
PIVOT
(
	MAX(Name)
	FOR Occupation IN (Doctor, Professor, Singer, Actor)
) AS p;