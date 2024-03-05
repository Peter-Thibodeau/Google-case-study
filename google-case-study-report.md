# Introduction
Cyclistic, a Chicago bike-sharing company, offers conventional and electric bikes to users. The company has concentrated its marketing on appealing to the broad market by offering single-ride passes, full-day passes, and annual memberships. Customers opting for the first two options are called "casuals," those who chose the last option are called "members."

The financial team has determined that annual members are more profitable than casual users. Marketing has been tasked with converting casual users to annual members.

As a marketing team member, my assignment is to answer the question, "How do Cyclistic members and casuals differ." Also, I must provide recommendations for converting the casuals to annual members.


# Data Source
The data contains transactions from Cyclistic is a bike-share company based in Chicago. It is available from Divvy/Lyft Bikes and Scooters at this link: https://divvy-tripdata.s3.amazonaws.com/index.html Divvy/Lyft Bikes is a division of the popular ride share company called Lyft. The terms of use for the data can be found at https://divvybikes.com/data-license-agreement.

# Data Exploration
## Descriptions of Variables
| Variable           | Nulls   | Datatype  | Description                               |
| :---               | :---    | :---      | :---                                      |
| ride_id            | 0       | varchar    | a unique string assigned to a single trip |
| rideable_type      | 0       | varchar   | the type of bicycle chosen                |
| started_at         | 0       | timestamp | time trip started                         |
| ended_at           | 0       | timestamp | time trip ended                           |
| start_station_name | 612,756 | varchar   | station where the trip started            |
| start_station_id   | 612,768 | varchar   | unique identifier for start station       |
| end_station_name   | 642,000 | varchar   | station where the trip started            |
| end_station_id     | 642,012 | varchar   | unique identifier for end station         |
| start_lat          | 48      | decimal   | latitude of start station                 |
| start_lng          | 60      | decimal   | longitude of start station                |
| end_lat            | 1,800   | decimal   | latitude of end station                   |
| end_lng            | 1,812   | decimal   | longitude of end station                  |
| member_casual      | 96      | varchar   | annual member or casual user              |

## Variable Handling
| Variable           | Omit | Reason                                                 |
| :---               | :--- | :---                                                   |
| ride_id            | no   | is not relevant to analysis                            |  
| rideable_type      | yes  | for comparing bicycle type used by members and casuals |
| started_at         | yes  | for calculating trip length                            |
| ended_at           | yes  | for calculating trip length                            |
| start_station_name | no   | too many null values to be useful                      |
| start_station_id   | no   | too many null values to be useful                      |
| end_station_name   | no   | too many null values to be useful                      |
| end_station_id     | no   | too many null values to be useful                      |
| start_lat          | yes  | for calculating trip distance                          |
| start_lng          | yes  | for calculating trip distance                          |
| end_lat            | yes  | for calculating trip distance                          |
| end_lng            | yes  | for calculating trip distance                          |
| member_casual      | yes  | for comparing members to casuals                       |

# Data Cleaning
## Tasks
- Remove leading and trailing spaces from all variables.
- Remove records with null values in start_lat, start_lng, end_lat, end_lng, and member_casual.
- Remove punctuation marks from strings, but leave ampersands (&) in station name variables where present.

## Filtering
Ride lengths:
The average speed for a person riding a bicycle is 12mph, and the shortest distance between two stations is one half mile. Thus, the shortest possible ride length is 6 minutes and any record with a ride length less than that will be removed.

## New Variables
- ride_length: calculated by subtracting end_time from start_time
- day: extracted from day and week in start_time and end_time
- month: extracted from month and year in start_time and end_time
- season: assigned months to one of four groups (one group for each season)
