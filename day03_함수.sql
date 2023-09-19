-- day03_함수.sql
# 함수
[1] 단일행 함수
[2] 그룹 함수
[3] 기타 함수
-----------------------------------------
#[1] 단일행 함수
    <1> 문자형 함수
    <2> 숫자형 함수
    <3> 날짜형 함수
    <4> 변환 함수
    <5> 기타
#<1> 문자형 함수    

(1) LOWER()/UPPER() : 소문자/대문자로 변환
SELECT LOWER('Happy Birthday'), upper('Happy Birthday') from dual;

select * from dual;

select 2*7 from dual;

(2) initCap() : 첫글자를 대문자, 나머지는 소문자

SELECT DEPTNO, DNAME, INITCAP(DNAME), LOC, INITCAP(LOC) FROM DEPT;

--(3) CONCAT(컬럼1, 컬럼2) : 두 컬럼을 연결해준다
-------------
SELECT CONCAT('ABC','1234') FROM DUAL;

SELECT EMPNO,ENAME, CONCAT(CONCAT(ENAME,' '),JOB) E_JOB
FROM EMP;

 [문제] 사원 테이블에서 SCOTT의 사번,이름,담당업무(소문자로),부서번호를
		출력하세요.
        SELECT EMPNO, ENAME, LOWER(JOB), DEPTNO
        FROM EMP WHERE ENAME=UPPER('scott');

    상품 테이블에서 판매가를 화면에 보여줄 때 금액의 단위를 함께 
	 붙여서 출력하세요.
     select products_name, concat(output_price,'원') out_price
     from products;
     
--(4) SUBSTR(컬럼, START, LEN)  : 문자열의 일부를 추출하는 함수   
     
SELECT SUBSTR('ABCDEFG',3,4) FROM DUAL; --CDEF
SELECT SUBSTR('050130-3012456',8,7) FROM DUAL;
SELECT SUBSTR('050130-3012456',-7) FROM DUAL;
-- 음수값을 넣으면 문자 끝에서부터 카운팅함. 양수값은 앞에서부터
SELECT SUBSTR('050130-3012456',8) FROM DUAL;

05년01월30일 로 출력해보세요

SELECT SUBSTR('050130-3012456',1,2)||'년 '||SUBSTR('050130-3012456',3,2)||'월 ',
SUBSTR('050130-3012456',5,2)||'일생' FROM DUAL;

--(5) LENGTH() : 문자열 길이 반환
SELECT LENGTH('050130-3012456') FROM DUAL;


[문제]
	  사원 테이블에서 첫글자가 'K'보다 크고 'Y'보다 작은 사원의
	  사번,이름,업무,급여를 출력하세요. 단 이름순으로 정렬하세요.
      SELECT EMPNO, ENAME,JOB, SAL
      FROM EMP
      WHERE SUBSTR(ENAME,1,1)> 'K' AND SUBSTR(ENAME,1,1) <'Y'
      ORDER BY ENAME ASC;
      
      사원테이블에서 부서가 20번인 사원의 사번,이름,이름자릿수,
	급여,급여의 자릿수를 출력하세요.
	SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
    FROM EMP;
	
	사원테이블의 사원이름 중 6자리 이상을 차지하는 사원의이름과 
	이름자릿수를 보여주세요.
    SELECT ENAME, LENGTH(ENAME)
    FROM EMP WHERE LENGTH(ENAME)>=6;
    
    (6) LPAD(컬럼, LEN, CH)/RPAD() : 주어진 문자로 왼쪽/오른쪽을 채운다
    
    SELECT ENAME, LPAD(ENAME,15,'*'), LPAD(SAL,10,'#') 
    FROM EMP;
    
    SELECT RPAD(DNAME,15,'*') FROM DEPT;
    
   (7) LTRIM(컬럼,CH), RTRIM()
    
    SELECT LTRIM('tttHello test','t'), RTRIM('tttHello test','t') FROM DUAL;    
    
    SELECT LENGTH(LTRIM('  HI ORACLE ',' ')) FROM DUAL;
    
--   (8) REPLACE(컬럼, 문자1, 문자2): 컬럼에서 문자1을 찾아서 문자2로 대체함
   
   SELECT REPLACE('ORACLE TEST','TEST','BYE') FROM DUAL;
    
    
[문제]
	사원테이블에서 10번 부서의 사원에 대해 담당업무 중 우측에'T'를
	삭제하고 급여중 우측의 0을 삭제하여 출력하세요.
    SELECT JOB, RTRIM(JOB,'T'), SAL, RTRIM(SAL,0)
    FROM EMP WHERE DEPTNO=10;

