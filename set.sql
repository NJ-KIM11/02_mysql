-- SET
-- 두개 이상의 SELECT 문의 결과 집합을 결합하는데 사용한다.

-- UNION 
-- 두개 이상의 SELECT 문의 결과를 결합하여 중복된 레코드를 제거한 후 반환

SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
 WHERE category_code = 10
 UNION ALL
 SELECT
	menu_code,
    menu_name,
    menu_price,
    category_code,
    orderable_status
 FROM tbl_menu
 WHERE menu_price <9000;
 -- UNION 은 중복 제거, UNION ALL 은 중복제거X
 -- UNION 사용시 SELECT 문은 같아야 한다.
 
 -- INTERSECT
	-- mysql에서는 INNER JOIN 으로 사용
 -- EXCEPT
	-- LEFT JOIN 으로 사용