-- day02_select.sql
select * from tab;

SELECT JOB FROM EMP;

--EMP���� ����ϰ� �ִ� ���� ������ ����ϼ���
SELECT DISTINCT JOB, DEPTNO FROM EMP;

--SELECT �ٷ� ������ ���
--DISTINCT �ڿ� ������ �÷����� ��� DISTINCT�� ������ �޴´�.

--MEMBER ���̺��� NAME ������ ����ϱ�
--MEMBER���� ������ �̸��� �� ���� ��µǰ� �ϼ���

SELECT NAME FROM MEMBER;
SELECT DISTINCT NAME FROM MEMBER;

--EMP���� �ߺ� ���� �ʴ� �μ���ȣ�� �����ּ���
-- [����]
--	 1] EMP���̺��� �ߺ����� �ʴ� �μ���ȣ�� ����ϼ���.
    SELECT DISTINCT DEPTNO FROM EMP;     
     
--	 2] MEMBER���̺��� ȸ���� �̸��� ���� ������ �����ּ���.
    SELECT NAME,AGE , JOB FROM MEMBER;    
     SELECT DISTINCT JOB FROM MEMBER;
     
--	 3] CATEGORY ���̺� ����� ��� ������ �����ּ���.
    SELECT * FROM CATEGORY;
    
--	 4] MEMBER���̺��� ȸ���� �̸��� ������ ���ϸ����� �����ֵ�,
--	      ���ϸ����� 13�� ���� ����� "MILE_UP"�̶�� ��Ī����
--	      �Բ� �����ּ���

    SELECT NAME, MILEAGE, MILEAGE*13 MILE_UP FROM MEMBER;

--# �������� ����
--WHERE  ���� �̿�
--SELECT �÷���,... FROM ���̺��
--WHERE ������
--
--[�ǽ�]
	EMP���̺��� �޿��� 3000 �̻��� ����� �����ȣ,�̸�,
	������,�޿��� ����ϼ���.
    
    SELECT EMPNO, ENAME, JOB, SAL
    FROM EMP WHERE SAL >=3000;

EMP���̺��� �������� MANAGER�� �����
	������ �����ȣ,�̸�,����,�޿�,�μ���ȣ�� ����ϼ���.
    
    SELECT EMPNO, ENAME, JOB, SAL, DEPTNO
    FROM EMP WHERE job=upper('manager');
    
    '��'��ü�� ��ҹ��ڸ� �����Ѵ�
    
--    
	EMP���̺��� 1982�� 1��1�� ���Ŀ� �Ի��� ����� 
	�����ȣ,����,����,�޿�,�Ի����ڸ� ����ϼ���.    

    SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
    FROM EMP WHERE HIREDATE >'1982-01-01';


emp���̺��� �޿��� 1300���� 1500������ ����� �̸�,����,�޿�,
	�μ���ȣ�� ����ϼ���.
    -- AND, OR ������
    SELECT ENAME, JOB, SAL, DEPTNO
    FROM EMP WHERE SAL >=1300 AND SAL<=1500;
    
    -- BETWEEN A AND B
    SELECT ENAME, JOB, SAL, DEPTNO
    FROM EMP WHERE SAL BETWEEN 1300 AND 1500;
    
emp���̺��� �����ȣ�� 7902,7788,7566�� ����� �����ȣ,
	�̸�,����,�޿�,�Ի����ڸ� ����ϼ���.
    
    SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
    FROM EMP WHERE EMPNO=7902 OR EMPNO=7788 OR EMPNO=7566;
    
    -- IN (LIST)
    SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
    FROM EMP WHERE EMPNO IN (7902,7788,7566);
    
    
10�� �μ��� �ƴ� ����� �̸�,����,�μ���ȣ�� ����ϼ���

    SELECT ENAME,JOB, DEPTNO
    FROM EMP WHERE DEPTNO!=10 ORDER BY DEPTNO ASC;

    SELECT ENAME,JOB, DEPTNO
    FROM EMP WHERE DEPTNO <> 10;
    
