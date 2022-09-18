/* 새로운 데이터베이스 `showDB`생성 */

CREATE SCHEMA `shopdb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;


/* 데이터베이스 안에 새로운 테이블 `memberTBL`생성 */

CREATE TABLE `shopdb`.`membertbl` (
  `memberID` CHAR(8) NOT NULL,
  `memberName` CHAR(5) NOT NULL,
  `memberAddress` CHAR(20) NULL,
  PRIMARY KEY (`memberID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


/* 데이터베이스 안에 새로운 테이블 `productTBL`생성 */

CREATE TABLE `shopdb`.`producttbl` (
  `productName` CHAR(4) NOT NULL,
  `cost` INT NOT NULL,
  `makeDate` DATE NULL,
  `company` CHAR(5) NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`productName`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


/* `memberTBL` 안에 테이블 안에 데이터 입력 */

INSERT INTO `shopdb`.`membertbl` (`memberID`, `memberName`, `memberAddress`) VALUES ('Thomas', '토마스', '경기 부천시 중동');
INSERT INTO `shopdb`.`membertbl` (`memberID`, `memberName`, `memberAddress`) VALUES ('Edward', '에드워드', '서울 은평구 증산동');
INSERT INTO `shopdb`.`membertbl` (`memberID`, `memberName`, `memberAddress`) VALUES ('Henry', '헨리', '인천 남구 주안동');
INSERT INTO `shopdb`.`membertbl` (`memberID`, `memberName`, `memberAddress`) VALUES ('Gorden', '고든', '경기 성남시 분당구');

/* `productTBL` 안에 테이블 안에 데이터 입력 */

INSERT INTO `shopdb`.`producttbl` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('냉장고', '10', '2019-07-01', '삼성', '17');
INSERT INTO `shopdb`.`producttbl` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('컴퓨터', '20', '2020-03-01', 'LG', '3');
INSERT INTO `shopdb`.`producttbl` (`productName`, `cost`, `makeDate`, `company`, `amount`) VALUES ('모니터', '5', '2021-09-01', '롯데', '22');


/* `productTBL` 안에 테이블 모든 데이터 조회 */

SELECT * FROM shopdb.producttbl;


/* `memberTBL` 안에 테이블 모든 데이터 조회 */

SELECT * FROM shopdb.membertbl;

/* `memberTBL` 안에 `memberName`, `memberAddress` 필드 데이터 조회 */

SELECT memberName, memberAddress FROM memberTBL;

/* `memberTBL` 안에 `memberName`이 '토마스'인 레코드의 모든 데이터 조회 */

SELECT * FROM memberTBL WHERE memberName = '토마스';

/* 간단한 테이블 `my testTBL`을 생성하는 SQL 문 실행 */

CREATE TABLE `my testTBL` (id INT);

/* 테이블 `my testTBL`을 삭제하는 SQL 문 실행 */

DROP TABLE `my TestTBL`;
