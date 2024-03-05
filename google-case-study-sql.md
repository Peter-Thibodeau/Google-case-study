-- because plotting will be done separately with tableau, deletions and updates were used to make permanent changes to the data
-- the websites where I can run queries for free do not allow regex, so I am using "like" instead.

-- Create table
CREATE TABLE rides (
    ride_id string,
    rideable_type string,
    started_at timestamp,
    ended_at timestamp,
    start_station_name string,
    start_station_id string,
    end_station_name string,
    end_station_id string,
    start_lat float,
    start_lng float,
    end_lat float,
    end_lng float,
    member_casual string
)

--
SELECT * FROM `rides`
UNION ALL
SELECT * FROM `cyclistic.Jan 2022`
UNION ALL
SELECT * FROM `cyclistic.Feb 2022`
UNION ALL
SELECT * FROM `cyclistic.Mar 2022`
UNION ALL
SELECT * FROM `cyclistic.Apr 2022`
UNION ALL
SELECT * FROM `cyclistic.May 2022`
UNION ALL
SELECT * FROM `cyclistic.Jun 2022`
UNION ALL
SELECT * FROM `cyclistic.Jul 2022`
UNION ALL
SELECT * FROM `cyclistic.Aug 2022`
UNION ALL
SELECT * FROM `cyclistic.Sep 2022`
UNION ALL
SELECT * FROM `cyclistic.Oct 2022`
UNION ALL
SELECT * FROM `cyclistic.Nov 2022`
UNION ALL
SELECT * FROM `cyclistic.Dec 2021`

-- Delete rows with nulls
DELETE
  FROM `rides` 
  WHERE 
    ride_id IS NULL OR 
    rideable_type IS NULL OR
    started_at IS NULL OR    
    ended_at IS NULL OR      
    start_station_name IS NULL OR
    start_station_id IS NULL OR
    end_station_name IS NULL OR
    end_station_id IS NULL OR    
    start_lat IS NULL OR        
    start_lng IS NULL OR        
    end_lat IS NULL OR
    end_lng IS NULL OR        
    member_casual IS NULL

-- Check for unwanted punctuation
DELETE
 FROM `rides`
 WHERE start_station_name LIKE '%[,- !?;:/]%' OR end_station_name LIKE '%[,-!?;:/]%' 
    OR start_station_id LIKE '%[,!?;:/&]%' OR end_station_id LIKE '%[,!?;:/&]%'
    OR member_casual LIKE '%[,.-!?;:/&]%'    

-- Remove leading and trailing spaces
SELECT TRIM(start_station_name) AS start_station_name
FROM `rides`
-- repeat for all columns

-- Change case
UPDATE `rides` 
SET start_station_name = UPPER(start_station_name)
WHERE start_station_name != UPPER(start_station_name)

UPDATE `rides` 
SET end_station_name = UPPER(end_station_name)
WHERE end_station_name != UPPER(end_station_name)

UPDATE `rides` 
SET member_casual = UPPER(member_casual)
WHERE member_casual != UPPER(member_casual)

-- Create ride length field
SELECT
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length
  FROM `rides`

-- Create ride distance field
SELECT
    ACOS(COS(RADIANS(90-start_lat)) * COS(RADIANS(90-end_lat)) + SIN(RADIANS(90-start_lat)) *         SIN(RADIANS(90-end_lat)) * COS(RADIANS(start_lng-end_lng))) * 3959
    AS ride_dist_mi 
  FROM `rides`

-- Create day of week field
SELECT
  DAYNAME(started_at) as day_of_week
  FROM `rides`

-- Create month field
SELECT
  MONTH(started_at) as month
  FROM `rides`

-- Analyze bike type
SELECT
  rideable_type,
  member_casual,
  COUNT(rideable_type) AS bikes
  FROM `rides`
  GROUP BY rideable_type, member_casual

-- Analyze ride length
SELECT 
  member_casual,
  COUNT(ride_length)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  MAX(ride_length)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  MIN(ride_length)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  AVG(ride_length)
  FROM `rides`
  GROUP BY member_casual

-- Analyze ride distance
SELECT 
  member_casual,
  COUNT(ride_dist_mi)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  MAX(ride_ dist_mi)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  MIN(ride_ dist_mi)
  FROM `rides`
  GROUP BY member_casual

SELECT 
  member_casual,
  AVG(ride_ dist_mi)
  FROM `rides`
  GROUP BY member_casual

-- Analyze day of week
SELECT
  member_casual,
  day_of_week,
  COUNT(day_of_week) AS days
  FROM `rides`
  GROUP BY day_of_week, member_casual
 
-- Analyze month
SELECT
  member_casual,
  month,
  COUNT(month) AS months
  FROM `rides`
  GROUP BY month, member_casual

