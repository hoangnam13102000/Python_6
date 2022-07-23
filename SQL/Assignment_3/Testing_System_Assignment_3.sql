drop database if exists QLthidau;
create database if not exists QLthidau;
use QLthidau;
create table  Department(DepartmentID tinyint primary key AUTO_INCREMENT, 
DepartmentName varchar(50) not null );
-- add data
insert Department (DepartmentID,DepartmentName) values 
(1,'Sale'),
(2,'Marketing'),
(3,'Nhân sự'),
(4,'Bảo vệ'),
(5,'Tài chính');
create table Position (PositionID smallint primary key AUTO_INCREMENT, 
PositionName ENUM('DEV','TEST','SCUM MASTER','PM'));
-- add data
insert Position (PositionID,PositionName) values 
(1,'DEV'),
(2,'TEST'),
(3,'TEST'),
(4,'SCUM MASTER'),
(5,'PM');
create table Account(AccountID smallint primary key AUTO_INCREMENT, 
Email  varchar(50) unique key, 
Username varchar(50) unique key, 
FullName varchar(50) Not NULL,
DepartmentID tinyint not null,
PositionID smallint not null, 
CreateDate Date, 
FOREIGN KEY (DepartmentID)
REFERENCES Department (DepartmentID),
FOREIGN KEY (PositionID)
REFERENCES Position (PositionID)
);
-- add data
insert Account (AccountID,Email,Username,FullName,DepartmentID,PositionID,CreateDate ) values 
(1,'Dung1@.com.vn','Conchimto','Nguyen A',1,1,'2021-02-1'),
(2,'Dung2@.com.vn','Conchimto2','Nguyen Van BA',2,2,'2021-02-1'),
(3,'Dung3@.com.vn','Conchimto3','Nguyen Van CD',3,3,'2021-02-1'),
(4,'Dung4@.com.vn','Conchimto4','Nguyen Van D',4,4,'2021-02-1'),
(5,'Dung5@.com.vn','Conchimto5','Nguyen  E',5,5,'2021-02-1'),
(6,'Dung6@.com.vn','Conchimto8','Nguyen Van D',3,3,'2021-02-1'),
(7,'Dung7@.com.vn','Conchimto9','Nguyen Van BA',2,2,'2021-02-1'),
(8,'Dung8@.com.vn','Donchimtoo','Nguyen Van BA',2,2,'2021-02-1');
create table `Group`(GroupID int primary key AUTO_INCREMENT, 
GroupName varchar(50),
CreatorID tinyint not null unique,
CreateDate date);
-- add data
insert `Group` (GroupID ,GroupName,CreatorID,CreateDate) values 
(1,'OOP',1,'2019-02-1'),
(2,'TT',2,'2021-02-1'),
(3,'TET',3,'2021-02-1'),
(4,'MASTER',4,'2021-02-1'),
(5,'POM',5,'2021-02-1'),
(6,'POM',6,'2021-09-12'),
(7,'POM',8,'2021-09-12'),
(8,'M',7,'2021-09-12');

