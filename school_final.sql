-- DROP DATABASE sql_school3
DROP DATABASE IF EXISTS school;
-- CREATE DATABASE sql_school3
CREATE DATABASE IF NOT EXISTS school;

-- USE sql_school3
USE school;

-- DROP TABLE stude
DROP TABLE IF EXISTS students;

-- CREATE TABLE students
CREATE TABLE IF NOT EXISTS students
(
	student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    date_registered DATETIME NOT NULL
);

-- DROP TABLE courses;
DROP TABLE IF EXISTS courses;

-- CREATE TABLE courses
CREATE TABLE IF NOT EXISTS courses 
(
	course_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    price DECIMAL(5,2) DEFAULT 0    
);

-- DROP TABLE enrollments
DROP TABLE IF EXISTS enrollments;

-- CREATE TABLE enrollments
CREATE TABLE IF NOT EXISTS enrollments
(
	student_id INT NOT NULL,
    course_id INT NOT NULL,
    price DECIMAL(5,2) DEFAULT 0,
    `date` DATETIME NOT NULL,
    FOREIGN KEY fk_enrollements_students_id (student_id)
		REFERENCES students(student_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
	FOREIGN KEY fk_enrollements_courses_id (course_id)
		REFERENCES courses(course_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

-- DROP TABLE instructors
DROP TABLE IF EXISTS instructors;

-- CREATE TABLE instructors
CREATE TABLE IF NOT EXISTS instructors
(
	instructor_id SMALLINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    salary DECIMAL(10,2) DEFAULT 0
);


-- DROP TABLE tags
DROP TABLE IF EXISTS tags;

-- CREATE TABLE tags
CREATE TABLE IF NOT EXISTS tags
(
	tag_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

-- DROP TABLE course_tags
DROP TABLE IF EXISTS course_tags;

-- CREATE TABLE course_tags
CREATE TABLE IF NOT EXISTS course_tags
(
	course_id INT NOT NULL,
    tag_id TINYINT NOT NULL,
    
    FOREIGN KEY fk_couse_tags_courses_id (course_id)
		REFERENCES courses(course_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
	
    FOREIGN KEY fk_couse_tags_tags_id (tag_id)
		REFERENCES tags(tag_id)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);


-- ADD RELATIONSHIP instructors to courses
ALTER TABLE courses
	ADD instructor_id SMALLINT NOT NULL,
	ADD FOREIGN KEY fk_courses_instructors (instructor_id)
    REFERENCES instructors(instructor_id)
    ON UPDATE CASCADE
    ON DELETE NO ACTION;


-- INSERT VALUES INTO students table
INSERT INTO students
( 
first_name,
last_name,
email,
date_registered
)
VALUES
(
	'Abdallah',
    'Mahmoud',
    'riigsoft@gmail.com',
    '2023-011-12'
);

-- INSERT VALUES INTO instructors
INSERT INTO instructors
(
	name,
    salary
)
VALUES
(
	'Ahmed',
    1500.00
);

-- INSERT VALUES INTO courses
INSERT INTO courses
(
	title,
    price,   
    instructor_id
)
VALUES 
(
	'database',
    12.00,
    1
),(
	'java',
    12.00,
    1
);

-- INSERT VALUES INTO tags
INSERT INTO tags
(
	name
)
VALUES
(
	'programming'
),
(
	'web designing'
)
;

-- INSERT VALUES INTO enrollments
INSERT INTO enrollments
(
	student_id,
    course_id,
    price,
    date
)
VALUES
(
	1,
    1,
    10.00,
    '2023-11-4'
);

-- INSERT VALUES INTO course_tags
INSERT INTO course_tags
(
	course_id,
    tag_id
)
VALUES
(
	2,
    1
),
(
	2,
    2
);


-- CRUD OPERATIONS

SELECT * FROM course_tags;
SELECT * FROM courses;

UPDATE courses 
SET title = 'Spring Boot' 
WHERE course_id = 2;

DELETE FROM course_tags
WHERE tag_id = 2;
