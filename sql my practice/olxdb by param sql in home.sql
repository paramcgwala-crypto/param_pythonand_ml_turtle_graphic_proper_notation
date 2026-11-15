create database olxdb;
use olxdb

create table olxdb1 (
    olxdb1ID int primary key,
	olxdb1name varchar(100),
	olxdbnumber varchar(200),
	olxemail varchar (50),
	);

create table olxdb2 (
    olxdb2ID int primary key,
	olxdb2name varchar(100),
	olxdb2number varchar(100),
	olxdb2email varchar (100),
	olxdb1ID int,
	foreign key (olxdb1ID) REFERENCES olxdb1(olxdb1ID),
	);

select * from olxdb1

select * from olxdb2

insert into olxdb1 (olxdb1ID,olxdb1name,olxdbnumber,olxemail)
values (1,'param','9874589654','paramcgwala2gmail.com'),
(2,'shivam','5874859654','pswaheguru690@gmail.com'),
(3,'shubh','8574587896','paramwaheguru@gmail.com');
insert into olxdb2 (olxdb2ID,olxdb2name,olxdb2number,olxdb2email)
values (1,'sidhu','7485241545','sidhu@gmail.com'),
(2,'shubhdeepsingh','7451454120','shubhdeep@gmailcom'),
(3,'ranjit bawa','5241526301','ranjitbawa@gmail.com');

alter  table olxdb1
add  joiningdate4 date 

update olxdb1
set joiningdate = '03-05-2024'
Where olxdb1ID = 1

update olxdb1
set joiningdate = '03-05-2020'
Where olxdb1ID = 2

update olxdb1
set joiningdate = '03-05-2015'
Where olxdb1ID = 3

alter table olxdb1
add salary bigint 

update olxdb1
set salary = 100000
where olxdb1ID = 1

update olxdb1
set salary = 1000000000
where olxdb1ID = 2

update olxdb1
set salary = 100000000
where olxdb1ID = 3








---- views ko  revision kr rahe hai 

create view olx1 as 
select o1.olxdb1ID ,
       o1.olxdb1name,
	   o1.olxdbnumber

from olxdb1 as o1
left join olxdb2 as o2 
on o1.olxdb1ID = o2.olxdb1ID
select * from olx1

---- ab hum dekhenge kiviews ko hume kasie dekhenge jo humne banaya hai 

select * from olxdb1

----- views ke sath join ka use 

create view olxcom as 
select  o1.olxdb1ID,
        o1.olxdb1name,
		o2.olxdb2ID,
		o2.olxdb2email



from olxdb1 as o1
left join olxdb2 as o2 
on o1.olxdb1ID = o2.olxdb2ID

--- ye humne apne olxcom view ko dekhnea kasie hai ye dekha hai 
select * from olxcom



------ stored procedure 

create procedure sp_olx 
as 
begin 
select  olxdb1ID,
        olxdb1name,
		olxdbnumber

from olxdb1
end ;

exec sp_olx 


----- stored procrdure practice 2 

create procedure sp_olxdb 
as 
begin 

select olxdb1ID,
       olxdb1name

from olxdb1

end;

---- ye execute krke bhi dekha hu mqai ye dekho bhai log 

exec sp_olxdb

---- stored procedure with the parameter 

create procedure sp_olxuser
@olxdb1ID int 
as 
begin 
      select  olxdb1ID ,	         
	          olxdb1name 
	  
	  from olxdb1
	  where olxdb1ID = @olxdb1ID


end

exec sp_olxuser 70;


----- stored procedure with parameter practice no 2 

create procedure  olx_2
@olxdb1ID int ,
@olxdb1name varchar(50)

as
begin 
 
    select olxdb1 = @olxdb1ID,
	       olxdb1name = @olxdb1name
		   
	from olxdb1

end 


-----STORED PROCEDURE  PRACTICE 3 

CREATE PROCEDURE sp_olx_db 
@olxdbnumber bigint,
@olxemail varchar(50)

as 
begin 

     select olxdbnumber = @olxdbnumber,
	        olxemail    = @olxemail

From olxdb1 
End 

Exec sp_olx_db 1098765432,'Paramcgwal@gmail.com'

---- multiply rows wala stored procedure practice krte hai 

Create Procedure SP_OLX_DB1

@olxdb1ID int,
@olxdb1name varchar(100)

