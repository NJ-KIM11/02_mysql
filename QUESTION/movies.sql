use mysql;

create database moviedb;

grant all PRIVILEGES on moviedb.* to 'gangnam'@'%';

show grants for 'gangnam'@'%';


use moviedb;

DROP TABLE IF EXISTS movie_theaters;
CREATE TABLE IF NOT EXISTS movie_theaters(
	
    theater_id INT AUTO_INCREMENT,
    name VARCHAR(255),
    location VARCHAR(255),
    PRIMARY KEY(theater_id)    
	
)ENGINE = InnoDB;

DROP TABLE IF EXISTS movies;
CREATE TABLE IF NOT EXISTS movies(
	
    movie_id INT AUTO_INCREMENT,
    title VARCHAR(255),
    show_time DATETIME,
    total_seats INT,
    reserved_seats INT,
    theater_id INT,
    PRIMARY KEY(movie_id),
    FOREIGN KEY(theater_id)
    REFERENCES movie_theaters(theater_id)
	
)ENGINE = InnoDB;


DROP TABLE IF EXISTS reservations;
CREATE TABLE IF NOT EXISTS reservations(
	
    user_name VARCHAR(255),
    movie_id INT,
    seats_reserved INT,
    reserved_time DATETIME DEFAULT(current_time()),
    FOREIGN KEY(movie_id)
    REFERENCES movies(movie_id)
	
)ENGINE = InnoDB;

SELECT*FROM movies;
SELECT*FROM movie_theaters;
SELECT*FROM reservations;


-- 1. 모든 영화관에서 총 몇개의 좌석이 예약되었나요?
SELECT
	SUM(reserved_seats) '총 예약 좌석수'
FROM
	movies;
    
-- 2. 가장 많이 예약된 영화는 어떤거고 몇석이 되었나요?   
SELECT 
	title as '인기짱 영화',
	(total_seats - reserved_seats) as '남은 좌석수'
FROM movies
ORDER BY reserved_seats DESC
LIMIT 1;

SELECT
	title  as '인기짱 영화',
	(total_seats - reserved_seats) as '남은 좌석수'
FROM 
	movies
WHERE 
	reserved_seats = (SELECT MAX(reserved_seats) FROM movies);

-- 3. 특정 영화의 남은 좌석 수를 확인 해주세요 (아무거나 골라서)
SELECT
	title,
	(total_seats - reserved_seats) as '남은 좌석수'
FROM 
	movies
WHERE 
	title = '파일럿';
	


	

/*
영화관 티켓 예매 시스템을 위한 MySQL 데이터베이스를 설계하는 문제

 요구사항
 
  1. 영화 테이블
   각 영화는 고유의 ID, 제목, 상영 시간, 총 좌석 수, 예약된 좌석 수를 가지고 있습니다.
   영화는 특정 영화관에서 상영됩니다.
  2. 영화관 테이블
    영화관은 고유의 ID와 이름, 위치 정보를 가지고 있으며, 여러 영화를 상영할 수 있습니다.
  3. 예약 테이블
    예약은 특정 사용자가 특정 영화의 좌석을 예약하는 것을 의미하며, 예약 시간과 예약된 좌석 수를 기록합니다.
    예약 시 남은 좌석 수를 확인하고, 좌석이 부족하면 예매를 불가하게 해야 합니다.
    
    
    다음 데이터가 들어가게 설계 후 데이터를 삽입 해주세요*/
    INSERT INTO movie_theaters (name, location) VALUES 
('CGV', '서초구'),
('롯데시네마', '강남구'),
('씨네큐', '영등포구');
INSERT INTO movies (title, show_time, total_seats, reserved_seats, theater_id) VALUES 
('늘봄가든', '2024-08-23 14:00:00', 100, 45, 1),
('에어리언', '2024-08-23 17:00:00', 150, 90, 1),
('행복의나라', '2024-08-24 20:00:00', 120, 30, 2),
('파일럿', '2024-08-25 19:00:00', 200, 50, 3);
INSERT INTO reservations (user_name, movie_id, seats_reserved) VALUES 
('철수', 1, 2),
('영희', 2, 4),
('길동', 1, 3),
('관순', 3, 1),
('민식', 4, 5);
