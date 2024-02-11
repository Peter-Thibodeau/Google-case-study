# Introduction
This is my case study for the Google Data Analytics Certificate Course.

Cyclistic, a Chicago bike-sharing company, offers conventional and electric bikes to users. The company has concentrated its marketing on appealing to the broad market by offering single-ride passes, full-day passes, and annual memberships. Customers opting for the first two options are called "casuals," and those who chose the last option are called "members."

The financial team has determined that members are more profitable than casuals, and marketing has been tasked with the conversion program.

As a marketing team member, I have been assigned to answer the question, "How do Cyclistic members and casuals use Cyclistic bikes differently." Also, I must provide recommendations for converting the casuals to annual members.


# The Data
The data is actual transactions from Cyclistic is a bike-share company based in Chicago. It is available from Divvy/Lyft Bikes and Scooters at this link: https://divvy-tripdata.s3.amazonaws.com/index.html Divvy/Lyft Bikes is a division of the popular ride share company called Lyft. The terms of use for the data can be found at https://divvybikes.com/data-license-agreement.

## How is the data organized?
There are 12 csv files, 1 for each month for 12 consecutive months: Dec 2021 to November 2022. Each file is a table with the same schema.

<img width="331" alt="image" src="https://github.com/Peter-Thibodeau/Google-case-study/assets/158618486/dc6c4e23-8e70-4846-8f5e-696e3a7b3413">

## Column descriptions:
1.	ride_id is a unique string assigned to a single trip
2.	rideable_type is the type of bicycle chosen
3.	started_at start time for the trip
4.	ended_at end time for the trip
5.	start_station_name station where the trip started
6.	start_station_id the unique identifier of the station where the trip started
7.	end_station_name station where the trip ended
8.	end_station_id the unique identifier of the station where the trip ended
9.	the latitude of the station where the trip started
10.	the longitude of the station where the trip started
11.	the latitude of the station where the trip ended
12.	the longitude of the station where the trip ended
13.	the customer is either a casual user or an annual member

## Outliers
<img width="454" alt="image" src="https://github.com/Peter-Thibodeau/Google-case-study/assets/158618486/e0c55bab-cf60-4026-982f-c91392f89d0c">

Because there are over 4,500,000 records, a single dot is assumed to be an outlier  
- All of the outliers are > 2000 minutes and were deleted.



# Data Cleaning
Records with null values in the following fields were deleted because they are unusable:
- started_at
- ended_at  
- start_station_name
- end_station_name  
- start_station_id
- end_station_id  
- start_lat
- end_lat  
- start_lng
- end_lng  
- member_casual  
- rideable_type
  
Some fields cannot have certain characters or punctuation. Records that violated this were deleted. The fields affected are:  
- start_station_name and end_station_name (can only contain alphanumeric characters and periods and ampersands)  
- start_station_id and end_station_id (can only contain alphanumeric characters and dashes)  
- member_casual (can only contain letters)  

Fields with leading and trailing spaces were trimmed.  

Values in some fields had different case. To correct this, the following fields were converted to upper case:  
- start_station_name  
- end_station_name  
- member_casual
  
A field named ride_length was created by subtracting the value in the started_at field from the value in the ended_at field.  
- The resulting values are in minutes.  
- Because it doesn't seem reasonable to rent a bike for 5 minutes or less, ride_length values <= 5 minutes were deleted. 

A field named ride_dist by was created by a calculation that uses values from the following fields:  
- start_lat
- start_lng  
- end_lat
- end_lng fields  

- ride_dist values < 1/10 of a mile were deleted
  
A field named day_of_week was created by extracting the day from the datetime stamp in the ride_id field.  

A field named month was created by extracting the month from the datetime stamp in the ride_id field. 