As
Begin

     select * 
	 From olxdb1 
	 Where olxdb1ID = @olxdb1ID
	  or   olxdb1name = @olxdb1name 

end 

exec SP_OLX_DB1 1,'paramcgwala'
exec SP_OLX_DB1 2,'bajwa s '

--- ye execute kr ke bhi dekh liya hu 
exec SP_OLX_DB1 1,'Paramcgwaka'

exec SP_OLX_DB1 2,'karan aujla'

exec SP_OLX_DB1 3,'karan randhawa'

exec SP_OLX_DB1 4,'Shubh'

----- stored procedure with parameter practie question no. 4 

create Procedure SP_OLXUSER_DB3
@olxdbnumber bigint,
@olxdb1name varchar(100),
@olxemail varchar(100)

as 
begin 

     select * 
	 From olxdb1
	 Where olxdbnumber = @olxdbnumber
	 or  olxdb1name  = @olxdb1name
	 Or olxemail     = @olxemail

end

-- ab ececute kre dekhuga isi wale ques ke anser ko

exec SP_OLXUSER_DB3 1987129087,'paramcgwala','paramcgwala@gmail.com'
exec SP_OLXUSER_DB3 8976432763,'karanaujla','karanaujla@gmailcom'
exec SP_OLXUSER_DB3 2145879532,'karan randhawa','karanrandwa@gmail.com'


----- stored procedure practice question no, 5 HUME YAHA PARAMETER BHI SHOW KRNA HAAI 

create procedure SP_OLX_CUSTOMER
@olxdb1ID int,
@olxdb1name varchar(100),
@olxemail varchar(100)

    as 
	    begin 
		    select * 
			From olxdb1
			where olxdb1ID = @olxdb1ID
			and olxdb1name = @olxdb1name
			and olxemail = @olxdb1name

    End 

	exec SP_OLX_CUSTOMER 1,'Parmeet Singh','ram'

---- ab mai ques 5 ke ans ko execute krke dekhunga 

exec SP_OLX_CUSTOMER 1,'Paramcgwala','ParamCgWala@gmail.com'

---- stored procedure practice question no.6 with parameter 

Create Procedure SP_OXBESTCUTOMER_DB1
@olxdb1ID int,
@OLXdb1name varchar(50),
@olxemail varchar(100)

    as 
	   begin 
	       select * from olxdb1
		   where olxdb1ID = @olxdb1ID
		   or    olxdb1name = @olxdb1name
		   or    olxemail   = @olxemail

end;
--- ye humne execute krke dekha hai 
exec SP_OXBESTCUTOMER_DB1 1,'Paramcgwala','Paramcgwala@gmail.com'

--- views ka bhi practice kr lete hai 

create view  vw_olxuser1 
as 

    select olxdb1ID,
	       olxdb1name,
		   olxemail

     From olxdb1

select  * from vw_olxuser1

----- views with case statement 

Create view vw_bestolxuser1 
as

      select olxdb1ID,
	         olxdb1name,
			 olxdbnumber,
			 olxemail,
      
	  case

	  When  olxdb1ID > 1  Then 'High level'
	  when  olxdb1ID >2 Then 'low level'
	  else 'bakwaas ID wala level'

end as good_bad_levels
From olxdb1;

select * from vw_bestolxuser1 

---- view with statement 

create view olxbestuser2
as 


    select olxdb1ID,
	       olxdb1name,
		   olxdbnumber,
		   olxemail,

	case 
	    When olxdb1ID > 2 Then 'high level banda hai ye '
		when olxdb1ID <1 then 'low lvel banda hai ye'
		else 'chutiya banda'

end as IDlevel 
from olxdb1

select * from olxbestuser2

---- stored procdure with case statement and parameter 

create procedure  ola1
@olxdb1ID int,
@olxdb1name varchar(100)
  
  As
      Begin 
	      Select olxdbID = @olxdb1ID,
		         olxdb1name = @OLXdb1name,   --- kye humne parameter lagaye hai 

		  case 
		      when @olxdb1ID >= 1  Then 'ceo'
			  when @olxdb1ID >=2 Then 'cmo'
			  when @olxdb1ID >=3 Then 'cfo'
			  else 'fresher'
			  end as emloyeedata 
from olxdb1
end 


exec ola1 1,'Paramcgwala'
exec ola1 2,'harshita soni'
exec otal 3 , 'otaal'


