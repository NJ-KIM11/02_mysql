-- DDL (Data Definition Language)
-- 데이터베이스의 스키마를 정의하거나 수정하는데 사용되는 sql의 한 부분이다.
-- 스키마 = 데이터베이스 전체 또는 일부의 논리적인 구조를 표현하는 것.

-- CREATE - 테이블 생성을 위한 구문
-- tb1 테이블 생성
CREATE TABLE IF NOT EXISTS tb1(
		-- 컬럼명, 자료형, 제약조건
        pk INT PRIMARY KEY,
        fk INT,
        col1 VARCHAR(255)
        CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;
-- innodb : 트랙잭션 기능을 제공해 동시성과 무결성을 높이고
-- 복구 기능을 지원해 시스템이 예기치 않게 중단되더라도 데이터의 일관성을 보장한다.
-- MyISAM, NDB Cluster

-- 테이블 구조 확인
DESCRIBE tb1;

INSERT INTO tb1 VALUES(1,10,'Y');
INSERT INTO tb1 VALUES(2,null,'Y');
SELECT * FROM tb1;

-- AUTO_INCREMENT
-- insert 시에 칼럼에 자동으로 번호를 발생시킴(중복되지 않게)

CREATE TABLE If NOT EXISTS tb2(
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255)
    CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;

DESCRIBE tb2;

INSERT INTO tb2 VALUES(null,10,'Y');
INSERT INTO tb2 VALUES(null,20,'n');

SELECT * FROM tb2;

-- ALTER
-- 테이블에 추가/변경/수정/삭제 하는 모든 것은 ALTER 명령어를 적용한다.
-- 종류가 많아 대표적인 것들만 살펴본다..

-- 열 추가 (테이블에 컬럼 추가)
ALTER TABLE tb2
ADD col2 INT NOT NULL;

DESCRIBE tb2;
SELECT * FROM tb2;

-- 열 삭제 (테이블에서 컬럼 삭제)
ALTER TABLE tb2
DROP COLUMN col2;

-- 제약조건 추가 및 삭제
ALTER TABLE tb2
DROP PRIMARY KEY;

ALTER TABLE tb2
MODIFY pk INT;
-- Auto Increment 를 갖고 있으면 Primary Key 해제가 안된다.
-- 먼저 MODIFY 로 Auto Increment 를 없애주고 Primary Key 를 해제 해야 한다.

-- DROP 
-- 테이블을 삭제하기 위한 구문

CREATE TABLE IF NOT EXISTS tb4(
	pk INT AUTO_INCREMENT PRIMARY KEY,
    fk INT,
    col1 VARCHAR(255),
    CHECK(col1 IN ('Y','N'))
)ENGINE = INNODB;

DESCRIBE tb3;
DROP TABLE IF EXISTS tb3;

