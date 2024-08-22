-- SUBQUERIES
-- 다른 쿼리 내에서 실행되는 쿼리이다.ALTER

SELECT 
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM tbl_menu
WHERE category_code = (
		SELECT
			category_code
		FROM tbl_menu
		WHERE menu_name = "민트미역국"
	);
-- 소괄호 안쪽을 먼저 실행

-- 서브쿼리를 활용한 메인 쿼리
SELECT 
	MAX(count)
 FROM
	(SELECT
		COUNT(*) AS 'count'
	FROM
		tbl_menu
	GROUP BY category_code) AS countmenu;
-- FROM 절에 있는 서브쿼리는 무조건 꼭 별칭을 지어줘야 한다.

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
FROM tbl_menu a
WHERE 
	menu_price > (
		SELECT
			AVG(menu_price)
		FROM tbl_menu
        WHERE category_code = a.category_code
	);
    
-- SELECT
-- 	menu_code,
--     menu_name,
--     menu_price,
--     category_code,
--     orderable_status
-- FROM tbl_menu 
-- WHERE 
-- 	menu_price > AVG(menu_price);
-- AVG, SUM 등의 함수는 실행 순서 때문에 SELECT 또는 그 이후 에서만 사용가능

    