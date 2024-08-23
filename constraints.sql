-- CONSTRAINTS
-- 제약조건. 테이블에 데이터가 입력되거나 수정될 떄의 규칙을 정의한다.
-- 테이블 작성 시 각 컬럼의 값에 대한 제약조건을 설정할 수 있다.
-- 입력/ 수정하는 데이터에 문제가 없는지 자동으로 검사해 준다..
-- 종류 = PRIMARY KEY, NOT NULL, UNIQUE, CHECK, FOREIGN KEY

-- NOT NULL
-- NULL 값을 허용하지 않는 제약조건
-- 데이터를 입력 받을 때 꼭 들어가야 하는 내용.
DROP TABLE IF EXISTS user_notnull;
CREATE TABLE IF NOT EXISTS user_notnull(
	user_no INT NOT NULL,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
    user_name VARCHAR(255) NOT NULL,
	gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255)
) ENGINE = InnoDB;

DESCRIBE user_notnull;

INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1,"user01","pass01", "홍길동", '남', "010-1234-5678", null),
	(2,"user02","pass02", "유관순", '여', "010-1111-1111", "yu@gmial.com");
    
SELECT * FROM user_notnull;

INSERT INTO user_notnull
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1,"user01",null, "홍길동", '남', "010-1234-5678", null);
	
    
-- UNIQUE 
-- 중복값을 허용하지 않는 제약조건
DROP TABLE IF EXISTS user_unique;
CREATE TABLE IF NOT EXISTS user_unique(
	user_no INT NOT NULL UNIQUE,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    UNIQUE(phone)
) ENGINE = INNODB;

INSERT INTO user_unique
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
(1,"user01","pass01", "홍길동", '남', "010-1234-5678", null),
(2,"user02","pass02", "유관순", '여', "010-1111-1111", "yu@gmial.com"),
(3,"user01","pass01", "홍길동", '남', "010-1234-5678", null);


SELECT * FROM user_unique;


-- PRIMARY KEY
-- 테이블에서 한 행의 정보를 찾기 위해 사용할 컬럼을 의미한다.
-- 테이블에 대한 식별자 역할을 한다. (한 행씩 구분하는 역할)
-- NOT NULL + UNIQUE 제약조건을 가진다.
-- 한 테이블당 한개만 설정할 수 있다.
-- 한개의 칼럼에 설정할 수도 있고, 여러 개의 컬럼을 묶어서 설정할 수도 있다.(복합키)

DROP TABLE IF EXISTS user_primarykey;
CREATE TABLE IF NOT EXISTS user_primarykey(
	user_no INT,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    PRIMARY KEY (user_no)
)ENGINE = InnoDB;

DESCRIBE user_primarykey;

INSERT INTO user_primarykey
(user_no, user_id, user_pwd, user_name, gender, phone, email)
VALUES
	(1,"user01","pass01", "홍길동", '남', "010-1234-5678", null),
	(2,"user02","pass02", "유관순", '여', "010-1111-1111", "yu@gmial.com");
    
SELECT * FROM user_primarykey;
    
    
-- FOREIGN KEY
-- 참조된 다른 테이블에서 제공하는 값만 사용할 수 있음.
-- FOREIGN KEY 제약조건에 의해 테이블 간의 관계가 형성됨.
-- 제공되는 값 외에는 NULL 을 사용할 수 있음.
-- 설정되어 있는 경우에는 컬럼을 변경하지 못함.

DROP TABLE IF EXISTS user_grade;
CREATE TABLE IF NOT EXISTS user_grade(
	grade_code INT NOT NULL UNIQUE,
    grade_name VARCHAR(255) NOT NULL 
) ENGINE = InnoDB;

INSERT INTO user_grade
VALUES
	(10,"일반회원"),
    (20,"우수회원"),
    (30,"특별회원");

DESCRIBE user_grade;
SELECT * from user_grade;

DROP TABLE IF EXISTS user_foreignkey1;
CREATE TABLE IF NOT EXISTS user_foreignkey1(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT NOT NULL,
    FOREIGN KEY(grade_code)
    REFERENCES user_grade(grade_code)

)ENGINE = InnoDB;

DESCRIBE user_foreignkey1;

INSERT INTO user_foreignkey1
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
(3,"user01","pass01", "홍길동", '남', "010-1234-5678", null,20),
(4,"user02","pass02", "유관순", '여', "010-1111-1111", "yu@gmial.com",30);

SELECT *FROM user_foreignkey1;


-- DELETE, UPDATE 룰 
DROP TABLE IF EXISTS user_foreignkey2;
CREATE TABLE IF NOT EXISTS user_foreignkey2(
	user_no INT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    user_pwd VARCHAR(255) NOT NULL,
	user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3),
    phone VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    grade_code INT,
    FOREIGN KEY(grade_code)
    REFERENCES user_grade (grade_code)
		ON UPDATE SET NULL
        ON DELETE SET NULL		-- 부모가 바뀌거나 삭제되면 자식은 null 값으로
		-- 위 설정이 없으면 부모의 grade_code 는 update, delete 불가
	) ENGINE = INNODB;
    
INSERT INTO user_foreignkey2
(user_no, user_id, user_pwd, user_name, gender, phone, email, grade_code)
VALUES
	(1,"user01","pass01", "홍길동", '남', "010-1234-5678", null,10),
    (2,"user02","pass02", "유관순", '여', "010-1111-1111", "yu@gmial.com",20);
SELECT * FROM user_foreignkey2;

UPDATE user_grade
SET grade_code = 1
WHERE grade_code = 10;

DELETE FROM user_grade
WHERE grade_code = 20;

-- CHECK 
-- check 제약 조건 위반시 허용하지 않는 제약조건
DROP TABLE IF EXISTS user_check;
CREATE TABLE IF NOT EXISTS user_check(
	user_no INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    gender VARCHAR(3) CHECK (gender IN ('남','여')),
    age INT CHECK (age >= 19)
)ENGINE= INNODB;

INSERT INTO user_check
VALUES
	(NULL, "홍길동","남",25),
    (NULL, "이순신","남",25);
SELECT * FROM user_check;

INSERT INTO user_check
VALUES
	(NULL, "홍길동","dsvd",17);
    
    
-- DEFAULT
-- 칼럼에 NULL 대신에 기본 값 적용
-- 컬럼 타입이 DATE 일 경우 - CURRENT_DATE 만 사용 가능
-- DATETIME 일 경우 - CURRENT_TIME, CURRENT_TIMESTAMP, NOW() 모두 가능

DROP TABLE IF EXISTS tbl_country;
CREATE TABLE IF NOT EXISTS tbl_country(
	country_code INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(255) DEFAULT "한국",
    population VARCHAR(255) DEFAULT "0명",
    add_day DATE DEFAULT (current_date()),
    add_time DATETIME DEFAULT (current_time())
)ENGINE= INNODB;

INSERT INTO tbl_country
VALUES (null, default, default, default, default);

SELECT * from tbl_country;