------  stored procedeure with parameter and case 

create procedure olaa1 

@olxdb1ID int ,
@olxdb1name varchar(100),
@joiningdate date
    As 
	   Begin 

	   select  olxdb1ID = @olxdb1ID,  -- ye humne parameter lagaya hai
	           olxdb1name = @olxdb1name,
               joiningdate = @joiningdate,

		   Datediff ( year,@joiningdate,GETDATE()) as experiences,



	   case 
	       When datediff(year,@joiningdate,GETDATE())  >= 10 Then 'Ceo'
		   when datediff(year,@joiningdate,GETDATE()) >= 5 Then 'cmo'
		   When datediff(year,@joiningdate,GETDATE()) >= 2 Then 'Cmo'
           else 'Fresher'

		   end as experiencesTracker 

End 

exec olaa1 1,'Paramcgwala','03/05/2005'
exec olaa1 2,'cgwala','05/03/2019'
exec olaa1 3,'otaal','05/04/2015'
exec olaa1 4,'shubh','03/02/2015'

----- views with join 

create view olax as

select  o1.olxdb1name,02.olxdbnumber

from olxdb1 as o1

left join  olxdb2 as o2 


on o1.olxdb1ID = o2.olxdb2ID

select * from olax


---- views with right join and datediff and case statement 

create view  olxm1 as 

select  o1.olxdb1ID,
        o1.olxdb1name,
		o2.olxdb2ID,
		o1.joiningdate,

	
		
		Case 
             When datediff(YEAR,joiningdate,GETDATE()) > 5  Then 'High Experiences make ceo'
			 When datediff(year,joiningdate,Getdate()) between  2 and 3 Then 'Mid level  experiences'
			 When datediff(year,joiningdate,GETDATE()) > 2 Then 'Low experiences'
			 else 'Fresher'

		 End as Experiences_Tracker_Of_Employee

From olxdb1 as o1 
inner join  olxdb2 as o2 
on o1.olxdb1name = o2.olxdb2name 

End

Select * from olxm1 

select * from olxdb2


----- stored Procdedure and with the parameter and case and datediff 

Create procedure olxm2 
@olxdb1ID int,
@olxdb1name varchar(100),
@olxemail varchar(50),
@joiningdate date

    AS
	    Begin
		    Select  olxdb1ID = @olxdb1ID,
			        olxdb1name = @olxdb1name,
					olxemail   = @olxemail,
					joiningdate = @joiningdate,
					
					Datediff(year,joiningdate,Getdate()),
			 case 

			     When Datediff (year,joiningdate,GETDATE()) >  10 Then 'Seo'
				 When Datediff (year,joiningdate,GETDATE()) between 4 and  5 Then 'Cfo'
				 When Datediff (YEAR,joiningdate,GETDATE()) < 2  Then 'Cmo'
				 else 'Fresher cmo'
                
				end as total


From olxdb1 
End 


----- index 

create nonclustered index olx1@
on olxdb1(olxdb1ID)

select * from olxdb1
---- drop index 

Drop  index olx1@
on olxdb1







----- expereince level of enginwer nd  salary status nikal raha hu

sele



















Select * from olxdb1













----- views ki practice 

select * from olxdb1

create view olt369 as 
select  
    o1.olxdb1ID,
	o1.olxdb1name,
	o1.olxdbnumber,
	o2.olxdb2ID


from olxdb1 as o1 
right join  olxdb2 as o2
on o1.olxdb1ID = o2.olxdb2ID
end 

----- stored procedure 

create procedure olxdbdbddd
@olxdb1ID int ,
@olxdb1name varchar(50),
@olxdbnumber bigint,
@olxmemail varchar(100),
@joiningdate date,
@salary bigint
  as 
      begin  
	  
	      select
		      olxdb1ID = @olxdb1ID,
			  olxdb1name = @olxdb1name,
			  olxdbnumber = @olxdbnumber,
			  joiningdate = @joiningdate,
			  salary = @salary,

		   datediff(year,@joiningdate,Getdate()) as expirences,


		   case 
		       When datediff(year,@joiningdate,Getdate()) > 10  Then ' senior software engineer'
			   When datediff(year,@joiningdate,Getdate()) between 2 and 5  Then  'mid level engineer'
			   Else 'Fresher'

			   End as total_year_Experiences_of_engineer,

			case 
			    when  @salary > 2000000 then 'highly earn employee'
				when  @salary > 20000 then 'you are in mid level'
				else 'you are  in internship'


			    End as Find_max_salary_Employees,





