-- day03_�Լ�.sql
# �Լ�
[1] ������ �Լ�
[2] �׷� �Լ�
[3] ��Ÿ �Լ�
-----------------------------------------
#[1] ������ �Լ�
    <1> ������ �Լ�
    <2> ������ �Լ�
    <3> ��¥�� �Լ�
    <4> ��ȯ �Լ�
    <5> ��Ÿ
#<1> ������ �Լ�    

(1) LOWER()/UPPER() : �ҹ���/�빮�ڷ� ��ȯ
SELECT LOWER('Happy Birthday'), upper('Happy Birthday') from dual;

select * from dual;

select 2*7 from dual;

(2) initCap() : ù���ڸ� �빮��, �������� �ҹ���

SELECT DEPTNO, DNAME, INITCAP(DNAME), LOC, INITCAP(LOC) FROM DEPT;

--(3) CONCAT(�÷�1, �÷�2) : �� �÷��� �������ش�
-------------
SELECT CONCAT('ABC','1234') FROM DUAL;

SELECT EMPNO,ENAME, CONCAT(CONCAT(ENAME,' '),JOB) E_JOB
FROM EMP;

 [����] ��� ���̺��� SCOTT�� ���,�̸�,������(�ҹ��ڷ�),�μ���ȣ��
		����ϼ���.
        SELECT EMPNO, ENAME, LOWER(JOB), DEPTNO
        FROM EMP WHERE ENAME=UPPER('scott');

    ��ǰ ���̺��� �ǸŰ��� ȭ�鿡 ������ �� �ݾ��� ������ �Բ� 
	 �ٿ��� ����ϼ���.
     select products_name, concat(output_price,'��') out_price
     from products;
     
--(4) SUBSTR(�÷�, START, LEN)  : ���ڿ��� �Ϻθ� �����ϴ� �Լ�   
     
SELECT SUBSTR('ABCDEFG',3,4) FROM DUAL; --CDEF
SELECT SUBSTR('050130-3012456',8,7) FROM DUAL;
SELECT SUBSTR('050130-3012456',-7) FROM DUAL;
-- �������� ������ ���� ���������� ī������. ������� �տ�������
SELECT SUBSTR('050130-3012456',8) FROM DUAL;

05��01��30�� �� ����غ�����

SELECT SUBSTR('050130-3012456',1,2)||'�� '||SUBSTR('050130-3012456',3,2)||'�� ',
SUBSTR('050130-3012456',5,2)||'�ϻ�' FROM DUAL;

--(5) LENGTH() : ���ڿ� ���� ��ȯ
SELECT LENGTH('050130-3012456') FROM DUAL;


[����]
	  ��� ���̺��� ù���ڰ� 'K'���� ũ�� 'Y'���� ���� �����
	  ���,�̸�,����,�޿��� ����ϼ���. �� �̸������� �����ϼ���.
      SELECT EMPNO, ENAME,JOB, SAL
      FROM EMP
      WHERE SUBSTR(ENAME,1,1)> 'K' AND SUBSTR(ENAME,1,1) <'Y'
      ORDER BY ENAME ASC;
      
      ������̺��� �μ��� 20���� ����� ���,�̸�,�̸��ڸ���,
	�޿�,�޿��� �ڸ����� ����ϼ���.
	SELECT EMPNO, ENAME, LENGTH(ENAME), SAL, LENGTH(SAL)
    FROM EMP;
	
	������̺��� ����̸� �� 6�ڸ� �̻��� �����ϴ� ������̸��� 
	�̸��ڸ����� �����ּ���.
    SELECT ENAME, LENGTH(ENAME)
    FROM EMP WHERE LENGTH(ENAME)>=6;
    
    (6) LPAD(�÷�, LEN, CH)/RPAD() : �־��� ���ڷ� ����/�������� ä���
    
    SELECT ENAME, LPAD(ENAME,15,'*'), LPAD(SAL,10,'#') 
    FROM EMP;
    
    SELECT RPAD(DNAME,15,'*') FROM DEPT;
    
   (7) LTRIM(�÷�,CH), RTRIM()
    
    SELECT LTRIM('tttHello test','t'), RTRIM('tttHello test','t') FROM DUAL;    
    
    SELECT LENGTH(LTRIM('  HI ORACLE ',' ')) FROM DUAL;
    
--   (8) REPLACE(�÷�, ����1, ����2): �÷����� ����1�� ã�Ƽ� ����2�� ��ü��
   
   SELECT REPLACE('ORACLE TEST','TEST','BYE') FROM DUAL;
    
    
[����]
	������̺��� 10�� �μ��� ����� ���� ������ �� ������'T'��
	�����ϰ� �޿��� ������ 0�� �����Ͽ� ����ϼ���.
    SELECT JOB, RTRIM(JOB,'T'), SAL, RTRIM(SAL,0)
    FROM EMP WHERE DEPTNO=10;

