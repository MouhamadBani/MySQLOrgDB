-- Insert data into Departments table
INSERT INTO `BankDDB`.`Departments` (`name`, `description`, `parent_department_id`)
VALUES 
  ('Finance', 'Handles financial operations and budgeting', NULL),
  ('Human Resources', 'Manages employee relations and staffing', NULL),
  ('Healthcare', 'Responsible for healthcare-related projects', NULL),
  ('Infrastructure', 'Oversees infrastructure development', NULL),
  ('Education', 'Focuses on education-related projects', NULL);

-- Insert data into Employees table
INSERT INTO `BankDDB`.`Employees` (`name`, `job_title`, `department_id`, `email`, `phone_number`, `hire_date`, `salary`, `supervisor_id`)
VALUES
  ('Alice Johnson', 'Finance Manager', 1, 'alice.johnson@bankddb.org', '123-456-7890', '2021-03-15', 75000, NULL),
  ('Bob Smith', 'HR Specialist', 2, 'bob.smith@bankddb.org', '123-456-7891', '2020-06-10', 50000, 1),
  ('Charlie Lee', 'Project Manager', 3, 'charlie.lee@bankddb.org', '123-456-7892', '2022-02-01', 80000, 2),
  ('David Brown', 'Infrastructure Analyst', 4, 'david.brown@bankddb.org', '123-456-7893', '2019-11-25', 60000, 3),
  ('Eve Davis', 'Education Coordinator', 5, 'eve.davis@bankddb.org', '123-456-7894', '2020-08-18', 65000, 4);

-- Insert data into Projects table
INSERT INTO `BankDDB`.`Projects` (`name`, `description`, `sector`, `start_date`, `end_date`, `budget`, `status`, `department_id`)
VALUES
  ('Healthcare Expansion', 'Expansion of healthcare facilities across the region', 'Healthcare', '2021-01-01', '2023-12-31', 1000000, 'Ongoing', 3),
  ('Rural Education Initiative', 'Initiative to improve rural education', 'Education', '2020-05-10', '2024-05-10', 500000, 'Planned', 5),
  ('Bridge Construction', 'Construction of a bridge in the north region', 'Infrastructure', '2022-04-01', '2025-04-01', 2500000, 'Ongoing', 4),
  ('Financial Literacy Program', 'Program to enhance financial literacy', 'Finance', '2021-07-15', '2023-07-15', 200000, 'Completed', 1),
  ('Environmental Protection', 'Project focused on environmental sustainability', 'Environment', '2022-03-01', '2024-03-01', 1500000, 'Planned', 4);

-- Insert data into ProjectPhases table
INSERT INTO `BankDDB`.`ProjectPhases` (`project_id`, `phase_name`, `start_date`, `end_date`, `budget`, `status`)
VALUES
  (1, 'Planning', '2021-01-01', '2021-06-30', 200000, 'Completed'),
  (2, 'Implementation', '2020-06-01', '2021-12-31', 300000, 'Ongoing'),
  (3, 'Design', '2022-04-01', '2023-01-01', 500000, 'Not Started'),
  (4, 'Training', '2021-08-01', '2022-07-31', 50000, 'Completed'),
  (5, 'Research', '2022-03-01', '2023-03-01', 700000, 'Ongoing');

-- Insert data into Milestones table
INSERT INTO `BankDDB`.`Milestones` (`phase_id`, `milestone_name`, `description`, `target_date`, `status`)
VALUES
  (1, 'Design Approval', 'Approval for design phase', '2021-03-15', 'Achieved'),
  (2, 'Site Selection', 'Finalize site for project implementation', '2020-07-30', 'Missed'),
  (3, 'Budget Approval', 'Approval of design and budget', '2022-06-01', 'Pending'),
  (4, 'Workshop Completion', 'Completion of financial literacy workshops', '2022-06-01', 'Achieved'),
  (5, 'Initial Survey', 'Completion of environmental impact survey', '2022-05-01', 'Pending');

-- Insert data into Stakeholders table
INSERT INTO `BankDDB`.`Stakeholders` (`name`, `stakeholder_type`, `country`, `contact_info`, `registration_date`)
VALUES
  ('John Enterprises', 'Contractor', 'Nigeria', 'contact@johnent.com', '2021-01-10'),
  ('Green World', 'Donor', 'USA', 'info@greenworld.org', '2020-05-05'),
  ('Local Government', 'Borrower', 'Kenya', 'contact@localgov.kenya', '2022-03-11'),
  ('Beneficiary Org', 'Beneficiary', 'South Africa', 'info@beneficiary.org', '2021-08-14'),
  ('Bright Future', 'Donor', 'Canada', 'contact@brightfuture.org', '2020-12-22');