CREATE PROCEDURE olxdbdb 
@olxdb1ID int,
@olxdb1name varchar(50),
@olxdbnumber bigint,
@olxmemail varchar(100),
@joiningdate date,
@salary bigint

AS
BEGIN

SELECT
    olxdb1ID = @olxdb1ID,
    olxdb1name = @olxdb1name,
    olxdbnumber = @olxdbnumber,
    joiningdate = @joiningdate,
    salary = @salary,

    DATEDIFF(year,@joiningdate,GETDATE()) AS expirences,


    CASE 
        WHEN DATEDIFF(year,@joiningdate,GETDATE()) > 10  
            THEN 'Senior software engineer'

        WHEN DATEDIFF(year,@joiningdate,GETDATE()) BETWEEN 2 AND 5  
            THEN 'Mid level engineer'

        ELSE 'Fresher'
    END AS total_year_Experiences_of_engineer,


    CASE 
        WHEN @salary > 2000000 
            THEN 'Highly earn employee'

        WHEN @salary > 20000 
            THEN 'You are in mid level'

        ELSE 'You are in internship'

    END AS Find_max_salary_Employees;


			
			       
		   



    

	

	




    















































































































------ view  with joins annsd case and getdate 

create view olax112
as 

    Select  o1.olxdb1ID , 
	        o2.olxdb2ID,
			o2.olxdb2number,
	        o1.joiningdate,

		datediff(DAY,o1.joiningdate,Getdate()) as totaldays,

	Case 
	    When datediff(day,o1.joiningdate,GETDATE()) > 3 Then 'High Expereiences'
		When datediff(day,o1.joiningdate,GETDATE())  between  1 and 2 Then 'Mid Level Expereiences'
		When datediff(day,o1.joiningdate,GETDATE()) between 2 and 3  Then 'Inter mediate level'
		else 'Fresher'
		end as total 

From olxdb1 as o1 
inner join olxdb2 as o2 
on o1.olxdb1ID = o2.olxdb1ID

select * from  olax112






	

------- storeed procedure with parameter and case and datediff and joins

create procedure sp_olax1 

@olxdb1ID int,
@olxdb1name varchar(50),
@olxdbnumber bigint,
@olxemail varchar(100),
@joiningdate date
    As 
	    Begin 

		        
		
		   select 
		          o1.olxdb1ID =  @olxdb1ID,
			      o1.olxdb1name = @olxdb1name,
				  o1.olxdbnumber = @olxdbnumber,
				  o1.olxemail    = @olxemail,
				  o1.joiningdate = @joiningdate,

           Case
		       When datediff(year,@joiningdate,getdate()) > 3 Then 'Ceo of the company'
			   when datediff( year,@joiningdate,getdate()) between 2 and 3 Then 'cmo of the company'
			   When datediff(year ,@joiningdate,getdate()) > 1 Then 'low Expereiences'
			   else 'Fresher and Intern'
			   end as total 
			   

From olxdb1 as o1
left join olcdb2 as o2 
on o1.olxdb1ID = o2.olxdb2ID 
End
------ stored prouceder with parammetreer and  

create procedure olax15
		    
@olxdb1ID int ,
@olxdb1name varchar(100),
@olxdbnumber bigint,
@olxemail varchar(100)

    as 
	    Begin 
		    Select
                   olxdb1ID = @olxdb1ID,
			       olxdb1name = @olxdb1name,
				   olxdbnumber = @olxdbnumber,
				   olxemail = @olxemail,

			case 
			    When olxdb1ID > 1  Then 'high experiences'
				when olxdb1ID  between  2 and 3  Then 'Mid level experiences'
				When olxdb1ID <3 Then 'Need you to more Practice'
				Else 'You are in fresher condition'

				end as total_ID_Of_employee_experiences

From olxdb1
		    
End 

exec olax15 1,'Paramcgwala',7451425145,'Paramcgwala@gmail.com'							   	 

----- stored procedure with insert  that was a part of crud operatiostoredn and with Parameter 

create procedure sp_olx_21

