create database library_project_2;

-- Library Management System Project 2

-- Creating Branch Table

Drop table if exists Branch;
CREATE TABLE Branch (
branch_id varchar(10) PRIMARY KEY,
manager_id varchar(10),
branch_address varchar (50),
contact_no varchar (15)
);

-- Creating Employee Table

drop table if exists Employees;
CREATE TABLE Employees (
emp_id varchar(10),
emp_name varchar(255),	
position varchar(255),
salary int,
branch_id varchar(10)
);

ALTER TABLE employees
ADD PRIMARY KEY (emp_id);

-- Creating Books Table

Drop table if exists Books;
CREATE TABLE Books (
isbn varchar(20),
book_title varchar(255),
category varchar(255),
rental_price float,
status varchar(10),
author varchar(255),
publisher varchar(255)
);

ALTER TABLE books
ADD PRIMARY KEY (isbn);

-- Creating Members Table

drop table if exists Members;
CREATE TABLE Members (
member_id varchar(10),
member_name varchar(50),
member_address varchar(75),
reg_date date
);

ALTER TABLE members
ADD PRIMARY KEY (member_id);

-- Creating issued status table

drop table if exists issued_status;
CREATE TABLE issued_status (
issued_id varchar(10),
issued_member_id varchar(10),
issued_book_name varchar(75),
issued_date date,	
issued_book_isbn varchar(20),
issued_emp_id varchar(10)
);

ALTER TABLE issued_status
ADD PRIMARY KEY (issued_id);

-- Creating return status table

drop table if exists return_status;
CREATE TABLE return_status (
return_id varchar(10),
issued_id varchar(10),
return_book_name varchar(75),
return_date date,
return_book_isbn varchar(10)
);

ALTER TABLE return_status
ADD PRIMARY KEY (return_id);

