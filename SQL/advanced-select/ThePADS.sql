SELECT Name + '(' + LEFT(Occupation, 1) + ')' AS Name
FROM OCCUPATIONS
ORDER BY Name;

SELECT 'There are total ' + CAST(COUNT(*) AS VARCHAR) + ' ' 
+ CASE Occupation
    WHEN 'Doctor' THEN 'doctors'
    WHEN 'Professor' THEN 'professors'
    WHEN 'Singer' THEN 'singers'
    WHEN 'Actor' THEN 'actors'
  END
+ '.' AS OccupationCount
FROM OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*);