사원테이블 JOB에서 'A'를 '$'로 바꾸어 출력하세요.
    SELECT JOB, REPLACE(JOB,'A','$') FROM EMP;

고객 테이블의 직업에 해당하는 컬럼에서 직업 정보가 학생인 정보를 모두
	 대학생으로 변경해 출력되게 하세요.
    SELECT * FROM MEMBER;     
    SELECT NAME,JOB, REPLACE(JOB,'학생','대학생') FROM MEMBER;
     
--고객 테이블 주소에서 서울시를 서울특별시로 수정하세요.
--	 UPDATE 문과 REPLACE()함수 활용
     
     UPDATE MEMBER SET ADDR=REPLACE(ADDR,'서울시','서울특별시')
     WHERE ADDR LIKE '%서울시%';
     
     SELECT * FROM MEMBER;
     ROLLBACK;
-----------------------------------------------------------     
 # <2> 숫자형 함수
 
-- (1) ROUND(값), ROUND(값,N): 반올림
N이 양수인 경우 소수점을 기준으로 오른쪽으로 N 위치의 값을 반올림함. 즉 N+1 자리값을 보고 5이상이면 올리고 미만이면 버린다
N이 음수인 경우는 소수점을 기준으로 왼쪽으로 N 위치에서 반올림 여부를 정함 ==> 정수
 
 SELECT ROUND(4567.678), ROUND(4567.678,0), ROUND(4567.678,2), ROUND(4567.678,-2) FROM DUAL;
 
 (2) TRUNC(값), TRUNC(값,N): 버림
 
 SELECT TRUNC(4567.678), TRUNC(4567.678,0), TRUNC(4567.678,2), TRUNC(4567.678,-2) FROM DUAL;
 
 (3) MOD(값1, 값2) : 값1을 값2로 나눈 나머지값을 반환
 
 SELECT MOD(10,3) FROM DUAL;
 
 (4) ABS(값) : 절대값을 반환
 SELECT ABS(8), ABS(-8) FROM DUAL;
 
 (5) CEIL(값) : 올림
 (6) FLOOR(값): 내림
 
 SELECT CEIL(500.001), FLOOR(500.001) FROM DUAL;
 
 [문제]
상품 테이블의 상품 정보가운데 천원단위까지 버린 배송비를 비교하여 출력하세요.
SELECT PRODUCTS_NAME, TRANS_COST, TRUNC(TRANS_COST,-4) FROM PRODUCTS;
  
사원테이블에서 부서번호가 10인 사원의 급여를 30으로 나눈 나머지를 출력하세요.
SELECT DEPTNO,ENAME,SAL, MOD(SAL,30) FROM EMP;
 
MEMBER테이블에서 각 회원들의 나이가 40세와 몇살차이가 나는지 이름,나이, 나이차 순으로
출력하세요
SELECT NAME, AGE, ABS(AGE-40) "40세와의 나이차이" FROM MEMBER;
--------------------------------------------
#<3> 날짜 함수

날짜 연산================================
DATE +숫자 : 일수를 더함
DATE -숫자 : 일수를 뺌
DATE - DATE : 일수
DATE +/- 숫자/24 : 시간을 더하거나 뺀다
========================================
SELECT SYSDATE "오늘", SYSDATE+3 "3일후", SYSDATE-3 "3일전" FROM DUAL;

SELECT CEIL(TO_DATE('23/09/30','YY/MM/DD') - SYSDATE)  FROM DUAL;


SELECT TO_CHAR(SYSDATE +3/24, 'YY/MM/DD HH:MI:SS') FROM DUAL;

--2시간 전의 시간정보 출력하세요
SELECT TO_CHAR(SYSDATE -2/24, 'YY/MM/DD HH:MI:SS') FROM DUAL;


