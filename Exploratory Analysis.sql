
SELECT Attendance, gd.Day_of_Week, gd.Game_Time, gd.Game_Date, m.Away_Team, Home_Record, Away_Record 
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
WHERE Stadium  REGEXP 'Moda Center'
ORDER BY Attendance DESC 
;

# By day of week
SELECT ROUND(AVG(Attendance)), gd.Day_of_Week, COUNT(gd.game_id)  
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
WHERE Stadium  REGEXP 'Moda Center'
GROUP BY gd.Day_of_Week 
ORDER BY AVG(Attendance) DESC 
;

# By month
SELECT MONTH(gd.Game_Date), ROUND(AVG(Attendance)), COUNT(gd.game_id)  
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
WHERE Stadium  REGEXP 'Moda Center'
GROUP BY MONTH (gd.Game_Date)
-- ORDER BY AVG(Attendance) DESC 
;

# By team
SELECT ROUND(AVG(Attendance)), m.Away_Team, COUNT(gd.game_id)
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
WHERE Stadium  REGEXP 'Moda Center'
GROUP BY m.Away_Team 
ORDER BY AVG( Attendance) DESC 
;

# By number of inactive players
SELECT Attendance, gd.Day_of_Week, gd.Game_Time, gd.Game_Date, m.Away_Team, 
	COUNT(CASE WHEN id.Team = 'Portland Trail Blazers' THEN 1 END) as POR_Inactives, 
	COUNT(CASE WHEN id.Team != 'Portland Trail Blazers' THEN 1 END) as Away_inactives,
	COUNT(id.game_id)  as total_inactives
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
JOIN inactive_data id ON id.game_id = gd.game_id 
WHERE Stadium  REGEXP 'Moda Center'
GROUP BY id.game_id 
ORDER BY Attendance DESC 
;
WITH inactives_per_game AS (
	SELECT Attendance, gd.Day_of_Week, gd.Game_Time, gd.Game_Date, m.Away_Team, 
		COUNT(CASE WHEN id.Team = 'Portland Trail Blazers' THEN 1 END) as POR_Inactives, 
		COUNT(CASE WHEN id.Team != 'Portland Trail Blazers' THEN 1 END) as Away_inactives,
		COUNT(id.game_id)  as total_inactives
	FROM game_data gd 
	JOIN Matchups m ON gd.game_id = m.game_id 
	JOIN inactive_data id ON id.game_id = gd.game_id 
	WHERE Stadium  REGEXP 'Moda Center'
	GROUP BY id.game_id 
	ORDER BY Attendance DESC 
)
SELECT ROUND( AVG(Attendance)) , total_inactives, COUNT(total_inactives)
FROM inactives_per_game
GROUP BY total_inactives
ORDER BY total_inactives
;

# by num all stars inactive
WITH all_star_inactives AS (
SELECT  Attendance, gd.Day_of_Week, gd.Game_Time, gd.Game_Date, m.Away_Team, gd.Home_Wins / (gd.Home_Wins + gd.Home_Losses ) as 'Home_Win%' , gd.Away_Wins / (gd.Away_Wins + gd.Away_Losses ) as 'Away_Win%' ,
	COUNT(CASE WHEN id.Player IN (
		SELECT as2.Name 
		FROM All_stars as2 ) THEN 1 END
	) AS num_all_stars_inactive
FROM game_data gd 
JOIN Matchups m ON gd.game_id = m.game_id 
JOIN inactive_data id ON id.game_id = gd.game_id 
WHERE Stadium  REGEXP 'Moda Center'
GROUP BY id.game_id 
ORDER BY Attendance DESC 
)
SELECT ROUND( AVG(Attendance)), num_all_stars_inactive, COUNT(num_all_stars_inactive) 
FROM all_star_inactives
GROUP BY num_all_stars_inactive
ORDER BY num_all_stars_inactive 
;
