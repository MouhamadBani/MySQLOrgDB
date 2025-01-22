-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BankDDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BankDDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BankDDB` DEFAULT CHARACTER SET utf8 ;
USE `BankDDB` ;

-- -----------------------------------------------------
-- Table `BankDDB`.`Departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Departments` (
  `department_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `parent_department_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`),
  INDEX (`parent_department_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`parent_department_id`)
    REFERENCES `BankDDB`.`Departments` (`department_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Employees` (
  `employee_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `job_title` VARCHAR(100) NULL DEFAULT NULL,
  `department_id` INT NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `phone_number` VARCHAR(15) NULL DEFAULT NULL,
  `hire_date` DATE NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `supervisor_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX (`department_id` ASC) VISIBLE,
  INDEX (`supervisor_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`department_id`)
    REFERENCES `BankDDB`.`Departments` (`department_id`),
  CONSTRAINT ``
    FOREIGN KEY (`supervisor_id`)
    REFERENCES `BankDDB`.`Employees` (`employee_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Projects`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Projects` (
  `project_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `sector` ENUM('Infrastructure', 'Education', 'Healthcare', 'Finance', 'Environment') NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `budget` DECIMAL(15,2) NULL DEFAULT NULL,
  `status` ENUM('Planned', 'Ongoing', 'Completed', 'Suspended') NULL DEFAULT NULL,
  `department_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  INDEX (`department_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`department_id`)
    REFERENCES `BankDDB`.`Departments` (`department_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`ProjectPhases`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`ProjectPhases` (
  `phase_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `phase_name` VARCHAR(100) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `budget` DECIMAL(15,2) NULL DEFAULT NULL,
  `status` ENUM('Not Started', 'In Progress', 'Completed') NULL DEFAULT NULL,
  PRIMARY KEY (`phase_id`),
  INDEX (`project_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Milestones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Milestones` (
  `milestone_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `phase_id` INT NULL DEFAULT NULL,
  `milestone_name` VARCHAR(255) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `target_date` DATE NULL DEFAULT NULL,
  `status` ENUM('Pending', 'Achieved', 'Missed') NULL DEFAULT NULL,
  PRIMARY KEY (`milestone_id`),
  INDEX (`phase_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`phase_id`)
    REFERENCES `BankDDB`.`ProjectPhases` (`phase_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Stakeholders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Stakeholders` (
  `stakeholder_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `stakeholder_type` ENUM('Borrower', 'Donor', 'Contractor', 'Beneficiary') NULL DEFAULT NULL,
  `country` VARCHAR(100) NULL DEFAULT NULL,
  `contact_info` TEXT NULL DEFAULT NULL,
  `registration_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`stakeholder_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Loans`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Loans` (
  `loan_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `stakeholder_id` INT NULL DEFAULT NULL,
  `loan_type` ENUM('Concessional', 'Non-Concessional', 'Grant', 'Equity') NULL DEFAULT NULL,
  `amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `interest_rate` DECIMAL(5,2) NULL DEFAULT NULL,
  `duration_months` INT NULL DEFAULT NULL,
  `disbursement_date` DATE NULL DEFAULT NULL,
  `repayment_schedule` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  INDEX (`project_id` ASC) VISIBLE,
  INDEX (`stakeholder_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`),
  CONSTRAINT ``
    FOREIGN KEY (`stakeholder_id`)
    REFERENCES `BankDDB`.`Stakeholders` (`stakeholder_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Transactions` (
  `transaction_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `loan_id` INT NULL DEFAULT NULL,
  `amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `transaction_type` ENUM('Disbursement', 'Repayment', 'Adjustment') NULL DEFAULT NULL,
  `transaction_date` DATE NULL DEFAULT NULL,
  `remarks` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX (`loan_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`loan_id`)
    REFERENCES `BankDDB`.`Loans` (`loan_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`FundingSources`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`FundingSources` (
  `source_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `type` ENUM('Government', 'Private', 'Donor Agency') NULL DEFAULT NULL,
  `amount` DECIMAL(15,2) NULL DEFAULT NULL,
  `allocated_to_project_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`source_id`),
  INDEX (`allocated_to_project_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`allocated_to_project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Contracts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Contracts` (
  `contract_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `contractor_id` INT NULL DEFAULT NULL,
  `contract_value` DECIMAL(15,2) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `status` ENUM('Signed', 'Ongoing', 'Completed', 'Terminated') NULL DEFAULT NULL,
  PRIMARY KEY (`contract_id`),
  INDEX (`project_id` ASC) VISIBLE,
  INDEX (`contractor_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`),
  CONSTRAINT ``
    FOREIGN KEY (`contractor_id`)
    REFERENCES `BankDDB`.`Stakeholders` (`stakeholder_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Locations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Locations` (
  `location_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `country` VARCHAR(100) NULL DEFAULT NULL,
  `region` VARCHAR(100) NULL DEFAULT NULL,
  `office_name` VARCHAR(255) NULL DEFAULT NULL,
  `manager_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  INDEX (`manager_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`manager_id`)
    REFERENCES `BankDDB`.`Employees` (`employee_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Risks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Risks` (
  `risk_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `risk_level` ENUM('Low', 'Medium', 'High') NULL DEFAULT NULL,
  `mitigation_plan` TEXT NULL DEFAULT NULL,
  `status` ENUM('Identified', 'Mitigated', 'Active') NULL DEFAULT NULL,
  PRIMARY KEY (`risk_id`),
  INDEX (`project_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Audits`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Audits` (
  `audit_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `project_id` INT NULL DEFAULT NULL,
  `audit_date` DATE NULL DEFAULT NULL,
  `auditor_id` INT NULL DEFAULT NULL,
  `findings` TEXT NULL DEFAULT NULL,
  `recommendations` TEXT NULL DEFAULT NULL,
  `status` ENUM('Pending', 'Resolved') NULL DEFAULT NULL,
  PRIMARY KEY (`audit_id`),
  INDEX (`project_id` ASC) VISIBLE,
  INDEX (`auditor_id` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`),
  CONSTRAINT ``
    FOREIGN KEY (`auditor_id`)
    REFERENCES `BankDDB`.`Employees` (`employee_id`));


-- -----------------------------------------------------
-- Table `BankDDB`.`Reports`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BankDDB`.`Reports` (
  `report_id` INT NULL DEFAULT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `report_type` ENUM('Financial', 'Progress', 'Compliance') NULL DEFAULT NULL,
  `project_id` INT NULL DEFAULT NULL,
  `generated_by` INT NULL DEFAULT NULL,
  `generated_date` DATE NULL DEFAULT NULL,
  `content` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`),
  INDEX (`project_id` ASC) VISIBLE,
  INDEX (`generated_by` ASC) VISIBLE,
  CONSTRAINT ``
    FOREIGN KEY (`project_id`)
    REFERENCES `BankDDB`.`Projects` (`project_id`),
  CONSTRAINT ``
    FOREIGN KEY (`generated_by`)
    REFERENCES `BankDDB`.`Employees` (`employee_id`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