@olxdb1ID int,
@olxdb1name varchar(50),
@olxdbnumber bigint,
@olxemail varchar(100)

       As
	      Begin 
		      
			  insert into olxdb1
			  ( 
			    olxdb1ID,
			    olxdb1name,
				olxdbnumber,
				olxemail
				)

			 Values 
			 (
			  @olxdb1ID,
			  @olxdb1name,
			  @olxdbnumber,
			  @olxemail
			  )

End 

exec  sp_olx_21 8,'cgwala',74512598354,'Pscgwala@gmail.com'


------ humne isme do baar case ka use krna sikha hai and with joins 

select 
    o1.olxdb1ID ,
	o1.olxdb1name,
	o1.olxdbnumber,
	o1.olxemail,
	o1.salary,
	o1.joiningdate,
     
	  datediff(year,joiningdate,Getdate()),

	case 
	
	    When salary > 5000000 Then 'high stauts income '
		When salary between 500000 and 600000 Then 'mid level income'
		else 'you are in poverty line'

      End as salary_Status,

	 case

	     When datediff(year,joiningdate,getdate()) > 10 then 'ceo'
		 When datediff(year,joiningdate,getdate()) between 2 and 5 Then 'cmo'
		 else 'Fresher'

	 End as ExoeriencesTracker


from olxdb1 as o1
left join olxdb2 as o2 
on o1.olxdb1ID = o2.olxdb1ID

----- Transaction practice 

Begin Transaction;

update olxdb1
set salary = salary - 10000
Where olxdb1ID = 2;

Update olxdb1
set salary = salary + 100000
Where olxdb1ID = 1;

Commit Transaction ;

begin transaction;

                                                                  

------- TRANSACTION BASIC tRANSACTION  yaha humne commit transaction sikha hai matlab hune jisko commit krdiya th roll back ahi ho sakta yani comitment 

BEGIN TRANSACTION;

Update olxdb1
set salary = salary + 10000000
Where olxdb1ID = 1 

update olxdb1
set salary = salary + 1000000
where olxdb1ID = 2

commit Transaction;

select * From olxdb1

----- abb hum Transaction mai rollback sikhnege matab mistagke ko sudhrana ka mujka milta hai but comiit mai cmit ho jata hai o rol back ok 

Begin Transaction ;

Update olxdb1
set salary = salary - 10000000
Where olxdb1ID = 2

Rollback Transaction;
Select * from olxdb1

----windows fuctions 
select
    olxdb1ID, 
	olxdb1name,
	salary,
	joiningdate,
	sum(Salary) over(partition by olxdb1name order by salary  desc ) as total_salary

	from olxdb1

---- Types of windows Functions 
---category  OF FUNCTION  
----Ranking Row_number ,Rank(), Dense_Rank(), Ntile() hume  windows fucnction ki jarurat islye padhi thi kyuki group by  gruop toh kr dedta hai  but windwsa fuction mai  calulation bhi deata hai and group hi krta hai  jaise ntile 
----Aggrergate  sum(),avg(),count(),min,max 
----Analytical lead(), LAG(),First_value(), Last_value 

--- partition by practiuce kr raha hu 

select 
    olxdb1name,
	olxdb1ID,
	salary,

    sum(salary) over ( order by olxdb1ID asc  ) as  partition_orderby -- AS  matlab hota hai alias  matlab agar koi chij ko jaise show krna hai waisa show kr sakte hai  lik param  as p ya lamborgin as l
	from olxdb1

--- windows function ke row_number ka use krna sikha hu 

select 
    olxdb1name,
	olxdbnumber,
	olxemail,
	salary,

	sum(salary) over ( order by salary desc ) as Row_Numbers 
	From olxdb1

---- Rank ( ye skip krta hai )

select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	salary,
	Rank() over( order by salary ) as rankline 
	from olxdb1


---- Dense_Rank() --- no skip counting ---- ranking properly

 
---- Agrregate 

select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	salary,

    Avg(olxdb1ID) over (partition by olxdb1name) as avg_olxdb,
	max(salary ) over (partition by olxdb1name) as max_olxdb,
    min(olxdb1ID)over (partition by olxdb1name) as min_olxdb,
	sum(salary ) over(partition by olxdb1name) as max_olxdb,
	count(olxdb1ID) over(partition by olxdb1ID) as count_olxdb




	

---- windows fucntion 

select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	olxemail,

	sum(salary) over(Partition by olxemail 
	order by olxdb1name desc) as wf
	from olxdb1

