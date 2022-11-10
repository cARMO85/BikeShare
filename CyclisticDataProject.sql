SELECT TOP (1000) 
	   [ride_id]
      ,[rideable_type]
      ,[started_at]
      ,[ended_at]
      ,[start_station_name]
      ,[start_station_id]
      ,[end_station_name]
      ,[end_station_id]
      ,[start_lat]
      ,[start_lng]
      ,[end_lat]
      ,[end_lng]
      ,[ride_distance]
      ,[day_of_week]
      ,[member_casual]
  FROM [Capstone].[dbo].[2021_12]

--------------------------------------------------------

-- Calculating the avereage ride_length per MEMBER type

SELECT
	member_casual,
	AVG(CAST((ended_at - started_at) AS float)) AS avg_ride_length
FROM 
	[Capstone].[dbo].[2021_12]
GROUP BY
	member_casual

-- Calculating ride_length

SELECT 
	CAST((ended_at - started_at) AS float) AS ride_length
FROM 
	[Capstone].[dbo].[2021_12]


--------------------------------------------------------

-- Calculating the avereage ride_length per DAY of the MONTH

SELECT
	DAY(started_at) AS day_of_month,
	AVG(CAST((ended_at - started_at) AS float)) AS avg_ride_length
FROM
	[Capstone].[dbo].[2021_12]
GROUP BY
	DAY(started_at)
ORDER BY
	DAY(started_at) ASC

-------------------------------------------------------

-- Altering table "2021_12"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_12]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_12]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_12]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_12]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_12]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_12]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1.0000000000) and values under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_12]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_11"

-- Adding "ride_length" column 
-- NOTE: a different formula is needed because "ended_at" and "started_at" are stored as datetime2(7)

ALTER TABLE	[Capstone].[dbo].[2021_11]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_11]
ADD ride_length AS 
	 CAST(CAST(ended_at AS datetime) - CAST(started_at AS datetime) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_11]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_11]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_11]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_11]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_11]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_10"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_10]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_10]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_10]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_10]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_10]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_10]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_10]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_09"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_09]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_09]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_09]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_09]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_09]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_09]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_09]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_08"

-- Adding "ride_length" column
-- NOTE: a different formula is needed because "ended_at" and "started_at" are stored as datetime2(7)

ALTER TABLE	[Capstone].[dbo].[2021_08]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_08]
ADD ride_length AS 
	 CAST(CAST(ended_at AS datetime) - CAST(started_at AS datetime) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_08]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_08]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_08]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_08]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_08]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_07"

-- Adding "ride_length" column 
-- NOTE: a different formula is needed because "ended_at" and "started_at" are stored as datetime2(7)

ALTER TABLE	[Capstone].[dbo].[2021_07]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_07]
ADD ride_length AS 
	 CAST(CAST(ended_at AS datetime) - CAST(started_at AS datetime) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_07]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_07]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_07]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_07]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_07]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering tableng table "2021_06"

-- Adding "ride_length" column 
-- NOTE: a different formula is needed because "ended_at" and "started_at" are stored as datetime2(7)

ALTER TABLE	[Capstone].[dbo].[2021_06]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_06]
ADD ride_length AS 
	 CAST(CAST(ended_at AS datetime) - CAST(started_at AS datetime) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_06]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_06]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_06]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_06]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_06]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_05"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_05]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_05]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_05]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_05]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_05]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_05]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_05]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_04"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_04]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_04]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_04]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_04]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_04]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_04]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_04]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_03"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_03]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_03]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_03]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_03]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_03]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_03]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_03]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_02"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_02]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_02]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_02]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_02]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_02]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_02]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_02]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Altering table "2021_01"

-- Adding "ride_length" column

ALTER TABLE	[Capstone].[dbo].[2021_01]
DROP COLUMN IF EXISTS ride_length
ALTER TABLE	[Capstone].[dbo].[2021_01]
ADD ride_length AS 
	CAST((ended_at - started_at) AS float)

-- Adding "month" column

ALTER TABLE	[Capstone].[dbo].[2021_01]
DROP COLUMN IF EXISTS month
ALTER TABLE	[Capstone].[dbo].[2021_01]
ADD month AS MONTH(started_at)

