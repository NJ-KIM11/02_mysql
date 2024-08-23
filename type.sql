-- SQL 형변환
-- 명시적 형변환과 암시적 형변환이 있다.

-- 명시적 형변환

-- CAST
-- CONVERT

SELECT AVG(menu_price) FROM tbl_menu;
SELECT 
	CAST(AVG(menu_price) AS SIGNED INTEGER) AS "평균 메뉴 가격" 
FROM tbl_menu;

SELECT
	CONVERT(AVG(menu_price), SIGNED INTEGER) AS "평균 가격"
FROM tbl_menu;

-- 가능한 데이터 형식
-- BINARY, CHAR, DATE, DATETIME, DECIMAL, JSON, TIME, INTEGER

SELECT
	CAST("2023$5$30" AS DATE),
    CAST("2023/5/30" AS DATE),
    CAST("2023%5%30" AS DATE),
    CAST("2023@5@30" AS DATE);
    
-- 메뉴 가격 구하기
SELECT
	CONCAT(CAST(menu_price AS CHAR(5)), "원")
FROM
	tbl_menu;
    
-- 카테고리별로 메뉴 가격의 합계를 구해서
-- (카테고리 ~~원 ) 으로 표시 해주세요

SELECT
	category_code,
    CONCAT(CAST(SUM(menu_price) AS CHAR(6)), "원") "카테고리별 가격 합계"
FROM
	tbl_menu
GROUP BY
	category_code;
    
-- 암시적 형변환
-- 자동으로 내부에서 이루어지는 형변환
SELECT '1' + '2';  -- 각 문자가 정수로 변환됨.
SELECT CONCAT(menu_price, "원") FROM tbl_menu;  -- 문자로 변환
SELECT 3 > "TEXT"; -- 문자는 0으로 변환
SELECT 3 > "4TEXT"; -- 문자앞에 숫자인경우에만 해당 숫자로 변환
-- 1 : TRUE , 0 : FALSE



