# MySQLOrgDB
This is a database schema for a large organization operation

Database Schema Documentation: BankDDB 

Introduction 

The BankDDB database is structured to support the tracking of development projects and their associated financial data. It provides a centralized repository for information related to various organizational departments, employees, projects, loans, stakeholders, transactions, and funding sources. The design prioritizes data integrity, efficient querying, and scalability, ensuring it can accommodate a broad range of project types, financial scenarios, and reporting needs. 

This document details the structure and relationships within the BankDDB schema, highlighting the purpose of each table and its role within the system. 

 

Schema Overview 

The BankDDB schema consists of several interconnected tables. These tables store information regarding departments, employees, projects, project phases, milestones, stakeholders, loans, transactions, and funding sources. The relationships between the tables are designed to maintain data consistency and integrity, making it easy to generate reports, track financial flows, and manage project details. 

The main entities in the schema are as follows: 

Departments 

Employees 

Projects 

Project Phases 

Milestones 

Stakeholders 

Loans 

Transactions 

Funding Sources 

 

Table Descriptions 

Departments 

The Departments table stores information about the different departments within the organization. Each department is identified by a unique department_id. The table also includes fields such as name (the department's name), description (a detailed explanation of the department's role), and a self-referencing parent_department_id that allows for hierarchical organization, indicating if a department is a sub-department of another. 

Employees 

The Employees table tracks all individuals working within the organization. Key information includes employee_id, name, job_title, and salary. The department_id field links each employee to a specific department, while the supervisor_id field establishes a reporting hierarchy by referencing another employee. This allows the system to model organizational structure effectively. 

Projects 

The Projects table is central to the schema, as it holds details about the various development projects being undertaken. Each project has a unique project_id and contains information such as name, description, sector (e.g., Infrastructure or Healthcare), start_date, end_date, budget, and status. The department_id field links projects to specific departments, helping to manage departmental workloads and responsibilities. 

Project Phases 

Development projects are often structured in multiple phases. The ProjectPhases table stores information about these phases, including phase_name, start_date, end_date, budget, and status. The project_id field links each phase to its respective project, allowing for detailed tracking of progress within each project. 

Milestones 

Milestones are critical markers in the lifecycle of a project phase. The Milestones table tracks these important milestones, such as completion goals or checkpoints. Fields include milestone_name, description, target_date, and status. The phase_id field connects each milestone to the relevant phase in the project, allowing project managers to monitor the progress of specific tasks. 

Stakeholders 

The Stakeholders table holds information about individuals or entities involved in the project. This includes both internal and external stakeholders, such as funders, donors, or beneficiaries. Each stakeholder is uniquely identified by stakeholder_id, and their details, including name, stakeholder_type (e.g., Borrower or Donor), and contact_info, are stored in this table. The country field represents the geographical location of the stakeholder. 

Loans 

The Loans table tracks loans provided to stakeholders for the purpose of funding project implementation. This table includes fields such as loan_id, loan_type (e.g., concessional or non-concessional), amount, interest_rate, duration_months, and disbursement_date. The table is linked to both the Projects and Stakeholders tables via project_id and stakeholder_id, respectively. This enables a comprehensive view of the financial resources allocated to each project and stakeholder. 

Transactions 

The Transactions table records all financial transactions related to loans, including disbursements, repayments, and adjustments. Each transaction is identified by a unique transaction_id and linked to a specific loan through the loan_id field. The table tracks the transaction amount, transaction_type (e.g., Disbursement, Repayment), transaction_date, and remarks (additional notes about the transaction). This table ensures accurate tracking of loan movements and provides the necessary details for financial reporting. 

Funding Sources 

The FundingSources table stores information about the different sources of funding for the projects. These sources could be governmental, private donors, or other organizations that provide financial support. Key fields in this table include source_id, name, type (such as Government or Private), and the amount contributed. The allocated_to_project_id field links funding sources to specific projects, ensuring transparency in financial reporting. 

 

Relationships Between Tables 

The tables in the BankDDB schema are interconnected through foreign key relationships, which help maintain data consistency and enable efficient querying. 

The Departments table is related to the Employees and Projects tables through the department_id field. This relationship allows for reporting on employees by department and managing projects within specific departments. 

The Employees table also establishes a hierarchical relationship with itself through the supervisor_id field, enabling reporting on organizational structures. 

The Projects table is connected to ProjectPhases through the project_id field, allowing for phase-level tracking of projects. 

The ProjectPhases table is related to the Milestones table via the phase_id field, ensuring milestones are tied to the correct phase. 

The Loans table links to the Projects and Stakeholders tables, allowing for the tracking of loans provided to specific stakeholders for individual projects. 

The Transactions table references the Loans table to record the financial movements associated with each loan. 

The FundingSources table connects to the Projects table, allowing for the tracking of financial contributions from different sources. 

These relationships ensure that the database structure is well-normalized, minimizing redundancy and ensuring the integrity of the data. 

 



The BankDDB database schema is designed to provide a comprehensive and organized structure for managing development project data, financial transactions, and stakeholder information. It supports efficient querying, reporting, and analysis by maintaining clear relationships between various entities in the system. With a focus on data integrity and ease of use, this schema is suitable for managing large volumes of data related to complex development projects, providing valuable insights for decision-making and project management. 

 
