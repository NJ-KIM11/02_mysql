-- LIMIT
-- 결과 집합에서 반환할 행의 수를 제한할 수 있다.

SELECT 
	menu_code,
    menu_name,
    menu_price
 FROM tbl_menu
 ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 5;

SELECT 
	menu_code,
    menu_name,
    menu_price
 FROM tbl_menu
 ORDER BY
	menu_price DESC,
    menu_name ASC
LIMIT 1,4;
-- (몇번째 행부터 출력하지), (몇 줄을 출력할지)
-- 1번 째 행은 2 번째 줄이다