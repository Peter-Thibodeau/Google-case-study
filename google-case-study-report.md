# Introduction
This is my case study for the Google Data Analytics Certificate Course.

Cyclistic, a Chicago bike-sharing company, offers conventional and electric bikes to users. The company has concentrated its marketing on appealing to the broad market by offering single-ride passes, full-day passes, and annual memberships. Customers opting for the first two options are called "casuals," and those who chose the last option are called "members."

The financial team has determined that members are more profitable than casuals, and marketing has been tasked with the conversion program.

As a marketing team member, I have been assigned to answer the question, "How do Cyclistic members and casuals use Cyclistic bikes differently." Also, I must provide recommendations for converting the casuals to annual members.

# Data Source
The data contains transactions from Cyclistic is a bike-share company based in Chicago. It is available from Divvy/Lyft Bikes and Scooters at this link: https://divvy-tripdata.s3.amazonaws.com/index.html Divvy/Lyft Bikes is a division of the popular ride share company called Lyft. The terms of use for the data can be found at https://divvybikes.com/data-license-agreement.

# Data Exploration
## Descriptions of Variables
| Variable           | Nulls   | Data Type | Description                               |
| ------------------ | ------- | --------- | ----------------------------------------- |
| ride_id            | 0       | string    | a unique string assigned to a single trip |
| rideable_type      | 0       | string    | the type of bicycle chosen                |
| started_at         | 0       | timestamp | time trip started                         |
| ended_at           | 0       | timestamp | time trip ended                           |
| start_station_name | 612,756 | string    | station where the trip started            |
| start_station_id   | 612,768 | string    | unique identifier for start station       |
| end_station_name   | 642,000 | string    | station where the trip started            |
| end_station_id     | 642,012 | string    | unique identifier for end station         |
| start_lat          | 48      | decimal   | latitude of start station                 |
| start_lng          | 60      | decimal   | longitude of start station                |
| end_lat            | 1,800   | decimal   | latitude of end station                   |
| end_lng            | 1,812   | decimal   | longitude of end station                  |
| member_casual      | 96      | string    | annual member or casual user              |

## Variable Handling
- timestamp: not relevant OMIT
- industry:   
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1. has 1,101 unique values, remove values that are less than ten percent of all records  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2. consolidate the remaining into 16 values to make plotting manageable
- job_title: has too many unique values to be useful OMIT
- job_title_info: has too many null values to be useful OMIT
- annual_salary: use as is
- additional: has too many null values to be useful OMIT
- currency: use as is
- other_info: has too many null values to be useful OMIT
- income_context: has too many null values to be useful OMIT
- country: location will not be used in the analysis OMIT
- state: location will not be used in the analysis OMIT
- city: location will not be used in the analysis OMIT
- years_exp: use as is
- years_exp_in_field:  use as is
- education:  use as is
- gender:  use as is
- race: has forty-eight unique values, many of which are similar, and can be consolidated into six values

# Data Cleaning
- Remove leading and trailing spaces.
- Remove duplicate records.
- Remove null values in industry, education, gender, and race variables.
- Change strings to upper case.
- Remove punctuation marks.
- Change the datatype of annual_salary to integer.

## Filtering
Age  
- The age for earning an annual salary can be assumed to apply only to adults, so remove records with the string "under 18."
- Many workers aged sixty-five and older do not work a 40-hour work week, which will skew the results, so remove records with the string "65 and over."

Annual salary  
- Assuming that a work week is at least 40 hours and the national minimum wage is $7, the minimum annual_salary will be  $7 X 40 hours X 52 weeks = $14,560.
- Annual salaries above one million will skew the results, so remove those records.

Currency
- Remove the string "other."
- Remove currencies present in less than ten percent of total records.

Education 
- Change the string "some college" to "high school."
- Change the string "college education" to "bachelor's degree."

Gender 
- Remove records with strings "Other or prefer not to answer" and "Prefer not to answer."

Race 
- Remove records with the string "another option not listed here."


## New Variables
- Records with a currency other than U.S. dollars must be converted to U.S. dollars for a meaningful comparison. The name of the new variable will be annual_salary_USD. These are the exchange rates used:

| Country       | Exchange rate in U.S. dollars |
| ------------- | ----------------------------- |
| Austrailia    | 1.53                          |
| Canada        | 1.35                          |
| Europe        | 1.08                          |
| Great Britain | 1.26                          |