-- Adding "season" column

ALTER TABLE	[Capstone].[dbo].[2021_01]
DROP COLUMN IF EXISTS season
ALTER TABLE	[Capstone].[dbo].[2021_01]
ADD season AS CASE
			WHEN MONTH(started_at) IN ('12', '1', '2')
				THEN 'winter'
			WHEN MONTH(started_at) IN ('3', '4', '5')
				THEN 'spring'
			WHEN MONTH(started_at) IN ('6', '7', '8')
				THEN 'summer'
			WHEN MONTH(started_at) IN ('9', '10', '11')
				THEN 'fall'
			END

-- Deleting ride_length values over 24 hours (= 1) and under 2 minutes (= 0.00138888888888889)

DELETE
FROM Capstone.dbo.[2021_01]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889

-------------------------------------------------------

-- Verifying if the new 'ride_length' column can be used to make grouped calculations

SELECT 
	member_casual, 
	AVG(ride_length) As avg_ride_length
FROM Capstone.dbo.[2021_12]
GROUP BY member_casual 

-------------------------------------------------------

-- Verifying for ride_length values over 24 hours (= 1) or under 2 minutes (= 0.00138888888888889)

SELECT ride_length
FROM [Capstone].[dbo].[2021_12]
WHERE ride_length >= 1 OR ride_length <= 0.00138888888888889
ORDER BY ride_length DESC

-- None left

-------------------------------------------------------

-- Verifying again

SELECT ride_length
FROM Capstone.dbo.[2021_12]
--WHERE ride_length BETWEEN 0.00138888888888889 AND 1
ORDER BY ride_length DESC

-- Both queries give the same results

--------------------------------------------------------

-- Looking at average average ride_distance

SELECT AVG(ride_distance)
FROM Capstone.dbo.[2021_12]

-- Result is slightly over 3000000 (or 3,000 kilometers), which seems high

SELECT *
FROM Capstone.dbo.[2021_10]
ORDER BY ride_distance DESC

-- The highest ride_distance values are over 9000000 (m), or over 9,000 kilometers.
-- This is most likely due to a calculation error since the endpoints' latitudes and longitudes were NULL to begin with.

-- Updating tables to remove faulty ride_distance values

UPDATE Capstone.dbo.[2021_12]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_11]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_10]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_09]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_08]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_07]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_06]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_05]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_04]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_03]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_02]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

UPDATE Capstone.dbo.[2021_01]
SET ride_distance = NULL
WHERE end_lat IS NULL AND end_lng IS NULL

-- Verifying the new average ride_distance

SELECT AVG(ride_distance)
FROM Capstone.dbo.[2021_12]

-- Result: 1992.05504605717 (or 1.992 kilometer)

--------------------------------------------------------

-- Looking for duplicate values

SELECT 
  [ride_id],
  [rideable_type],
  [started_at],
  [ended_at],
  ROW_NUMBER() OVER (
    PARTITION BY [ride_id],
    [rideable_type],
    [started_at],
    [ended_at]
    ORDER BY
      [ride_id],
      [rideable_type],
      [started_at],
      [ended_at]
  ) DupRank
FROM Capstone.dbo.[2021_01]
ORDER BY DupRank DESC

-- No duplicate values were found in any of the 12 tables

-- Looking for duplicate ride_id values

SELECT
  [ride_id],
  ROW_NUMBER() OVER (
    PARTITION BY [ride_id]
    ORDER BY
      [ride_id]
  ) DupRank
FROM Capstone.dbo.[2021_08]
ORDER BY DupRank DESC

-- 22 duplicate ride_id values were found in '2021_08'

WITH DuplicateCTE AS (
  SELECT
    [ride_id],
    ROW_NUMBER() OVER (
      PARTITION BY [ride_id]
      ORDER BY
        [ride_id]
    ) DupRank
  FROM Capstone.dbo.[2021_08]
)
DELETE FROM DuplicateCTE
WHERE DupRank > 1


--------------------------------------------------------

-- Testing out UNION query