---- lead ka practice koya hu ye leading  ya next value yani aghe  ki jo lead kr raha usko dikhata hai 

select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	olxemail,
	salary,

   lead(salary ) over(order  by salary ) as olxpartition 
   from olxdb1

   ---- lag ka use kiya hu isme  ye last ki value  dikhata hai laging value 

select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	olxemail,
	salary,

   lag(olxdb1name) over(order by salary) as olxpartition 
   from olxdb1

   ---- patititon by and order by  dono windows function ke sath use kiye hai 

   
select 
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	olxemail,
	salary,

   lag(olxdb1name) over(partition by olxdb1name order by salary desc) as olxpartition 
   from olxdb1

----  over without not be used without by in ranking and analyatical windos fucntion 

   select ROW_NUMBER() over (order by salary) as row_num,salary,olxemail,
   lead(olxdb1name) over(order by salary) as num_row
   from olxdb1

   select * From olxdb1
   select * from olxdb2
   
---- partition by and salary dono ke use krna sikhuga abb

select
    olxdb1ID,
	olxdb1name,
	olxdbnumber,
	olxemail,
	joiningdate,
	salary,

	FIRST_VALUE(salary) 
	over (Partition by olxemail
	order by salary asc) AS lowsalary,
	FIRST_VALUE(salary)
	over (partition by olxdb1name
	order by salary desc) As Higestsalary
    From olxdb1
	
	

---- Dense Rank  practice question and answer in short form 

select 
     olxdb1ID,
	 olxdb1name,
	 olxdbnumber,
	 salary,

	 
	DENSE_RANK() over ( order by salary  desc) as DenseRankpractice 
	from olxdb1;

----
select 
     olxdb1ID,
	 olxdb1name,
     olxdbnumber,
	 salary,
sum(salary) over(Partition by olxdbnumber order by olxdb1ID) as cumulative_salary
From olxdb1


--- rows between

select 
     olxdb1ID,
	 olxdb1name,
     olxdbnumber,
	 salary,
Sum(salary) over( order by salary Desc  Rows between unbounded preceding and current row ) as cumulativesalary  ---- cumulative salary  matlab hota hai running salary 
from olxdb1

---- range  in windows fucntion 

select 
     olxdb1ID,
	 olxdb1name,
     olxdbnumber,
	 salary,
Sum(salary) over( order by salary Desc  Range between unbounded preceding and current row ) as cumulativesalary    -- Cumulative ka matlab hot ahai  Salary ka matlab hota hai ki running salary  
from olxdb1

---- Rows between  - start row and end row ko dekhta hai 
--- 1.current row - 
--- 2.unbounded preceding = current row se sare opar wale 
--- 3 unbounded following - currentty row se pure  next wale 
--- 4. n precedin and  n following 

---- calculative 3 rows moving avg --- imp question in windows

select 
     olxdb1ID,
	 olxdb1name,
     olxdbnumber,
	 joiningdate,
	 salary,
	 Avg(salary)  over (order by joiningdate
	 Rows between 1 preceding and 1 following ) 
	 as Rowavg 
	 from olxdb1

--- same ques with sum 

select 
     olxdb1ID,
	 olxdb1name,
     olxdbnumber,
	 joiningdate,
	 salary,
	 sum(salary)  over (order by joiningdate
	 Rows between 1 preceding and 1 following ) 
	 as Rowavg 
	 from olxdb1


---- stored procedure revision 
create procedure  olxc1 
@olxdb1ID int ,
@olxdb1name varchar (100) ,
@olxdbnumber bigint ,
@olxemail varchar(100),
@joiningdate date,
@salary bigint

    as 
	    Begin
		    select olxdb1ID = @olxdb1ID,
			       olxdb1name = @olxdb1name,
				   olxdbnumber = @olxdbnumber,
				   olxemail = @olxemail,
				   joiningdate = @joiningdate,
				   salary  = @salary,

			 datediff(year,@joiningdate,getdate()),

			CASE 
			    when datediff(year,@joiningdate,getdate()) > 20  Then 'Then you are ceo in google '
				When datediff(year,@joiningdate,getdate()) > 5 Then 'Then you are in mid level'
				else 'you are fresher in the field'
     
	         End as Experiences_Tracker_and_joiningdate,

			case
			    When @olxdb1ID > 1 Then 'you are Great'
				When @olxdb1ID > 2 Then 'You are in midlevel'
				else 'You are Fresher'

			End as ID_Tracker 