[����]
	emp���̺��� ������ SALESMAN �̰ų� PRESIDENT��
	����� �����ȣ,�̸�,����,�޿��� ����ϼ���.
    
    SELECT EMPNO, ENAME, JOB, SAL
    FROM EMP WHERE JOB='SALESMAN' OR JOB='PRESIDENT';
	
	Ŀ�̼�(COMM)�� 300�̰ų� 500�̰ų� 1400�� ��������� ����ϼ���
	SELECT * FROM EMP
    WHERE COMM IN (300,500,1400);
    
	Ŀ�̼��� 300,500,1400�� �ƴ� ����� ������ ����ϼ���    
    
    SELECT * FROM EMP
    WHERE COMM NOT IN (300,500,1400);
    
    COMM�� ���� ������� ������ �����ּ���
    
    SELECT * FROM EMP
    WHERE COMM =NULL; [X]
    ==> �����Ͱ� �ȳ���
    
    NULL�� ���θ� �Ǵ��Ҷ��� '='�� ����ϸ� �ȵȴ�
    IS NULL/ IS NOT NULL �� �̿��ؾ� �Ѵ�
    
    SELECT * FROM EMP
    WHERE COMM IS NULL;
    
    SELECT * FROM EMP
    WHERE COMM IS NOT NULL;
    
    # LIKE ��
    
    - EMP���̺��� �̸��� S�� ���۵Ǵ� ����� ������ �����ּ���.
    SELECT * FROM EMP WHERE ENAME LIKE 'S%';
    
    SELECT * FROM EMP WHERE ENAME LIKE '%S';
    
    - �̸� �� S�ڰ� ���� ����� ������ �����ּ���.
    
    SELECT * FROM EMP WHERE ENAME LIKE '%S%';
    
    - �̸��� �ι� °�� O�ڰ� ���� ����� ������ �����ּ���.
    SELECT * FROM EMP WHERE ENAME LIKE '_O%';      
    
    [����]
	
	- �� ���̺� ��� ���� �达�� ����� ������ �����ּ���.
    SELECT * FROM MEMBER
    WHERE NAME LIKE '��%';
	
	- �� ���̺� ��� '�λ�'�� ���Ե� ������ �����ּ���.
	SELECT * FROM MEMBER
    WHERE ADDR LIKE '%�λ�%';

	- ī�װ� ���̺� ��� category_code�� 0000�� ���� ��ǰ������ �����ּ���.
    
    SELECT * FROM CATEGORY
    WHERE CATEGORY_CODE LIKE '%0000';
    
    SELECT * FROM CATEGORY
    WHERE CATEGORY_CODE NOT LIKE '%0000';
    
    
    [����]
	- EMP���̺��� �޿��� 1000�̻� 1500���ϰ� �ƴ� ����� ������ �����ּ���
    SELECT * FROM EMP WHERE SAL NOT BETWEEN 1000 AND 1500;

    - EMP���̺��� �̸��� 'S'�ڰ� ���� ���� ����� �̸��� ���
	  ����ϼ���.
     
     SELECT * FROM EMP
     WHERE ENAME NOT LIKE '%S%';  
      
