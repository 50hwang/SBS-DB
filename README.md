# SBS-DB

> SBS 아카데미 DB수업

***

## 1회차(220917)

> 본 수업에서는 반드시 `MySQL 8.0.11`을 사용한다.
>
>  [다운로드 설치](https://downloads.mysql.com/archives/get/p/25/file/mysql-installer-community-8.0.11.0.msi)
>

### ch01. 데이터베이스의 이해와 MySQL 설치

- DBMS 분류 : 현재는 `관계형 DBMS`를 주로 쓴다.
- `표준 SQL` : ISO에 근거, 표준화가 되어있으나, 각 회사마다 비호환적 SQL문을 활용한다.

### ch02. 데이터베이스 전체 운영 맛보기

1. `MySQL Workbench 8.0`에서 `employees` 얹혔는지 확인
2. `shopDB` 새로 생성 -> `memberTBL` 테이블 생성 및 column(fields) 설정 -> `productTBL`도 동일하게 생성
3. `memberTBL`, `productTBL`에 예시 데이터 입력
4. 본격 SQL 쿼리문 작성 : 실행은 번개 표시(단축키 : `Ctrl`+`Shift`+`Enter`)
   - `SELECT * FROM memberTBL;`   : `memberTBL`의 모든 데이터 조회
   - `SELECT * FROM productTBL;`  : `productTBL`의 모든 데이터 조회
   - `SELECT memberName, memberAddress FROM membertbl;` : `memberTBL` 중 일부 필드(`memberName`, `memberAddress`) 데이터 조회
   - `SELECT * FROM memberTBL WHERE memberName = '토마스';` : `memberTBL` 중 특정 필드의 값에 해당하는 레코드의 모든 데이터 조회
      - 쿼리문 일부 커서 선택 후 실행시, 선택 부분만 실행
   - `CREATE TABLE `my testTBL` (id INT);`  : 테이블 생성 with `id`라는 필드(INT형)
   - `DROP TABLE `my TestTBL`;`             : 테이블 삭제
- 주의사항 : 따옴표 기호(')와 (`) 헷갈리지 말 것.


### 다음 할 일

1. 내 노트북에 직접 `MySQL 8.0.11` 설치 및 환경 설정
2. ch01 전체 실습 : `employees` 샘플 데이터베이스 설치 및 로드
3. ch02 실습 2-4까지 실습 : 
   1. GUI 기능으로 테이블 생성, 필드 생성, 데이터 입력
      - **실행 직전 번역(?)된 쿼리문을 참고하면서 공부할 것.**
   2. SQL 쿼리문으로 테이블 생성, 필드 생성 및 테이블 삭제
4. 어딘가에 `*.sql` 파일을 만들어, 이 파일을 Repository에 올릴 것.(순수 예제 쿼리문 이해를 위한)

***
