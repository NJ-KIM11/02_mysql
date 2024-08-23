-- TRANSACTION
-- 데이터베이스에서 한번에 수행되는 작업의 단위
-- 시작, 진행, 종료 단계를 가지며, 만약 중간에 오류가 발생하면
-- 롤백을 수행하고 데이터베이스에 제대로 반영하기 위해서는 커밋을 진행한다.

-- commit
/* 
	트랜잭션 처리에 사용되는 명령문 중 하나로
    여러 sql 문을 하나의 트랜잭션으로 그룹화 할 수 있다.
*/

-- rollback
/*
	트랜잭션 처리에 사용되는 명령문 중 하나로
	ROLLBACK 을 사용하면 트랜잭션 내에서 수행한 변경 사항을 취소하고 이전 상태로
    돌릴수 있다.
*/

-- autoCommit 비활성화
SET autocommit = 0; -- OFF 가능

-- autoCommit 활성화
SET autocommit = 1; -- ON 가능

START TRANSACTION;

SELECT * FROM tbl_menu;
INSERT INTO tbl_menu VALUES (null, "바나나해장국", 8500, 4, 'Y');
UPDATE tbl_menu SET menu_name = "수정됨" WHERE menu_code = 1;
DELETE FROM tbl_menu WHERE menu_code = 7;


commit; -- 하면 반영됨
ROLLBACK;

SELECT * FROM tbl_menu;