SELECT started_at
FROM Capstone.dbo.[2021_12]
UNION
SELECT started_at
FROM Capstone.dbo.[2021_11]

= 266963 rows

SELECT COUNT(DISTINCT started_at)
FROM Capstone.dbo.[2021_12]

SELECT COUNT(DISTINCT started_at)
FROM Capstone.dbo.[2021_11]

-- 38118 + 228845 = 266963 rows

--------------------------------------------------------

-- Creating a new table to combine all 12 tables

DROP TABLE IF EXISTS Capstone.dbo.total_2021
CREATE TABLE Capstone.dbo.total_2021 (
  ride_id NVARCHAR(MAX),
  member_casual NVARCHAR(MAX),
  rideable_type NVARCHAR(MAX),
  started_at DATETIME,
  ended_at DATETIME,
  start_station_name NVARCHAR(MAX),
  start_station_id NVARCHAR(MAX),
  end_station_name NVARCHAR(MAX),
  end_station_id NVARCHAR(MAX),
  ride_distance FLOAT,
  ride_length FLOAT,
  day_of_week INT,
  month INT,
  season NVARCHAR(MAX)
)

INSERT INTO Capstone.dbo.total_2021
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_12]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_11]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_10]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_09]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_08]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_07]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_06]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_05]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_04]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_03]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_02]
UNION
SELECT
	  [ride_id],
	  [member_casual],
      [rideable_type],
      [started_at],
      [ended_at],
      [start_station_name],
      [start_station_id],
      [end_station_name],
      [end_station_id],
      [ride_distance],
	  [ride_length],
      [day_of_week],
	  [month],
	  [season]
FROM [Capstone].[dbo].[2021_01]

-- Getting error message: "Error converting data type nvarchar to float."
-- Column day_of_week was entered as a FLOAT. Converting day_of_week from FLOAT to INT instead (in all 12 tables)

ALTER TABLE [Capstone].[dbo].[2021_12]
ALTER COLUMN day_of_week INT

-- Getting the same error message again
-- start_station_id and end_station_id are set as FLOAT in some tables; they should be set as NVARCHAR

ALTER TABLE [Capstone].[dbo].[2021_04]
ALTER COLUMN start_station_id NVARCHAR(MAX)
ALTER TABLE [Capstone].[dbo].[2021_04]
ALTER COLUMN end_station_id NVARCHAR(MAX)

-- INSERT INTO... Query successful: 5397519 rows affected

-- Adding start_lat and start_lng columns

ALTER TABLE Capstone.dbo.total_2021
ADD start_lat FLOAT 
ALTER TABLE Capstone.dbo.total_2021
ADD start_lng FLOAT 

INSERT INTO Capstone.dbo.total_2021
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_12]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_11]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_10]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_09]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_08]
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_07]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_06]

SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_05]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_04]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_03]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_02]
UNION
SELECT
	 start_lat,
	 start_lng
FROM [Capstone].[dbo].[2021_01]


--------------------------------------------------------

-- AVERAGE RIDE LENGTHS

-- Calculating average ride length

SELECT CAST(CAST(AVG(ride_length)AS datetime)AS time) AS avg_ride_length
FROM Capstone.dbo.total_2021

-- Calculating average ride length per USER type

SELECT 
	member_casual,
	CAST(CAST(AVG(ride_length)AS datetime)AS time) AS avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY member_casual

-- Calculating average ride length per BIKE type

SELECT 
	rideable_type,
	CAST(CAST(AVG(ride_length)AS datetime)AS time) AS avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY rideable_type

-- Calculating average ride length per DAY of the week

SELECT 
	day_of_week,
	CAST(CAST(AVG(ride_length)AS datetime)AS time) AS avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY day_of_week 
ORDER BY day_of_week 

-- Calculating average ride length per MONTH

SELECT 
	month,
	CAST(CAST(AVG(ride_length)AS datetime)AS time) AS avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY month
ORDER BY month

SELECT DISTINCT DATENAME(mm, started_at), month
FROM Capstone.dbo.total_2021
ORDER BY month 

-- Calculating average ride length per SEASON