������̺� JOB���� 'A'�� '$'�� �ٲپ� ����ϼ���.
    SELECT JOB, REPLACE(JOB,'A','$') FROM EMP;

�� ���̺��� ������ �ش��ϴ� �÷����� ���� ������ �л��� ������ ���
	 ���л����� ������ ��µǰ� �ϼ���.
    SELECT * FROM MEMBER;     
    SELECT NAME,JOB, REPLACE(JOB,'�л�','���л�') FROM MEMBER;
     
--�� ���̺� �ּҿ��� ����ø� ����Ư���÷� �����ϼ���.
--	 UPDATE ���� REPLACE()�Լ� Ȱ��
     
     UPDATE MEMBER SET ADDR=REPLACE(ADDR,'�����','����Ư����')
     WHERE ADDR LIKE '%�����%';
     
     SELECT * FROM MEMBER;
     ROLLBACK;
-----------------------------------------------------------     
 # <2> ������ �Լ�
 
-- (1) ROUND(��), ROUND(��,N): �ݿø�
N�� ����� ��� �Ҽ����� �������� ���������� N ��ġ�� ���� �ݿø���. �� N+1 �ڸ����� ���� 5�̻��̸� �ø��� �̸��̸� ������
N�� ������ ���� �Ҽ����� �������� �������� N ��ġ���� �ݿø� ���θ� ���� ==> ����
 
 SELECT ROUND(4567.678), ROUND(4567.678,0), ROUND(4567.678,2), ROUND(4567.678,-2) FROM DUAL;
 
 (2) TRUNC(��), TRUNC(��,N): ����
 
 SELECT TRUNC(4567.678), TRUNC(4567.678,0), TRUNC(4567.678,2), TRUNC(4567.678,-2) FROM DUAL;
 
 (3) MOD(��1, ��2) : ��1�� ��2�� ���� ���������� ��ȯ
 
 SELECT MOD(10,3) FROM DUAL;
 
 (4) ABS(��) : ���밪�� ��ȯ
 SELECT ABS(8), ABS(-8) FROM DUAL;
 
 (5) CEIL(��) : �ø�
 (6) FLOOR(��): ����
 
 SELECT CEIL(500.001), FLOOR(500.001) FROM DUAL;
 
 [����]
��ǰ ���̺��� ��ǰ ������� õ���������� ���� ��ۺ� ���Ͽ� ����ϼ���.
SELECT PRODUCTS_NAME, TRANS_COST, TRUNC(TRANS_COST,-4) FROM PRODUCTS;
  
������̺��� �μ���ȣ�� 10�� ����� �޿��� 30���� ���� �������� ����ϼ���.
SELECT DEPTNO,ENAME,SAL, MOD(SAL,30) FROM EMP;
 
MEMBER���̺��� �� ȸ������ ���̰� 40���� ������̰� ������ �̸�,����, ������ ������
����ϼ���
SELECT NAME, AGE, ABS(AGE-40) "40������ ��������" FROM MEMBER;
--------------------------------------------
#<3> ��¥ �Լ�

��¥ ����================================
DATE +���� : �ϼ��� ����
DATE -���� : �ϼ��� ��
DATE - DATE : �ϼ�
DATE +/- ����/24 : �ð��� ���ϰų� ����
========================================
SELECT SYSDATE "����", SYSDATE+3 "3����", SYSDATE-3 "3����" FROM DUAL;

SELECT CEIL(TO_DATE('23/09/30','YY/MM/DD') - SYSDATE)  FROM DUAL;


SELECT TO_CHAR(SYSDATE +3/24, 'YY/MM/DD HH:MI:SS') FROM DUAL;

--2�ð� ���� �ð����� ����ϼ���
SELECT TO_CHAR(SYSDATE -2/24, 'YY/MM/DD HH:MI:SS') FROM DUAL;


--[�ǽ�]
--	������̺��� ��������� �ٹ� �ϼ��� �� �� �����ΰ��� ����ϼ���.
--	�� �ٹ��ϼ��� ���� ��������� ����ϼ���.
    
    SELECT ENAME, SYSDATE, HIREDATE, TRUNC((SYSDATE-HIREDATE)/7) WEEKS,
    TRUNC(MOD((SYSDATE-HIREDATE),7)) DAYS
    FROM EMP;
    
  (1) MONTHS_BETWEEN(DATE1, DATE2)    :�� ��¥ ������ ������ ��ȯ�Ѵ�
    
    SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('23/03/19','YY/MM/DD')) FROM DUAL;
    
   (2) ADD_MONTHS(DATE, N) : ��¥�� N�� ��ŭ ���� ��¥�� ��ȯ
   
   ���÷κ��� 5���� ��, 2���� �� ��¥�� ���� ����ϼ���
   
   SELECT SYSDATE, ADD_MONTHS(SYSDATE,5), ADD_MONTHS(SYSDATE,-2) FROM DUAL;
   
   (3) LAST_DAY(DATE) : ���� ������ ��¥�� ���Ҷ� ���
   
   SELECT LAST_DAY('23/02/01'), LAST_DAY('22/02/01'),LAST_DAY('24/02/01') FROM DUAL;
   
   (4) SYSDATE : ���� ���ڿ� �ð����� ��ȯ
   (5) SYSTIMESTAMP :���� ���ڿ� �ð����� ��ȯ
   
   SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;
   
   SELECT SYSTIMESTAMP FROM DUAL;   

  SELECT TO_CHAR(SYSDATE,'CC YEAR-MONTH-DDD DAY') FROM DUAL;