from olxdb1
End 

exec olxc1 1,'sandhuparam',7485748596,'Paramcgwalas@gmail.com','2-3-2024',75155454214

----- find the cumulative sales day by day 

select
    Olxdb1ID,
	salary,
	sum(salary) over (order by salary
	Rows between unbounded preceding and current row  ) 
	as cumulativesales 

From olxdb1

---- 

select
    Olxdb1ID,
	salary,
	sum (salary) over (order by salary 
	Rows between unbounded preceding and unbounded following) as Totalsalary  
	from olxdb1

----


select
    Olxdb1ID,
	salary,
	sum (salary) over (order by salary 
	Rows between 5 preceding and current row ) as Totalsalary  
	from olxdb1


----- expected current day + previous 2 days average 
---- calculate future 2 days Expected sales Total
---- use case: Forecasting/ upcoming workload 
--- month /day contribution  percentage 
----Business question : How much percentage eacg sale contributes to total sales.

---- 

select
    Olxdb1ID,
	salary,
	sum (salary) over (order by salary desc rows between 
	unbounded preceding and unbounded following ) as totalsalary,
	
	(salary * 100 )/ sum(salary)
	over (order by olxdb1ID desc 
	rows between unbounded preceding 
	and unbounded following)
	as salarypercentagte 
	from olxdb1

---- lowest salary 

select 
    olxdb1ID,
	salary,
min(salary) over (order by olxdb1ID
Rows between unbounded preceding  and unbounded following  )
as  cumulativesalary -- running salary 
from olxdb1;

-- Highest salary with the use of rows and unbounded and preceding and following 

select 
    olxdb1ID,
	salary,
max(salary) over (order by olxdb1ID
Rows between unbounded preceding  and unbounded following  )
as  cumulativesalary 
from olxdb1;

--- 

select 
    olxdb1ID,
	salary,
Avg (salary) over (order by olxdb1ID
Rows between unbounded preceding  and current row )
as  cumulativesalary_2
from olxdb1;

---


select 
    olxdb1ID,
	salary,
count (salary) over (order by olxdb1ID
Rows between unbounded preceding  and current row )
as  cumulativesalary_2
from olxdb1;

------  ntile with order by  and ntile kiya krta hai ntile group krta  ya group ko equal mai divide krta hai d

select 
    olxdb1ID,
	salary,
	olxdb1name,
	
	Ntile(5) over(order by salary
	) from olxdb1

---- ntile with partition by and order by  (ntile  equal groups mai divide krta hai) 

select 
    olxdb1ID,
	salary,
	olxdb1name,
	
	Ntile(2) over(partition by olxdb1ID order by salary desc 
	) from olxdb1

---- top 25 percent  paid employees in department 


select 
    olxdb1ID,
	salary,
	olxdb1name,

	ntile(4) over (
	order by salary desc) as top_salary 

	From olxdb1 
	where salary > 1000000


----- ntile  order with ascending oder  and partition by 

select 
    olxdb1ID,
	salary,
	olxdb1name,

	ntile(4) over (Partition by olxdb1name 
	order by salary asc) as top_salary 

	From olxdb1 
	where salary > 1000000

------ find  top 25 percent  highest paid  employesss
--- answer mai sub qery ka use bhi huva hai

select* from ( 
select 
    olxdb1ID,
	salary,
	olxdb1name,
	ntile (4)

	over (order by salary desc )as groupin
	from olxdb1)
	as salary_group
	where groupin = 1

--- Q3 Divide  employees into 2 categories : Group 1 - High salary Group  2 - low salary 
ans 

select 
    olxdb1ID,
	salary,
	olxdb1name,
	ntile (2)

	over (order by salary desc ) as Salary_Group
	from olxdb1 
	
	--- Q4 Find highest salary group in every department'


select *  from (Select *,Row_number() over (PArtition by olxdb1ID order by salary desc ) as run 
From olxdb1) X where run = 1 ;














------- CTE (Common Table Exoression )

With highestSalary as
(select 
    olxdb1ID,
	salary,
	olxdb1name from olxdb1)
	SELECT * FROM highestSalary;


------ cte q2

with highsalary38 as 

