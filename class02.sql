/* 인덱스 테스트 */

/* 500건의 데이터가 있는 indexTBL 생성 */

CREATE TABLE indexTBL (first_name varchar(14), last_name varchar(16), hire_date date);
INSERT INTO indexTBL
	SELECT first_name, last_name, hire_date
    FROM employees.employees
	LIMIT 500;
SELECT * FROM indexTBL;

/* indexTBL에서 이름이 ‘ Mary’인 사람을 조회 */ /* 반드시 새로운 쿼리문에서 작성할 것 */

SELECT * FROM indexTBL WHERE first_name = 'Mary';


/* 테이블(indexTBL)의 이름(first_name) 열에 인덱스 생성 */

CREATE INDEX idx_indexTBL_firstname ON indexTBL(first_name);


/* 다시 검색 */ /* 반드시 새로운 쿼리문에서 작성할 것 */
SELECT * FROM indexTBL WHERE first_name = 'Mary';

/* 뷰  */

/* 회원 이름과 주소만 있는 뷰 생성 */
CREATE VIEW uv_memberTBL
AS
	SELECT memberName, memberAddress FROM memberTBL;
  
/* 생성된 뷰(uv_memberTBL) 조회 */
SELECT * FROM uv_memberTBL;

/* 스토어드 프로시저 테스트 */

/* `shopDB`에서 두 테이블을 연결하는 스토어드 프로시저 만들기 */
/* 1. 2개의 쿼리를 각각 실행하기 */
SELECT * FROM memberTBL WHERE memberName = '토마스';
SELECT * FROM productTBL WHERE productName = '냉장고';


/* 2. 2개의 쿼리를 하나의 스토어드 프로시저로 만들기 */
/* 2-1. 스토어드 프로시저 생성 */
DELIMITER //
CREATE PROCEDURE myProc()
BEGIN
	SELECT * FROM memberTBL WHERE memberName = '토마스';
    SELECT * FROM productTBL WHERE productName = '냉장고';
END //
DELIMITER ;

/* 2-2. 스토어드 프로시저 실행 */
CALL myProc();

/* 트리거 테스트 */

/* 1. 데이터를 삽입, 수정, 삭제하는 SQL 문 작성하기 */
/* 1-2 새로운 회원 ‘Soccer/흥민/서울시 서대문구 북가좌동’ 삽입 */
INSERT INTO memberTBL VALUES ('Soccer', '흥민', '서울시 서대문구 북가좌동');

/* 1-3 ‘흥민’인 회원의 주소를 ‘서울 강남구 역삼동’으로 수정 */
UPDATE memberTBL SET memberAddress = '서울 강남구 역삼동' WHERE memberName = '흥민';

/* 1-4 DELETE 문으로 회원 테이블에서 흥민 정보 삭제 */
DELETE FROM memberTBL WHERE	memberName = '흥민'

/* 2. 다른 테이블에 삭제된 데이터와 삭제된 날짜 기록하기 */
/* 2-1 삭제된 데이터를 보관할 테이블(deletedMemberTBL) 생성 */
CREATE TABLE deletedMemberTBL
	(memberID char(8),
    memberName char(5),
    memberAddress char(20),
    deletedDate date
    );

/* 2-2 삭제된 데이터가 기록되는 트리거 생성 */
DELIMITER //
CREATE TRIGGER trg_deletedMemberTBL
	AFTER DELETE
    ON memberTBL
    FOR EACH ROW
BEGIN
	INSERT INTO deletedMemberTBL
		VALUES (OLD.memberID, OLD.memberName, OLD.memberAddress, CURDATE());
END //
DELIMITER ;

/* 2-3 데이터 생성 후 삭제*/
INSERT INTO memberTBL VALUES ('Soccer', '흥민', '서울시 서대문구 북가좌동');
DELETE FROM memberTBL WHERE	memberName = '흥민';

/* 2-4 삭제된 데이터에 백업 되었는지 여부 확인*/
SELECT * FROM deletedMemberTBL;
