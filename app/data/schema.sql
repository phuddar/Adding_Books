CREATE DATABASE IF NOT EXISTS phdatabase;
USE phdatabase;

DROP TABLE IF EXISTS student;
CREATE TABLE student (
	id int PRIMARY KEY AUTO_INCREMENT ,
    username varchar(24) UNIQUE NOT NULL,
    name varchar(48)
);

INSERT INTO student (id, username, name) VALUES
(1, 'fant', 'Fantasy'),
(2, 'bio', 'Biography'),
(3, 'sci', 'Science');

-- SELECT * FROM students;

DROP TABLE IF EXISTS offer;
CREATE TABLE offer (
	id int PRIMARY KEY AUTO_INCREMENT,
    studentId int NOT NULL REFERENCES student(id)
        ON DELETE CASCADE ON UPDATE CASCADE,
				title varchar(24) NOT NULL,
			  author varchar(24) NOT NULL,
				publish_year varchar(4) NOT NULL,
				publisher varchar(24) NOT NULL,
				page_count int (4) NOT NULL,
				msrp int (4) NOT NULL
);

-- Student 1 has no offers, Student 2 has 3 offers, Student 3 has one offer
INSERT INTO offer(id, studentId, title, author, publish_year, publisher, page_count, msrp) VALUES
  (1, 2, 'The Blue Moon', 'Mehsana Jidd', 2018, 'Penguiin', 363, 40),
  (2, 2, 'The Yellow Moon', 'Hunik Jidd', 2019, 'Omxford', 263, 30)
;

-- COMMIT;

-- CREATE USER 'msisreader'@'%' IDENTIFIED BY 'msisreadonly';
-- GRANT SELECT ON * . * TO 'msisreader'@'%';