--[실습]
--	사원테이블에서 현재까지의 근무 일수가 몇 주 몇일인가를 출력하세요.
--	단 근무일수가 많은 사람순으로 출려하세요.
    
    SELECT ENAME, SYSDATE, HIREDATE, TRUNC((SYSDATE-HIREDATE)/7) WEEKS,
    TRUNC(MOD((SYSDATE-HIREDATE),7)) DAYS
    FROM EMP;
    
  (1) MONTHS_BETWEEN(DATE1, DATE2)    :두 날짜 사이의 월수를 반환한다
    
    SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('23/03/19','YY/MM/DD')) FROM DUAL;
    
   (2) ADD_MONTHS(DATE, N) : 날짜에 N월 만큼 더한 날짜를 반환
   
   오늘로부터 5개월 뒤, 2개월 전 날짜를 구해 출력하세요
   
   SELECT SYSDATE, ADD_MONTHS(SYSDATE,5), ADD_MONTHS(SYSDATE,-2) FROM DUAL;
   
   (3) LAST_DAY(DATE) : 월의 마지막 날짜를 구할때 사용
   
   SELECT LAST_DAY('23/02/01'), LAST_DAY('22/02/01'),LAST_DAY('24/02/01') FROM DUAL;
   
   (4) SYSDATE : 현재 날자와 시간값을 반환
   (5) SYSTIMESTAMP :현재 날자와 시간값을 반환
   
   SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;
   
   SELECT SYSTIMESTAMP FROM DUAL;   

  SELECT TO_CHAR(SYSDATE,'CC YEAR-MONTH-DDD DAY') FROM DUAL;

#<4> 변환함수
 (1) TO_CHAR(날짜)
     TO_CHAR(숫자)
     : 날짜 또는 숫자를 문자열(VARCHAR2)로 변환하는 함수
     
     SELECT TO_CHAR(SYSDATE), TO_CHAR(SYSDATE, 'YYY-MON-DD HH12:MI:SS') FROM DUAL;
     

    고객테이블의 등록일자(REG_DATE)를 0000-00-00 의 형태로 출력하세요.
	
    SELECT NAME, TO_CHAR(REG_DATE,'YYYY-MM-DD') FROM MEMBER;
	 
	 고객테이블에 있는 고객 정보 중 등록연도가 2013년인 
	 고객의 정보를 보여주세요.
     
     SELECT NAME, AGE, REG_DATE
     FROM MEMBER WHERE TO_CHAR(REG_DATE,'YYYY')='2013';
	
	 고객테이블에 있는 고객 정보 중 등록일자가 2013년 5월1일보다 
	 늦은 정보를 출력하세요. 
	 단, 고객등록 정보는 년, 월만 보이도록 합니다.   
     
     select name, to_char(reg_date,'yy-mm') "등록일자"
     from member where reg_date > '13/05/01';
     
     
     숫자 유형을 문자 유형으로 변환
     TO_CHAR(숫자, 출력형식)
     
     SELECT TO_CHAR(1000000,'9,999,999') FROM DUAL;
     SELECT TO_CHAR(25000,'$99G999') FROM DUAL;
     
     SELECT TO_CHAR(25000,'L99,999') FROM DUAL;
     
     SELECT TO_CHAR(23,'S999'), TO_CHAR(-23,'999S') FROM DUAL;
     
     SELECT TO_CHAR(23,'99.99'), TO_CHAR(23,'99D99') FROM DUAL;
     SELECT TO_CHAR(23,'99.99EEEE') FROM DUAL;


    (2) TO_NUMBER(문자열,출력포맷) : 문자열(VARCHAR2, CHAR)을 숫자(NUMBER)로 변환
    
    SELECT TO_NUMBER('125,300','999,999') + 100000 FROM DUAL;
    
    
    '$25,000' 값의 2배 값을 구해 출력하세요
    SELECT TO_CHAR( (TO_NUMBER('$25,000','$99,999') * 2),'$99,999') FROM DUAL;
    

    상품 테이블에서 상품의 공급 금액을 가격 표시 방법으로 표시하세요.
	  천자리 마다 , 를 표시합니다.
    
    SELECT PRODUCTS_NAME, TO_CHAR(INPUT_PRICE,'999,999,999') "공급가격" FROM PRODUCTS;  
	
	 상품 테이블에서 상품의 판매가를 출력하되 주화를 표시할 때 사용하는 방법을
	  사용하여 출력하세요.[예:\10,000]
      
      SELECT PRODUCTS_NAME, TO_CHAR(OUTPUT_PRICE,'L999,999,999') "판매가격" FROM PRODUCTS;


  (3) TO_DATE(문자열, 출력형식) : 문자 데이터를 날짜 유형으로 변환
  
  
  SELECT ADD_MONTHS('20230512', 5) FROM DUAL;
  SELECT TRUNC(TO_DATE('20230512','YYYYMMDD') - SYSDATE) FROM DUAL;
  
  EMP에서 입사 년도별 입사한 사원수를 구해 출력하세요
  
  GROUP BY,  COUNT(*)
  
  SELECT HIREDATE, COUNT(*)
  FROM EMP
  GROUP BY HIREDATE;
  
  SELECT TO_CHAR(HIREDATE,'YY'), COUNT(*)
  FROM EMP
  GROUP BY TO_CHAR(HIREDATE,'YY')
  ORDER BY 1;
  
  
  