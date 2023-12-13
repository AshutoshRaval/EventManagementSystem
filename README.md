# Event Management System
Designed and Implemented the Event Management system Database project using MS SQL server Management Studio in my course Database Management and Database Design Coursework at Northeastern University.

**Scope**
The purpose of this database is to centralize data systems for efficient event management, particularly tailored to handle gatherings with a large number of participants. It aims to minimize oversight risks by integrating and managing data in real time. The system ensures seamless event planning and execution by consolidating crucial information into a robust, user-friendly platform. Ultimately, the goal is to empower organizers with a technologically advanced data management solution, optimizing operational convenience, and ensuring meticulous event orchestration.

**Features**
1) Centralization: It centralizes crucial event-related information.
2) User-Friendly Interface: The system provides a user-friendly platform for managing events.
30 Empowerment: The goal is to empower event organizers with a technologically advanced solution.

**Benefits**
1) Operational Efficiency: Aims to optimize operational convenience for event orchestration.
2) Meticulous Planning: Aims to ensure meticulous planning and execution of events.

**Tools Used**
1) MS SQL Server Management Studio
2) PowerBI
3) Lucid Chart

**Highlights**
1) Customized Views
2) Table Level level check Function
3) Columns level check
4) stored procedures
5) Cursors
6) Column encryption
7) 3rd Normalized Database
8) Tables Joins
9) PowerBI Report
10) DAX, Calculated Coloum and dynamic Filtering using multiple columns 

**File attached in the Repository**
1) SQL file for database implementation
2) ERD of the Database
3) PowerBI report file (.pbix)
4) Business Logic

**Flow of the project**
1) There are 3 Main section of the project 1st is the Events section, 2nd is the Shows section and 3rd is the employee section
2) For the Events section
   - Each organizer has its name, details and role which is then associate to an event using and bridge table is_organzier as there can be many to many relation between 
     organisers and events
   - Each event has event type and each event can be associated with multiple shows
3) For the Shows Section
   - The Shows section is further divided into two parts 1st is the participants in the show and the 2nd is the equipment required in the show.
   - Each show has multiple particapants
   - Each show requires multiple equipments also each equipment has a its type and cost associated with it.
   - Each Show can have multiple employee to handle different tasks and each employee has a cost associated with it
4) For the Employee section
   - Each employee has its role and each employee has as cost associated with it and its start and end time.
   - Each employee can be engaged in multiple shows.

**PowerBI Report Implemtation**

1) The Table visual spans accors the entire dataset and comprises the essestial columns to get he quick status of any show.
2) The Piechart visual reperesnts the number and type of equipment required in the show.
3) The Cluster bar chart signifies the event type and number of shows organized by an organizer.
4) Line Chart implies the Particapants for a show in an specific year.
5) Dynamic filtering using the silcers which as associated with multiple columns in the various section of database
6) The Card visual give you and idea about the shows and Total and estimated cost associated with it.

**Below are the snapshots of the powerBI report**

**Dashboard**
<img width="644" alt="PowerBI_EventManagement" src="https://github.com/AshutoshRaval/EventManagementSystem/assets/122703876/278fad12-7579-42a5-845c-f57172deeeaa">

**Dynamic Filtering using slicers**
<img width="647" alt="PowerBI_EventManagement_DF png " src="https://github.com/AshutoshRaval/EventManagementSystem/assets/122703876/e83b1218-1e3d-4b7d-9738-ac7fa31a32bf">

**DAX Formula**
- The formula gets the type of employee associated with the show
<img width="851" alt="PowerBI_EventManagement_DAX" src="https://github.com/AshutoshRaval/EventManagementSystem/assets/122703876/2190f8b8-2db4-4ef9-a277-c8c8090a5e95">

**Calculated Column**
- The Columnn sets the status according the actual cost and planned cost of an equipment
<img width="943" alt="PowerBI_EventManagement_CalcColumn" src="https://github.com/AshutoshRaval/EventManagementSystem/assets/122703876/1dccce4a-a98a-4d5d-ad64-85a48cd19c70">

**Conditonal formating **
- It changes the background color of cell according to the cost.
<img width="772" alt="PowerBI_EventManagement_CF" src="https://github.com/AshutoshRaval/EventManagementSystem/assets/122703876/3c749bef-b12d-4cda-b9cd-dcc3bd4bd47a">