SELECT 
	season,
	CAST(CAST(AVG(ride_length)AS datetime)AS time) avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY season

-- Calculating average ride length per DATE, for each USER type

SELECT
	DISTINCT CONVERT(date, started_at) AS date,
	member_casual,
	AVG(ride_length) AS avg_ride_length
FROM Capstone.dbo.total_2021
GROUP BY 
	CONVERT(date, started_at),
	member_casual
ORDER BY CONVERT(date, started_at)

--------------------------------------------------------------

-- NUMBER OF RIDES

-- Calculating number of rides per MONTH

SELECT 
	month,
	DATENAME(mm, started_at),
	COUNT(ride_id)
FROM Capstone.dbo.total_2021
GROUP BY 
	month,
	DATENAME(mm, started_at)
ORDER BY month

-- Calculating number of rides per USER type

SELECT
	member_casual,
	COUNT(ride_id)
FROM Capstone.dbo.total_2021
GROUP BY member_casual 

-- Calculating number of rides per BIKE type and USER type

SELECT
	rideable_type, 
	member_casual,
	COUNT(*) AS rides
FROM Capstone.dbo.total_2021
GROUP BY 
	rideable_type,
	member_casual
	
-- Calculating number of rides per SEASON

SELECT
	member_casual, 
	season,
	COUNT(ride_id) AS rides
FROM Capstone.dbo.total_2021
GROUP BY 
	member_casual,
	season

-- Calculating AVERAGE number of rides per DAY of the week, per USER type

SELECT 
	member_casual,
	day_of_week,
	DATENAME(WEEKDAY, started_at) AS day_name,
	COUNT(*) / 52 AS ride_count
FROM Capstone.dbo.total_2021
GROUP BY 
	member_casual,
	day_of_week,
	DATENAME(WEEKDAY, started_at)
ORDER BY day_of_week 

-- Calculating number of rides per USER type every WEEK

SELECT
	DISTINCT CAST(DATENAME(wk, started_at) AS int) AS week,
	member_casual,
	COUNT(*)
FROM Capstone.dbo.total_2021
GROUP BY 
	CAST(DATENAME(wk, started_at) AS int),
	member_casual 
ORDER BY CAST(DATENAME(wk, started_at) AS int)

-- Calculating number of rides per MONTH, for each BIKE type and USER type

SELECT
	month,
	DATENAME(mm, started_at) AS month_name,
	rideable_type,
	member_casual,
	COUNT(*) AS number_of_rides
FROM Capstone.dbo.total_2021
GROUP BY 
	month,
	DATENAME(mm, started_at),
	rideable_type,
	member_casual
ORDER BY month

-- Calculating number of rides per PERIOD of the day (morning, afternoon, evening, night) per USER type

SELECT
	member_casual,
	CASE 
		WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
			THEN 'morning'
		WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
			THEN 'afternoon'
		WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
			THEN 'evening'
		ELSE 'night'
	END AS period_of_day,
	COUNT(*) AS rides
FROM Capstone.dbo.total_2021
GROUP BY 
		member_casual,
		CASE 
			WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
				THEN 'morning'
			WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
				THEN 'afternoon'
			WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
				THEN 'evening'
			ELSE 'night'
		END

-- Calculating number of rides per PERIOD of the day, per HOUR, per USER type

SELECT
	DATEPART(HOUR, started_at) AS time,
	member_casual,
	CASE 
		WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
			THEN 'morning'
		WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
			THEN 'afternoon'
		WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
			THEN 'evening'
		ELSE 'night'
	END AS period_of_day,
	COUNT(*) AS rides
FROM Capstone.dbo.total_2021
GROUP BY 
		DATEPART(HOUR, started_at),
		member_casual,
		CASE 
			WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
				THEN 'morning'
			WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
				THEN 'afternoon'
			WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
				THEN 'evening'
			ELSE 'night'
		END
ORDER BY DATEPART(HOUR, started_at)

-- Calculating number of rides per PERIOD of the day, per MONTH and per USER