-- Insert data into Loans table
INSERT INTO `BankDDB`.`Loans` (`project_id`, `stakeholder_id`, `loan_type`, `amount`, `interest_rate`, `duration_months`, `disbursement_date`, `repayment_schedule`)
VALUES
  (1, 1, 'Concessional', 500000, 5.00, 36, '2021-02-01', 'Annual'),
  (2, 2, 'Grant', 200000, NULL, 12, '2020-06-15', 'N/A'),
  (3, 3, 'Non-Concessional', 1000000, 6.50, 48, '2022-05-10', 'Quarterly'),
  (4, 4, 'Concessional', 150000, 4.75, 24, '2021-09-01', 'Monthly'),
  (5, 5, 'Equity', 800000, 8.00, 60, '2022-03-25', 'Annually');

-- Insert data into Transactions table
INSERT INTO `BankDDB`.`Transactions` (`loan_id`, `amount`, `transaction_type`, `transaction_date`, `remarks`)
VALUES
  (1, 200000, 'Disbursement', '2021-02-15', 'Initial disbursement for project'),
  (2, 50000, 'Repayment', '2020-08-10', 'First repayment installment'),
  (3, 300000, 'Disbursement', '2022-06-15', 'Initial disbursement for project'),
  (4, 50000, 'Repayment', '2021-10-01', 'First repayment installment'),
  (5, 200000, 'Adjustment', '2022-04-15', 'Adjusted loan terms');

-- Insert data into FundingSources table
INSERT INTO `BankDDB`.`FundingSources` (`name`, `type`, `amount`, `allocated_to_project_id`)
VALUES
  ('Government Fund', 'Government', 1000000, 1),
  ('Private Investor', 'Private', 500000, 2),
  ('World Bank', 'Donor Agency', 2000000, 3),
  ('Local NGO', 'Private', 500000, 4),
  ('European Union', 'Donor Agency', 1500000, 5);

-- Insert data into Contracts table
INSERT INTO `BankDDB`.`Contracts` (`project_id`, `contractor_id`, `contract_value`, `start_date`, `end_date`, `status`)
VALUES
  (1, 1, 500000, '2021-01-15', '2023-01-15', 'Ongoing'),
  (2, 2, 300000, '2020-06-20', '2021-06-20', 'Completed'),
  (3, 3, 1000000, '2022-05-01', '2023-05-01', 'Ongoing'),
  (4, 4, 150000, '2021-09-05', '2022-09-05', 'Completed'),
  (5, 5, 800000, '2022-03-01', '2023-03-01', 'Signed');

-- Insert data into Locations table
INSERT INTO `BankDDB`.`Locations` (`country`, `region`, `office_name`, `manager_id`)
VALUES
  ('Nigeria', 'West Africa', 'Lagos Office', 1),
  ('Kenya', 'East Africa', 'Nairobi Office', 2),
  ('South Africa', 'Southern Africa', 'Cape Town Office', 3),
  ('Egypt', 'North Africa', 'Cairo Office', 4),
  ('Uganda', 'East Africa', 'Kampala Office', 5);

-- Insert data into Risks table
INSERT INTO `BankDDB`.`Risks` (`project_id`, `description`, `risk_level`, `mitigation_plan`, `status`)
VALUES
  (1, 'Risk of funding delays', 'Medium', 'Engage with stakeholders early', 'Identified'),
  (2, 'Risk of project abandonment', 'High', 'Increase engagement with local communities', 'Active'),
  (3, 'Risk of cost overruns', 'Medium', 'Implement strict budget controls', 'Mitigated'),
  (4, 'Risk of lack of interest', 'Low', 'Increase promotional efforts', 'Identified'),
  (5, 'Risk of environmental damage', 'High', 'Conduct extensive environmental reviews', 'Active');

-- Insert data into Audits table
INSERT INTO `BankDDB`.`Audits` (`project_id`, `audit_date`, `auditor_id`, `findings`, `recommendations`, `status`)
VALUES
  (1, '2021-06-30', 1, 'Audit completed successfully', 'No major issues found', 'Resolved'),
  (2, '2020-12-10', 2, 'Audit found irregularities', 'Conduct further investigation', 'Pending'),
  (3, '2022-08-15', 3, 'Audit completed successfully', 'Ensure more transparency in reporting', 'Resolved'),
  (4, '2021-11-01', 4, 'Audit found minor discrepancies', 'Correct financial reporting', 'Resolved'),
  (5, '2022-07-20', 5, 'Audit pending', 'No findings yet', 'Pending');

-- Insert data into Reports table
INSERT INTO `BankDDB`.`Reports` (`name`, `report_type`, `project_id`, `generated_by`, `generated_date`, `content`)
VALUES
  ('Quarterly Financial Report', 'Financial', 1, 1, '2021-04-01', 'Quarterly financial status of project'),
  ('Annual Progress Report', 'Progress', 2, 2, '2020-12-15', 'Progress update on rural education initiative'),
  ('Final Compliance Report', 'Compliance', 3, 3, '2022-12-01', 'Compliance audit for infrastructure project'),
  ('Monthly Risk Assessment', 'Progress', 4, 4, '2021-09-15', 'Monthly risk report for education program'),
  ('Environmental Impact Report', 'Compliance', 5, 5, '2022-07-01', 'Assessment of environmental impacts of project');

