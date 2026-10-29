-- 한줄 주석
/*
	여러줄 주석
		오늘부터 sql 학습 시작~~!
		
		
		< selsect > 
		데이터를 조회하거나 검색할 떄 사용하는 명령어
		
		
		SELECT
				조회하고자 하는 컬럼
			FROM 
				테이블명;
*/
-- PATIENT 테이블에서 모든 컬럼을 조회
SELECT * FROM PATIENT; -- 성능에 영향을 끼치므로 실무에서는 사용할 수 없음



SELECT 
       PATIENT_ID
	 , PATIENT_NAME
	 , DEPT_ID, WARD_ID
	 , DOCTOR_ID 
  FROM
	   PATIENT;


-----------------------------------------------------------------
-- 반복 숙달


-- PATIENT 테이블로 환자명, 키(cm) 조회
SELECT 
		PATIENT_NAME
	  , HEIGHT_CM
	  , HEIGHT_CM / 100
  FROM 
	    PATIENT;


-- DATE끼리의 연산 -> 입원기간(퇴원일 - 입원일)
SELECT 
	   PATIENT_NAME
	 , ADMISSION_DATE 
	 , DISCHARGE_DATE 
	 , DISCHARGE_DATE - ADMISSION_DATE 
  FROM
  	   PATIENT;
--> 산술연산 과정에서 NULL값이 존재할 경우 결과도 NULL


-- 오늘까지 입원한 일수(오늘날짜 - 입원일)
SELECT 
	   PATIENT_NAME
	 , ADMISSION_DATE
	 , SYSDATE - ADMISSION_DATE
  FROM
	   PATIENT;
----------------------------------------------------------
-- ResultSet : SELECT문을 통해 조회된 데이터 결과물(행들의 집합)
/*
 * 컬럼명이 너무 복잡할 때 -> 별칭 부여하기!
 * 
 * 컬럼명 별칭(한칸 띄고)
 * 컬럼명 AS 별칭
 * 컬럼명 "별칭"
 * 컬럼명 AS "별칭"
 * 
 * <리터럴>
 * 오라클에서 문자열을 다룰 떈 ''을 사용
 * 문자열을 SELECT절에 기술해서 ResultSet에 조회할 수 있음
 */

SELECT 
	   HEIGHT_CM AS "키(CM)"
	 , 'cm'     -- 오라클 전용
  FROM
	   PATIENT;
-------------------------------------------------------------

SELECT 
	   DISTINCT BLOOD_TYPE        -- 중복 제거 DISTINCT
  FROM 
	   PATIENT;

-- PATIENT 테이블에서 환자들의 이름, 몸무게 조회 -- 몸무게가 80kg이상인 사람 조회
SELECT 
	   PATIENT_NAME
	 , WEIGHT_KG
  FROM
	   PATIENT
WHERE 								-- 조건 검색
	   WEIGHT_KG >= 80;



-- PATIENT 테이블에서 환자들의 이름, 성별 조회
SELECT 
	   PATIENT_NAME
	 , GENDER 
  FROM
	   PATIENT
WHERE 								-- 조건 검색
	   GENDER = 'M';
	 --GENDER != 'M'
	 --GENDER <> 'M'

-- 1. FROM 2. WHERE 3. SELECT

-- 병동 코드 W3(중환자실)이면서 키가 160cm 이상인 환자들 이름, 병동코드, 키
SELECT 
	   PATIENT_NAME
	 , WARD_ID
	 , HEIGHT_CM 
  FROM 
       PATIENT
 WHERE
 	   WARD_ID = 'W3'
   AND
 	   HEIGHT_CM >=160;



-- 키가 160이상 170이하인 환자들의 이름, 키를 조회하시오
SELECT 
	   PATIENT_NAME 
	 , HEIGHT_CM 
  FROM
  	   PATIENT
 WHERE
 	   HEIGHT_CM >= 160
   AND
	   HEIGHT_CM <= 170;






-- 환자명, 병동코드(WARD_ID)를 조회하시오.
SELECT 
	     PATIENT_NAME
	   , WARD_ID
    FROM 
		 PATIENT
   ORDER
      BY 
		 WARD_ID
	   , PATIENT_NAME;




	
	







