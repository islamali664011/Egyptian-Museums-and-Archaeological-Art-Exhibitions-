
CREATE DATABASE `EgyptianـMuseumsـandـArchaeological`;
USE `Egyptian Museums and Archaeological`;

-- Tables

-- Museums Table
CREATE TABLE Museums (
  museum_id INT PRIMARY KEY, 
  manager_id INT NULL, 
  name VARCHAR(150),
  type VARCHAR(100),
  city VARCHAR(100),
  address VARCHAR(255),
  established_year INT,
  website VARCHAR(200)
) ENGINE=InnoDB;

-- Staff Table
CREATE TABLE Staff(
  staff_id INT PRIMARY KEY,
  museum_id INT,
  emp_name VARCHAR(150),
  emp_id VARCHAR (50),
  date_of_employment DATE,
  job_level VARCHAR(100),
  health_status VARCHAR(200),
  penalties TEXT,
  age INT,
  academic_degree VARCHAR(150),
  FOREIGN KEY (museum_id) REFERENCES Museums(museum_id)
) ENGINE=InnoDB;

-- Exhibitions Table
CREATE TABLE Exhibitions (
  exhibition_id INT PRIMARY KEY, 
  museum_id INT,
  exhibition_name VARCHAR(200),
  origin VARCHAR(200),
  period VARCHAR(150),
  theme VARCHAR(200),
  start_date DATE, 
  end_date DATE, 
  FOREIGN KEY (museum_id) REFERENCES Museums(museum_id)
) ENGINE=InnoDB;

-- Artifacts Table
CREATE TABLE Artifacts (
  artifact_id INT PRIMARY KEY,
  museum_id INT, 
  name VARCHAR(100),
  type VARCHAR(150),
  material VARCHAR(150),
  status_art VARCHAR(100),
  FOREIGN KEY (museum_id) REFERENCES Museums(museum_id)
) ENGINE=InnoDB;

-- Artifact_Exhibition Table
CREATE TABLE Artifact_Exhibition (
  artifact_id INT, 
  exhibition_id INT,
  displayed_from DATE,
  displayed_to DATE, 
  PRIMARY KEY (artifact_id, exhibition_id),
  FOREIGN KEY (artifact_id) REFERENCES Artifacts(artifact_id),
  FOREIGN KEY (exhibition_id) REFERENCES Exhibitions(exhibition_id)
) ENGINE=InnoDB;

-- Visitors Table
CREATE TABLE Visitors (
  visitor_id INT PRIMARY KEY, 
  museum_id INT, 
  exhibition_id INT, 
  visit_date DATE, 
  visitor_category VARCHAR(100),
  ticket_category VARCHAR(100),
  FOREIGN KEY (museum_id) REFERENCES Museums(museum_id),
  FOREIGN KEY (exhibition_id) REFERENCES Exhibitions(exhibition_id)
) ENGINE=InnoDB;

-- Loans Table
CREATE TABLE Loans (
  loan_id INT PRIMARY KEY,
  artifact_id INT,
  museum_id INT, 
  start_date DATE,
  end_date DATE,
  lender VARCHAR(200),
  FOREIGN KEY (artifact_id) REFERENCES Artifacts(artifact_id),
  FOREIGN KEY (museum_id) REFERENCES Museums(museum_id)
) ENGINE=InnoDB;

-- Maintenance Table
CREATE TABLE Maintenance (
  maintenance_id INT PRIMARY KEY,
  artifact_id INT,
  staff_id INT,
  maintenance_type VARCHAR(150),
  start_date DATE, 
  end_date DATE,
  FOREIGN KEY (artifact_id) REFERENCES Artifacts(artifact_id),
  FOREIGN KEY (staff_id) REFERENCES Staff(staff_id)
) ENGINE=InnoDB;

-- Auction Table
CREATE TABLE Auction (
  auction_id INT PRIMARY KEY,
  artifact_id INT,
  auction_date DATE, 
  starting_price DECIMAL(12,2),
  final_price_buyer DECIMAL(12,2),
  FOREIGN KEY (artifact_id) REFERENCES Artifacts(artifact_id)
) ENGINE=InnoDB;

-- (Rest of user SQL content continues exactly as provided)