#<4> ��ȯ�Լ�
 (1) TO_CHAR(��¥)
     TO_CHAR(����)
     : ��¥ �Ǵ� ���ڸ� ���ڿ�(VARCHAR2)�� ��ȯ�ϴ� �Լ�
     
     SELECT TO_CHAR(SYSDATE), TO_CHAR(SYSDATE, 'YYY-MON-DD HH12:MI:SS') FROM DUAL;
     

    �����̺��� �������(REG_DATE)�� 0000-00-00 �� ���·� ����ϼ���.
	
    SELECT NAME, TO_CHAR(REG_DATE,'YYYY-MM-DD') FROM MEMBER;
	 
	 �����̺� �ִ� �� ���� �� ��Ͽ����� 2013���� 
	 ���� ������ �����ּ���.
     
     SELECT NAME, AGE, REG_DATE
     FROM MEMBER WHERE TO_CHAR(REG_DATE,'YYYY')='2013';
	
	 �����̺� �ִ� �� ���� �� ������ڰ� 2013�� 5��1�Ϻ��� 
	 ���� ������ ����ϼ���. 
	 ��, ����� ������ ��, ���� ���̵��� �մϴ�.   
     
     select name, to_char(reg_date,'yy-mm') "�������"
     from member where reg_date > '13/05/01';
     
     
     ���� ������ ���� �������� ��ȯ
     TO_CHAR(����, �������)
     
     SELECT TO_CHAR(1000000,'9,999,999') FROM DUAL;
     SELECT TO_CHAR(25000,'$99G999') FROM DUAL;
     
     SELECT TO_CHAR(25000,'L99,999') FROM DUAL;
     
     SELECT TO_CHAR(23,'S999'), TO_CHAR(-23,'999S') FROM DUAL;
     
     SELECT TO_CHAR(23,'99.99'), TO_CHAR(23,'99D99') FROM DUAL;
     SELECT TO_CHAR(23,'99.99EEEE') FROM DUAL;


    (2) TO_NUMBER(���ڿ�,�������) : ���ڿ�(VARCHAR2, CHAR)�� ����(NUMBER)�� ��ȯ
    
    SELECT TO_NUMBER('125,300','999,999') + 100000 FROM DUAL;
    
    
    '$25,000' ���� 2�� ���� ���� ����ϼ���
    SELECT TO_CHAR( (TO_NUMBER('$25,000','$99,999') * 2),'$99,999') FROM DUAL;
    

    ��ǰ ���̺��� ��ǰ�� ���� �ݾ��� ���� ǥ�� ������� ǥ���ϼ���.
	  õ�ڸ� ���� , �� ǥ���մϴ�.
    
    SELECT PRODUCTS_NAME, TO_CHAR(INPUT_PRICE,'999,999,999') "���ް���" FROM PRODUCTS;  
	
	 ��ǰ ���̺��� ��ǰ�� �ǸŰ��� ����ϵ� ��ȭ�� ǥ���� �� ����ϴ� �����
	  ����Ͽ� ����ϼ���.[��:\10,000]
      
      SELECT PRODUCTS_NAME, TO_CHAR(OUTPUT_PRICE,'L999,999,999') "�ǸŰ���" FROM PRODUCTS;


  (3) TO_DATE(���ڿ�, �������) : ���� �����͸� ��¥ �������� ��ȯ
  
  
  SELECT ADD_MONTHS('20230512', 5) FROM DUAL;
  SELECT TRUNC(TO_DATE('20230512','YYYYMMDD') - SYSDATE) FROM DUAL;
  
  EMP���� �Ի� �⵵�� �Ի��� ������� ���� ����ϼ���
  
  GROUP BY,  COUNT(*)
  
  SELECT HIREDATE, COUNT(*)
  FROM EMP
  GROUP BY HIREDATE;
  
  SELECT TO_CHAR(HIREDATE,'YY'), COUNT(*)
  FROM EMP
  GROUP BY TO_CHAR(HIREDATE,'YY')
  ORDER BY 1;
  
  
  