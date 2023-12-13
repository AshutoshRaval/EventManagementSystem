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

   



