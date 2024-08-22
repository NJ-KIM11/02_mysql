-- ORDER BY
-- SELECT 문과 함께 사용하며, 결과 집합을 특정 열이나 열들의 
-- 값에 따라 정렬하는데 사용한다.

SELECT
	menu_code,
    menu_name,
    menu_price
FROM tbl_menu
ORDER BY
	-- menu_price ASC;		
    -- ASC 는 오름차순
    -- 안쓰면 디폴트로 ASC
    menu_price DESC;
    
SELECT
	menu_code,
    menu_name,
    menu_price
FROM tbl_menu
ORDER BY
	menu_price DESC,
    menu_name ASC;
-- 정렬기준을 여러개 주면 위에 있는 기준부터 우선순위
-- 위의 기준의 값이 같을 경우 차후 기준으로 정렬

-- 연산 결과로 결과 집합 정렬
SELECT
	menu_code,
    menu_name,
    menu_price,
    (menu_code * menu_price) AS multi		-- () AS 별칭 -- 별칭 지어주기
FROM
	tbl_menu
ORDER BY
	multi DESC;
    