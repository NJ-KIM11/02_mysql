use studentgradedb;

DROP TABLE IF EXISTS student_info;
CREATE TABLE IF NOT EXISTS student_info(

	name VARCHAR(200) NOT NULL,
    student_id int,
    student_grade int,
    score int,
    PRIMARY KEY(student_id)
    
) ENGINE= InnoDB;

SELECT * from student_info;

    