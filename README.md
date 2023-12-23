# Leveraging the pNEUMA Dataset: Building a Data Pipeline with dbt and PostgreSQL

## Introduction

The modern data landscape is marked by an abundance of datasets that serve as valuable resources for gaining insights and making informed decisions. Among these, the pNEUMA dataset stands out as a rich source of information, offering unique opportunities for analysis and interpretation. This essay explores the significance of the pNEUMA dataset and outlines the development of a data pipeline using dbt (data build tool) and PostgreSQL.

## Understanding the pNEUMA Dataset

Understanding the structure and organization of the pNEUMA dataset is crucial for effectively analyzing and extracting insights from the wealth of information it contains. With a focus on vehicle track data and trajectory information, each CSV file follows a specific format, and its columns are organized to capture various aspects of the vehicles' movements. Let's break down the organization based on the provided information:

### File Structure:

Each CSV file represents the data for multiple vehicles, with each row corresponding to a single vehicle's data.
The first row of each CSV file contains the column names, providing a clear reference for the information stored in each column.
Trajectory Information (First 4 Columns):

The first four columns in each row provide essential information about the trajectory of the vehicle.
Column 1 (trackID): A unique identifier for the vehicle's trajectory.
Column 2 (vehicle type): Specifies the type of vehicle.
Column 3 (distance traveled): Indicates the distance traveled by the vehicle in meters.
Column 4 (average speed): Represents the average speed of the vehicle in km/h.
Temporal Information (Repeating Blocks of 6 Columns):

The remaining columns are organized based on a time frequency, with blocks of six columns repeating.

Columns 5-10: Contain information related to the vehicle's position and speed at a specific time.

Column 5 (latitude at time column_10): Latitude coordinates of the vehicle at a specific time.
Column 6 (longitude at time column_10): Longitude coordinates of the vehicle at the same time.
Column 7 (speed at time column_10): Speed of the vehicle at the same time.
Column 8 (longitudinal acceleration at time column_10): Longitudinal acceleration in m/sec².
Column 9 (lateral acceleration at time column_10): Lateral acceleration in m/sec².
Column 10 (time): Time in seconds.
This pattern repeats for subsequent time intervals, with each block of six columns capturing information about the vehicle's position, speed, and acceleration at different points in time.

### Units of Measurement:

Speed is measured in kilometers per hour (km/h).
Longitudinal and lateral accelerations are measured in meters per second squared (m/sec²).
Time is measured in seconds.

[Alt text](<screenshot/lineage all.png>)

### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices


[def]: image.png