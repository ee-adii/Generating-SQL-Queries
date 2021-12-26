----------------------<<<<Sub-queries and Nested SELECTs>>>>-----------------------

----QUERY-1--GET ALL THE EMPLOYEES HAVING SALARY BELOW AVG SALARY--

SELECT F_NAME , L_NAME ,SALARY , EMP_ID FROM EMPLOYEES
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMPLOYEES);

----QUERY-2--GET all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row--

SELECT F_NAME ,L_NAME ,EMP_ID ,SALARY, 
(SELECT MAX(SALARY) AS MAX_SALARY 
 FROM EMPLOYEES)
FROM EMPLOYEES;

----QUERY-3--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table--

SELECT * FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT 
                 FROM JOBS);

----QUERY-4--GET THE RECORD OF EMPLOYEES HAVING JOB TITLE "Jr. Designer"--

SELECT * FROM EMPLOYEES
WHERE JOB_ID IN (SELECT JOB_IDENT 
                 FROM JOBS
                 WHERE JOB_TITLE = "Jr. Designer");

----QUERY-5--Retrieve JOB information and list of employees who earn more than $70,000--      
           
SELECT * FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES 
                    WHERE SALARY > 70000);   
                    
----QUERY-6--Retrieve JOB information and list of employees whose birth year is after 1976--

SELECT * FROM JOBS
WHERE JOB_IDENT IN (SELECT JOB_ID
                    FROM EMPLOYEES
                    WHERE YEAR(B_DATE) > 1976);   
                    
----QUERY-7--Retrieve JOB information and list of female employees whose birth year is after 1976--

SELECT * FROM JOBS 
WHERE JOB_IDENT IN (SELECT JOB_ID 
                    FROM EMPLOYEES 
                    WHERE SEX = 'F' AND YEAR(B_DATE)>1976);
                  
----QUERY-8--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables--

SELECT * FROM EMPLOYEES E , JOBS J;

----QUERY-9--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table--

SELECT * FROM EMPLOYEES E , JOBS J
WHERE E.JOB_ID = JOB_IDENT ;

----QUERY-10--Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title--

SELECT F_NAME , L_NAME , JOB_TITLE 
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = JOB_IDENT;

                    
                 
                 
                 
                 
                 