(select 
    olxdb1ID,
	salary,
	olxdb1name,

	AVG(salary) over (order by salary asc) as group9   from olxdb1 )

	 select * from highsalary38 where group9 = 1


----

with salaryRnk as 
(select 
    olxdb1ID,
	salary,
	olxdb1name,

	DENSE_RANK() over (order by salary ) as rnk  from  olxdb1)

select * from salaryRnk where rnk  = 2
	
---- index  ye ek clustered index hai 

create index  olx21 
on olxdb1 (olxdb1ID)


select * from olxdb1 where olxdb1ID = 1 


select * from olxdb1 where olxdb1name = 'param'

------  non clustered index practice 

create nonclustered index olx22 on olxdb1(olxdb1name)


------ transaction 

Begin Transaction 

update olxdb1 
set salary = salary +1000000
where olxdb1ID = 1
commit 

----

Begin Transaction 
update olxdb1
set salary =  salary -1000000
where olxdb1ID = 2
Rollback  

----

select olxdb1ID,sum(salary) as total_salary from olxdb1 group by olxdb1ID

---
select olxdb1ID,olxdb1name , sum(salary) as total_salary from olxdb1 group by olxdb1ID

--- procedural programing 
--- variable

declare @varbname int;
set @varbname  = 13;
select @varbname as variableTest;

---- if  ka use krke and sath mai not exists hoga  toh kiya hoga bataye hai 
select olxdb1ID,olxdb1name from olxdb1 where olxdb1ID = 1

if not exists (select olxdb1ID,olxdb1name from olxdb1 where olxdb1ID = 1) 
begin
select 'ye banda trillionire hai '
end

else 
begin 
print'then you are rich in world'
end

--- if ke andr exists 
if  exists (select olxdb1ID,olxdb1name from olxdb1 where olxdb1ID = 1) 
begin
select 'ye banda trillionire hai '
end

else 
begin 
print'then you are rich in world'
end


---- isk hum prodedural programing  bolte hai or  variable  ka use kiya hu and variable kiya hota hai jo vary kare 


declare @marks int 
set @marks = 20;

if (@marks > 80 )
begin
Print 'I am muti trillinore'
end 
else 
Print 'I am usniversal trillinore hu'

---- while loop (isme maine 1 se leke 100 tak ka ek loop chalaya hai )


declare @count  int;
set @count = 1;

while @count <=100
    begin 
	    print @count;
		set @count = @count + 1
		end

-----
 
 select getdate() ----builtin fuction 
 ----- user defined functions

 create  function calculatesalary(@salary int)
     returns int 
	 as 
	 begin 
	     return @salary  *10/100;
		 end 
select  dbo.calculatesalary(1000000)  ---- full form of dbo  = database owner ko hum short mai dbo bhi bolte hai 

----TRY Catch Block
--- Error Handling  (matab try ko hum error handling ke liy bhi use krte hai )

Begin try 
     select 10/5
end try 


Begin Catch 
    select 'Try  I am  The trillinore o universe'
end catch 


---- 
select * from olxdb1 order by  salary offset 3 rows  fetch next 5 rows only 


select o1.o1xemail,o2.olxdb2name
from olxdb1 as o1 
inner join olxdb2 as o2 
on o1.olxdb1ID = o2.olxdb2ID


-----= sub query practuice 

select avg(salary) from olxdb1 where salary > (select avg(salary) from olxdb1)


-----

select * from olxdb1 where @olxdb1name in (select olxdbemail from olxdb1)


----- corelated subquery 

select avg(salary) from olxdb1 where salary > (select avg(salary) from olxdb1 where olxdb1ID = 3 )



----- acid property 
 --atomicity 
 -- consistancy 
 -- isolation 
 --- durability 


 select  10/1

 End  Try 
 BEgin Catch 
 Select 

 ERROR_MESSAGE(),
 Error_line(),
 Error_number(),
 Error_Procedure()

 End catch 

 ----
 set statistics  time on;
 select * from olxdb1  where  olxdb1ID = 7                 ----- io on 
 set  statistics  time off;


create index idchekit on olxdb1(olxdb1name)




















----



select top 5 * from olxdb1






    








































     











select* from olxdb1


















 




			     
























	       

	  




















select * from olxdb1




















select * from olxdb1
































select * from olxdb1









select * from olxdb1

----- group by and having 

select olxdb1ID,count(*)
from olxdb1
group by olxdb1ID
having count(*) > 2