create table GroupAccount(GroupID int not null,
 AccountID smallint not null unique,
 JoinDate date,
 FOREIGN KEY (AccountID)
REFERENCES Account (AccountID),
FOREIGN KEY (GroupID )
REFERENCES `Group`  (GroupID )
);
-- add data
insert GroupAccount (GroupID ,AccountID,JoinDate) values 
(1,1,'2019-02-1'),
(2,2,'2021-02-1'),
(3,3,'2021-02-1'),
(4,4,'2021-02-1'),
(5,5,'2021-02-1');
create table TypeQuestion(TypeID tinyint primary key AUTO_INCREMENT, 
TypeName varchar(50));
-- add data
insert TypeQuestion (TypeID,TypeName ) values 
(1,'DEV'),
(2,'TEST'),
(3,'TEST'),
(4,'SCUM MASTER'),
(5,'PM');
create table CategoryQuestion(CategoryID tinyint primary key AUTO_INCREMENT, 
CategoryName varchar(50));
-- add data
insert CategoryQuestion (CategoryID,CategoryName ) values 
(1,'DEV'),
(2,'TEST'),
(3,'TEST'),
(4,'SCUM MASTER'),
(5,'PM');
create table Question(QuestionID int primary key AUTO_INCREMENT, 
Content varchar(50),
CategoryID tinyint not null,
TypeID tinyint not null,
CreatorID tinyint not null, 
CreateDate date,
FOREIGN KEY (TypeID)
REFERENCES TypeQuestion (TypeID),
FOREIGN KEY (CategoryID)
REFERENCES CategoryQuestion (CategoryID)
);
-- add data
insert Question (QuestionID ,Content,CategoryID,TypeID,CreatorID,CreateDate) values 
(1,'OOP',1,1,1,'2021-02-1'),
(2,'TT',2,2,2,'2021-02-1'),
(3,'TET',3,3,3,'2021-02-1'),
(4,'MASTER',4,4,4,'2021-02-1'),
(5,'POM',5,5,5,'2021-02-1');
create table Answer(AnswerID int primary key AUTO_INCREMENT, 
Content varchar(50),
QuestionID int not null,
isCorrect varchar(50),
FOREIGN KEY (QuestionID)
REFERENCES Question (QuestionID)
);
-- add data
insert Answer (AnswerID,Content,QuestionID,isCorrect ) values 
(1,'DEV',1,'true'),
(2,'TEST',2,'false'),
(3,'TEST',3,'true'),
(4,'SCUM MASTER',4,'false'),
(5,'PM',5,'true');
create table Exam(ExamID int primary key AUTO_INCREMENT, 
Code varchar(50) unique,
Title varchar(50),
CategoryID tinyint not null,
Duration int, 
CreatorID tinyint not null, 
CreateDate date,
FOREIGN KEY (CategoryID)
REFERENCES CategoryQuestion (CategoryID)
);
-- add data
insert Exam (ExamID ,Code,Title,CategoryID,Duration,CreatorID,CreateDate ) values 
(1,'abc','DEV',1,60,1,'2019-02-1'),
(2,'TEST','DEV',2,50,2,'2020-02-1'),
(3,'T1ST','BA',3,30,3,'2021-02-1'),
(4,'SCUM','BA',4,70,4,'2021-02-1'),
(5,'PM','Maketing',5,50,5,'2021-02-1'),
(6,'PMA','Maketing',5,90,5,'2018-02-1');
create table ExamQuestion(ExamID int not null, 
QuestionID int not null,
FOREIGN KEY (ExamID)
REFERENCES Exam (ExamID),
FOREIGN KEY (QuestionID)
REFERENCES Question (QuestionID));
-- add data
insert ExamQuestion (ExamID,QuestionID) values 
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);
-- Lay tat ca ten phong ban
SELECT DepartmentName FROM qlthidau.department;
-- lay id phong ban Sale
Select DepartmentID FROM qlthidau.department
where DepartmentName='Sale';
SELECT * FROM Account WHERE LENGTH(FullName) = (
SELECT MAX(LENGTH(FullName)) FROM Account);
SELECT * FROM Account WHERE LENGTH(FullName) = (
SELECT MAX(LENGTH(FullName)) FROM Account) AND departmentId=3;
Select groupName from `group` where CreateDate <('2019-12-20');
select questionID from Answer where answerID >=4;
select code from exam where Duration >=60 and CreateDate <('2019-12-20');
select  * from `group` where CreateDate  limit 5; 
select count(*) from account where DepartmentID =2;
select username from account where Username like 'D%o';
-- select count(*) from Account group by DepartmentID having count(*) >=1;
-- distinct loại bỏ dupplicate values
-- order by asc(ascending), desc (descending)

-- function
-- count : đếm (số bản ghi)
-- select count(*) from customer ;
-- SUM : tính tổng giá trị của column
-- select sum(age) from customer where address like 'HaNoi%';

-- -- Min: tìm giá trị nhỏ nhất
-- select min(age) from customer where address like 'HaNoi%';
-- max tìm giá trị lớn nhất
-- select max(age) from customer where address like 'HaNoi%';
-- avg: tính tổng 
-- Length tính độ dài của chuỗi



