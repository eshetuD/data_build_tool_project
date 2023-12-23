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
trackID: A unique identifier for the vehicle's trajectory.
vehicle type: Specifies the type of vehicle.
distance traveled: Indicates the distance traveled by the vehicle in meters.
average speed: Represents the average speed of the vehicle in km/h.

### Temporal Information (Repeating Blocks of 6 Columns):

The remaining columns are organized based on a time frequency, with blocks of six columns repeating.

Columns 5-10: Contain information related to the vehicle's position and speed at a specific time.

latitude at time column_10: Latitude coordinates of the vehicle at a specific time.
longitude at time column_10: Longitude coordinates of the vehicle at the same time.
speed at time column_10: Speed of the vehicle at the same time.
longitudinal acceleration at time column_10: Longitudinal acceleration in m/sec².
lateral acceleration at time column_10: Lateral acceleration in m/sec².
time: Time in seconds.
This pattern repeats for subsequent time intervals, with each block of six columns capturing information about the vehicle's position, speed, and acceleration at different points in time.

### Units of Measurement:

Speed is measured in kilometers per hour (km/h).
Longitudinal and lateral accelerations are measured in meters per second squared (m/sec²).
Time is measured in seconds.

[Alt text](<screenshot/lineage all.png>)

So as you can see from the above data lineage first we got data which imported to data warehouse by airflow python operator by other project we did in the interim report.

Initially, this data is sourced and imported into the data warehouse leveraging the Airflow Python operator. This operator, a key component established in a preceding project detailed in our interim report, plays a pivotal role in orchestrating the ingestion process.

Once the raw data resides within the data warehouse, the subsequent phase involves a series of transformative steps. These transformations are meticulously designed to render the dataset more conducive to the distinct needs of various teams within the organization, including the Machine Learning Team, Analysis Team, and Business Intelligence Team.

The transformations applied during this phase are tailored to enhance the dataset's usability and relevance for each team's specific objectives. For the Machine Learning Team, this may involve feature engineering or preprocessing steps that optimize the data for machine learning models. The Analysis Team might benefit from transformations that facilitate exploratory data analysis and pattern recognition. Simultaneously, the Business Intelligence Team could find value in transformations that structure the data for insightful reporting and visualization.

In essence, this data lineage underscores a comprehensive and strategic approach to handling the pNEUMA dataset. It ensures that the data, from its initial import to the data warehouse through the Airflow Python operator, undergoes tailored transformations that empower diverse teams within the organization to derive meaningful insights and make informed decisions based on the specific requirements of their respective domains.

# Model Creation
I have created seven models for various purposes within the Traffic Department. The first model serves as an anomaly detection model, designed to identify any irregularities on the road. This model is developed by merging data from the "vehicle_track" and "trajectory_info" tables based on the "track_id" column. Utilizing information such as vehicle type, latitude (lat), and longitude (lon), the model identifies anomalies at specific coordinates and prompts immediate action.
The second model focuses on converting and casting column names to their appropriate data types. The data loaded into the data warehouse may have inaccuracies in data types; for instance, the time column might be improperly labeled as float, rendering it ineffective in the given structure. This model scans each column in the data table and ensures they are casted to their correct and intended data types.
The third model is designed to identify road violations by leveraging information from the "car_type," "speed," and "track_id" columns. By analyzing the speed of each vehicle, the model determines whether a car is exceeding the speed limit or adhering to it. This model proves valuable for post-accident assessments, enabling investigators to understand the conditions under which the vehicle was operating.
The route optimization model provides recommendations based on the number of vehicles and their speeds on specific roads. This enables the Traffic Department to identify congested routes and optimize accordingly. The model utilizes information from the "lat," "lon," "traveled_d," and "timestamp" columns to generate an optimized route, aiding the department in making informed decisions about traffic management.
The traffic congestion model is employed to identify congestion on specific routes at a given timestamp. Utilizing data from the "vehicle_type," "lat," "lon," and "speed" columns, the model determines congestion by assessing whether vehicles are moving below the speed limit. In the event of congestion, the model alerts the traffic department, prompting the use of the optimization model for better traffic management.

# Model Testing
For each model created in the data build tool, a corresponding testing kit has been developed as part of a unit testing procedure. This ensures that thorough testing is conducted for every individual model, aligning with their specific functionalities and requirements.
The anomaly detection testing is designed to assess the presence of anomalies at specific latitude and longitude coordinates. To confirm the existence of an anomaly, the model must encounter data instances where the count of anomalies is greater than zero. In practical terms, this means that there should be at least one instance where a vehicle has a speed of zero on a given road. Failure to meet this criterion indicates a test failure for the anomaly detection model.
The car type test within the testing kit categorizes vehicles on the road into six distinct types: Car, Taxi, Medium Vehicle, Heavy Vehicle, Motorcycle, and Bus. The model is expected to classify any moving object into one of these predefined categories. If the model identifies an object on the road as a vehicle that does not fall into these specified categories, it is considered a test failure.
The route optimization test within the test kit evaluates the performance of the optimization model by assessing the accuracy of its recommendations. The test checks for vehicle speeds on specific roads at a given time. If the model suggests a route with a vehicle moving at a low speed or below the speed limit, it indicates potential congestion on that road. In such cases, the test considers the model as failing, as it should not recommend routes that are likely to be congested or slow-moving.
 

# Macro Creation
In dbt (data build tool), a macro is a reusable and parameterized SQL code snippet or block that you can define and then call from multiple places in your dbt project. Macros provide a way to modularize and share SQL logic across different models, making it easier to maintain and update your data transformations.
I have created one macro for this project which override the default schema which is configured in schema.yml file of the source document. This approach can be useful when you need to dynamically set the schema for specific models or scenarios within your dbt project.
 