-- Foreign Key
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
foreign key (issued_member_id)
REFERENCES	members (member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
foreign key (issued_book_isbn)
REFERENCES	books (isbn);

ALTER TABLE issued_status
ADD CONSTRAINT fk_employees
foreign key (issued_emp_id)
REFERENCES	employees (emp_id);	

ALTER TABLE employees
ADD CONSTRAINT fk_branch
foreign key (branch_id)
REFERENCES	branch (branch_id);	

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
foreign key (issued_id)
REFERENCES	issued_status(issued_id);

-- Insert data into tables
-- we are using csv to load the data

INSERT INTO issued_status(issued_id, issued_member_id, issued_book_name, issued_date, issued_book_isbn, issued_emp_id) 
VALUES
('IS106', 'C106', 'Animal Farm', '2024-03-10', '978-0-330-25864-8', 'E104'),
('IS107', 'C107', 'One Hundred Years of Solitude', '2024-03-11', '978-0-14-118776-1', 'E104'),
('IS108', 'C108', 'The Great Gatsby', '2024-03-12', '978-0-525-47535-5', 'E104'),
('IS109', 'C109', 'Jane Eyre', '2024-03-13', '978-0-141-44171-6', 'E105'),
('IS110', 'C110', 'The Alchemist', '2024-03-14', '978-0-307-37840-1', 'E105'),
('IS111', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-03-15', '978-0-679-76489-8', 'E105'),
('IS112', 'C109', 'A Game of Thrones', '2024-03-16', '978-0-09-957807-9', 'E106'),
('IS113', 'C109', 'A Peoples History of the United States', '2024-03-17', '978-0-393-05081-8', 'E106'),
('IS114', 'C109', 'The Guns of August', '2024-03-18', '978-0-19-280551-1', 'E106'),
('IS115', 'C109', 'The Histories', '2024-03-19', '978-0-14-044930-3', 'E107'),
('IS116', 'C110', 'Guns, Germs, and Steel: The Fates of Human Societies', '2024-03-20', '978-0-393-91257-8', 'E107'),
('IS117', 'C110', '1984', '2024-03-21', '978-0-679-64115-3', 'E107'),
('IS118', 'C101', 'Pride and Prejudice', '2024-03-22', '978-0-14-143951-8', 'E108'),
('IS119', 'C110', 'Brave New World', '2024-03-23', '978-0-452-28240-7', 'E108'),
('IS120', 'C110', 'The Road', '2024-03-24', '978-0-670-81302-4', 'E108'),
('IS121', 'C102', 'The Shining', '2024-03-25', '978-0-385-33312-0', 'E109'),
('IS122', 'C102', 'Fahrenheit 451', '2024-03-26', '978-0-451-52993-5', 'E109'),
('IS123', 'C103', 'Dune', '2024-03-27', '978-0-345-39180-3', 'E109'),
('IS124', 'C104', 'Where the Wild Things Are', '2024-03-28', '978-0-06-025492-6', 'E110'),
('IS125', 'C105', 'The Kite Runner', '2024-03-29', '978-0-06-112241-5', 'E110'),
('IS126', 'C105', 'Charlotte''s Web', '2024-03-30', '978-0-06-440055-8', 'E110'),
('IS127', 'C105', 'Beloved', '2024-03-31', '978-0-679-77644-3', 'E110'),
('IS128', 'C105', 'A Tale of Two Cities', '2024-04-01', '978-0-14-027526-3', 'E110'),
('IS129', 'C105', 'The Stand', '2024-04-02', '978-0-7434-7679-3', 'E110'),
('IS130', 'C106', 'Moby Dick', '2024-04-03', '978-0-451-52994-2', 'E101'),
('IS131', 'C106', 'To Kill a Mockingbird', '2024-04-04', '978-0-06-112008-4', 'E101'),
('IS132', 'C106', 'The Hobbit', '2024-04-05', '978-0-7432-7356-4', 'E106'),
('IS133', 'C107', 'Angels & Demons', '2024-04-06', '978-0-7432-4722-5', 'E106'),
('IS134', 'C107', 'The Diary of a Young Girl', '2024-04-07', '978-0-375-41398-8', 'E106'),
('IS135', 'C107', 'Sapiens: A Brief History of Humankind', '2024-04-08', '978-0-307-58837-1', 'E108'),
('IS136', 'C107', '1491: New Revelations of the Americas Before Columbus', '2024-04-09', '978-0-7432-7357-1', 'E102'),
('IS137', 'C107', 'The Catcher in the Rye', '2024-04-10', '978-0-553-29698-2', 'E103'),
('IS138', 'C108', 'The Great Gatsby', '2024-04-11', '978-0-525-47535-5', 'E104'),
('IS139', 'C109', 'Harry Potter and the Sorcerers Stone', '2024-04-12', '978-0-679-76489-8', 'E105'),
('IS140', 'C110', 'Animal Farm', '2024-04-13', '978-0-330-25864-8', 'E102');

select * from return_status;

-- Project Task
-- Task 1 - Create a new book record "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')"

INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher)
VALUES
('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

SELECT * FROM books;

-- Task 2 - Update an existing member's address

UPDATE members
SET member_address = '125 Main St'
WHERE member_id = 'C101';

SELECT * FROM members;

-- Task 3 - Delete a record from the Issued Status table. Objective - Delete the record with issued_id = 'IS121' from issued status table

DELETE FROM issued_status
WHERE issued_id = 'IS121';

select * from issued_status;

-- Task 4 - Retrieve all Books Issued by a specific employee. Objective - Select all books issued by employee with emp_id ='E101'

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';

-- Task 5 - List members who have issued more than one book. Obejctive - Use Group By to find members who have issued more than one book

SELECT issued_emp_id,
COUNT(issued_id) AS total_book_issued 
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(issued_id) > 1;

-- CTAS
-- Task 6 - Create a Summary Tables: Used CTAS to generate new tables based on query results - each book and total book_issued_count

CREATE TABLE book_counts 
AS
SELECT b.isbn, b.book_title,
COUNT(ist.issued_id) AS books_issued
FROM books b 
JOIN issued_status ist on ist.issued_book_isbn = b.isbn
GROUP BY b.isbn, b.book_title;

select * from book_counts;

-- Task 7 - Retrieve all books in specific category

SELECT * FROM books
WHERE category = 'Children';

-- Task 8 - Find the total rental income by category

SELECT b.category,
SUM(b.rental_price) AS Total_rental_income 
FROM books b
JOIN issued_status ist ON ist.issued_book_isbn = b.isbn
GROUP BY b.category
ORDER BY Total_rental_income desc;

-- Task 9 - List the members who registered in last 180 days

INSERT INTO members (member_id, member_name, member_address, reg_date)
values
('C111', 'Sam Tyrell', '145 Main St', '2025-02-01'),
('C112', 'John Snow', '133 Main St', '2025-03-01');

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL 180 Day;

-- Task 10 - List Employees with their Branch Manager names and Branch details

SELECT e1.*, e2.emp_name AS Manager_name
FROM employees e1 
JOIN branch b ON b.branch_id = e1.branch_id
JOIN employees e2 ON b.manager_id = e2.emp_id;

-- Task 11 - Create a table of books with Renal Price above a Certain threshold 7USD

CREATE TABLE books_priced_over_7
AS
SELECT * FROM books
WHERE rental_price > 7;

Select * from books_priced_over_7;

-- Task 12 - Retrieve the list of books not yet returned

SELECT DISTINCT ist.issued_book_name
FROM issued_status ist
LEFT JOIN return_status rs ON ist.issued_id = rs.issued_id
WHERE rs.return_id is NULL;






		