SELECT CASE 
	WHEN period_of_day = 'morning'
		THEN 1
	WHEN period_of_day = 'afternoon'
		THEN 2
	WHEN period_of_day = 'evening'
		THEN 3
	WHEN period_of_day = 'night'
		THEN 4
	END AS period,
	period_of_day,
	member_casual,
	month,
	month_name,
	rides
FROM (
	SELECT CASE 
			WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
				THEN 'morning'
			WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
				THEN 'afternoon'
			WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
				THEN 'evening'
			ELSE 'night'
			END AS period_of_day,
			member_casual,
			month,
			DATENAME(MONTH, started_at) AS month_name,
			COUNT(*) AS rides
	FROM Capstone.dbo.total_2021
	GROUP BY CASE 
			WHEN CONVERT(time, started_at) BETWEEN '06:00:00' AND '11:59:59'
				THEN 'morning'
			WHEN CONVERT(time, started_at) BETWEEN '12:00:00' AND '16:59:59'
				THEN 'afternoon'
			WHEN CONVERT(time, started_at) BETWEEN '17:00:00' AND '20:59:59'
				THEN 'evening'
			ELSE 'night'
			END,
			member_casual ,
			month,
			DATENAME(MONTH, started_at)
		 ) a
GROUP BY 
	period_of_day,
	member_casual,
	month,
	month_name,
	member_casual, 
	rides
ORDER BY 
	month,
	period

--------------------------------------------------------------------

-- DISTANCE TRAVELED

-- Calculating total distance (kilometers) traveled by each USER type

SELECT
	member_casual,
	SUM(ride_distance)/1000 total_distance_traveled
FROM Capstone.dbo.total_2021
GROUP BY member_casual 

-- Calculating distance traveled (kilometers) by each USER type every WEEK

SELECT
	DISTINCT CAST(DATENAME(wk, started_at) AS int) AS week,
	member_casual,
	SUM(ride_distance)/1000 total_distance_traveled
FROM Capstone.dbo.total_2021
GROUP BY 
	CAST(DATENAME(wk, started_at) AS int),
	member_casual 
ORDER BY CAST(DATENAME(wk, started_at) AS int)

-- Calculating average DAILY distance (meters) traveled by each USER type per DAY

SELECT
	DISTINCT CONVERT(date, started_at) AS date,
	member_casual,
	AVG(ride_distance) AS distance_traveled
FROM Capstone.dbo.total_2021
GROUP BY 
	CONVERT(date, started_at),
	member_casual
ORDER BY CONVERT(date, started_at)

-- Calculating average DAILY distance (kilometers) traveled by each USER type per SEASON

SELECT
	member_casual,
	AVG(ride_distance)/1000 AS distance_traveled,
	CASE 
	WHEN season = 'winter'
		THEN 1
	WHEN season = 'spring'
		THEN 2
	WHEN season = 'summer'
		THEN 3
	WHEN season = 'fall'
		THEN 4
	END AS season_rank,
	season
FROM Capstone.dbo.total_2021
GROUP BY 
	member_casual,
	season
ORDER BY season


-- Calculating average distance by replacing ZERO values with AVERAGE value

SELECT AVG(ride_distance)
FROM Capstone.dbo.total_2021
--WHERE ride_distance != 0

-- Normal Result = 2261.98052468958
-- !0 Result = 2366.44171172156

SELECT 
	member_casual,
	AVG(replaced_zero_distance)
FROM (
	SELECT
		member_casual,
		CASE 
			WHEN
				ride_distance = 0
				THEN AVG(ride_distance)
				ELSE ride_distance
		END AS replaced_zero_distance
	FROM Capstone.dbo.total_2021
	GROUP BY 
		member_casual,
		ride_distance 
	) a
GROUP BY member_casual

-- Casual: 2902.95627599535
-- Member: 2808.68823291189

SELECT *
FROM Capstone.dbo.total_2021
ORDER BY started_at 

--------------------------------------------------------------------

-- Calculating the top 50 busiest STATIONS

SELECT TOP (50)
	member_casual,
	start_station_name,
	COUNT(*) AS rides
FROM Capstone.dbo.total_2021
WHERE start_station_name IS NOT NULL
GROUP BY 
	member_casual,
	start_station_name
ORDER BY COUNT(*) DESC;