- ������̺��� ������ PRESIDENT�̰� �޿��� 1500�̻��̰ų�
	   ������ SALESMAN�� ����� ���,�̸�,����,�޿��� ����ϼ���.

    SELECT EMPNO,ENAME,JOB,SAL
    FROM EMP
    WHERE JOB='PRESIDENT' AND SAL >=1500 OR JOB='SALESMAN';

	- �� ���̺��� �̸��� ȫ�浿�̸鼭 ������ �л��� ������ 
	    ��� �����ּ���.
        SELECT * FROM MEMBER
        WHERE NAME='ȫ�浿' AND JOB='�л�';

	- �� ���̺��� �̸��� ȫ�浿�̰ų� ������ �л��� ������ 
	��� �����ּ���.
    SELECT * FROM MEMBER
        WHERE NAME='ȫ�浿' OR JOB='�л�';

	- ��ǰ ���̺��� �����簡 S�� �Ǵ� D���̸鼭 
	   �ǸŰ��� 100���� �̸��� ��ǰ ����� �����ּ���.
       
       SELECT * FROM PRODUCTS
       WHERE (COMPANY='�Ｚ' OR COMPANY='���') AND OUTPUT_PRICE <1000000;
       
     *����). �����ڰ� �켱����
	   ��� �� ������ > NOT > AND > OR(���������� ������ �켱������ ����.)
  # ORDER BY
  ���: WGHO���� 
        WHERE > GROUP BY > HAVING > ORDER BY
        
       ������̺��� �Ի����� ������ �����Ͽ� ���,�̸�,����,�޿�,
        �Ի����ڸ� ����ϼ���.
       SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
       FROM EMP ORDER BY HIREDATE;
       -- ����Ʈ ����: ASC
       
       
       �ֱ� �Ի��� ������ ���,�̸�,����,�޿�,�Ի����ڸ� ����ϼ���.
       SELECT EMPNO, ENAME, JOB, SAL, HIREDATE
       FROM EMP ORDER BY HIREDATE DESC;
       
    ��� ���̺��� �μ���ȣ�� ������ �� �μ���ȣ�� ���� ���
	�޿��� ���� ������ �����Ͽ� ���,�̸�,����,�μ���ȣ,�޿���
	����ϼ���.
    
    SELECT EMPNO,ENAME,JOB, DEPTNO,SAL
    FROM EMP
    ORDER BY DEPTNO, SAL DESC;
      
    ��� ���̺��� ù��° ������ �μ���ȣ��, �ι�° ������
	������, ����° ������ �޿��� ���� ������ �����Ͽ�
	���,�̸�,�Ի�����,�μ���ȣ,����,�޿��� ����ϼ���
    
    SELECT *
    FROM EMP ORDER BY DEPTNO, JOB, SAL DESC;
         
    #�پ��� ���� ���
    SELECT EMPNO,ENAME,JOB, SAL, SAL*12 ANNSAL
    FROM EMP ORDER BY SAL*12 DESC;
    
    SELECT EMPNO,ENAME,JOB, SAL, SAL*12 ANNSAL
    FROM EMP ORDER BY ANNSAL ASC;
    
    SELECT EMPNO,ENAME,JOB, SAL, SAL*12+NVL(COMM,0)
    FROM EMP ORDER BY 5 DESC;    
      [����]
	1] ��ǰ ���̺��� �Ǹ� ������ ������ ������� ��ǰ�� �����ؼ� 
	    �����ּ���.
        SELECT PRODUCTS_NAME, OUTPUT_PRICE
        FROM PRODUCTS ORDER BY OUTPUT_PRICE ASC;
        
		
	2] �� ���̺��� ������ �̸��� ������ ������ �����ؼ� �����ּ���.
	      ��, �̸��� ���� ��쿡�� ���̰� ���� ������� �����ּ���.
		..���ĵ� �ڷḦ �ٽ� �ѹ� �����ϴ� ������.
        SELECT NAME, AGE FROM MEMBER
        ORDER BY NAME ASC, AGE DESC;
--------------------------------------------------------       

	 3] �� ���̺��� ������ ������ �� ������ ���� ����� ���� 
	     ���� ������� �����ּ���.
         -- GROUP BY, COUNT()�Լ�
         SELECT JOB, COUNT(*)
         FROM MEMBER
         GROUP BY JOB
         ORDER BY 2 DESC;
         --ORDER BY COUNT(*) DESC;

	 4]	��ǰ���̺��� ���޾�ü��(EP_CODE_FK)�� ����ǸŰ� AVG(�÷���)�� ���ϵ� 
		����ǸŰ� ������������ �����ּ���.
        
		
	 5] ��ǰ ���̺��� ��ۺ��� ������������ �����ϵ�, 
	    ���� ��ۺ� �ִ� ��쿡��
		���ϸ����� ������������ �����Ͽ� �����ּ���.
      