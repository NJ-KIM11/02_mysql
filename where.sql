-- WHERE
-- 특정 조건에 맞는 데이터만 선택
use menudb;
SELECT
	menu_name,
    menu_price,
    orderable_status
FROM tbl_menu
WHERE orderable_status = 'Y';
-- 실행 순서 : from-->where-->select-->order by

SELECT
	menu_name,
    menu_price,
    orderable_status
FROM tbl_menu
WHERE 
	-- menu_price = 13000;
    menu_price != 13000;  -- != 는 부정의 의미
    
-- 대소 비교 연산자와 함께 사용
SELECT
	menu_code,
    menu_name,
    menu_price
 FROM tbl_menu
 WHERE menu_price = 20000;
 
 -- AND 연산자 활용
 SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
 WHERE
	orderable_status = 'y' AND
    category_code = 10;
    
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM tbl_menu
WHERE
	menu_price > 5000 AND
    category_code = 10;
    
-- OR 연산자 활용
SELECT
	menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
 WHERE
	orderable_status = 'y' OR
    category_code = 10
ORDER BY
	category_code;
    
-- AND 가 OR 보다 우선순위가 높다.
SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM tbl_menu
WHERE
	category_code = 4 OR
    menu_price = 9000 AND
    menu_code > 10;
-- menu_price = 9000 와  menu_code > 10 를 만족시키는 요소들을 가져 오고 category_code = 4 를 만족시키는 요소들을 가져오고  menu_code 로 정렬시킨다

-- BETWEEN 연산자 활용
SELECT
	menu_name,
    menu_price,
    category_code
 FROM tbl_menu
 WHERE
	menu_price NOT BETWEEN 10000 AND 25000
ORDER BY
	menu_price;
-- BETWEEN 은 값 포함이다
-- NOT BETWEEN 으로 부정가능

-- like 연산자 활용
SELECT
	menu_name,
    menu_price
FROM tbl_menu
WHERE menu_name LIKE '%마늘%'
ORDER BY menu_name;
-- 부정 가능(NOT LIKE)

-- IN 연산자 활용
SELECT
	menu_name,
    category_code
FROM tbl_menu
WHERE category_code IN (4,5,6)
ORDER BY
	category_code;
-- NOT으로 부정 가능

-- IS NULL 연산자 활용
SELECT 
	category_code,
    category_name,
    ref_category_code
FROM tbl_category
WHERE ref_category_code IS NOT NULL;
-- NOT 으로 부정 가능

