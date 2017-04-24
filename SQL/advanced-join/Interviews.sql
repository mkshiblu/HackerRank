SELECT con.contest_id, hacker_id, name, total_submissions, total_accepted_submissions, total_views, total_unique_views
FROM Contests AS con
LEFT JOIN
(
	SELECT contest_id
			, SUM(total_submissions) AS total_submissions
			, SUM(total_accepted_submissions) AS total_accepted_submissions
			, SUM(total_views) AS total_views
			, SUM(total_unique_views) AS total_unique_views
	FROM Colleges AS col
	LEFT JOIN Challenges AS ch ON (ch.college_id = col.college_id)
	LEFT JOIN
	(
		SELECT challenge_id
			   , SUM(total_submissions) AS total_submissions
			   , SUM(total_accepted_submissions) AS total_accepted_submissions
			   , 0 AS total_views
			   , 0 AS total_unique_views
		FROM Submission_Stats
		GROUP BY challenge_id
		UNION
		SELECT challenge_id
			   , 0 AS total_submissions
			   , 0 AS total_accepted_submissions
			   , SUM(total_views) AS total_views
			   , SUM(total_unique_views) AS total_unique_views
		FROM View_Stats
		GROUP BY challenge_id
	) AS s ON (s.challenge_id = ch.challenge_id)
	GROUP BY contest_id
) AS ch ON (ch.contest_id = con.contest_id)
WHERE total_submissions + total_accepted_submissions + total_views + total_unique_views != 0
ORDER BY contest_id;