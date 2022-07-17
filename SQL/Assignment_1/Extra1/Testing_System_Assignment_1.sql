create database QLthidau;
create table Department(DepartmentID int primary key AUTO_INCREMENT, DepartmentName varchar(50));
create table Posotion(PosotionID int primary key AUTO_INCREMENT, PosotionName ENUM('DEV','TEST','SCUM MASTER','PM'));
create table Account(AccountID int primary key AUTO_INCREMENT, Email varchar(50), Username varchar(50), FullName varchar(50),DepartmentID int,PositionID int, CreateDate Date);
create table Group1(GroupID int primary key AUTO_INCREMENT, GroupName varchar(50),CreatorID int,CreateDate date);
create table GroupAccount(GroupID int, AccountID int,JoinDate date);
create table TypeQuestion(TypeID int primary key AUTO_INCREMENT, TypeName varchar(50));
create table CategoryQuestion(CategoryID int primary key AUTO_INCREMENT, CategoryName varchar(50));
create table Question(QuestionID int primary key AUTO_INCREMENT, Content varchar(50),CategoryID int,TypeID int,CreatorID int, CreateDate date);
create table Answer(AnswerID int primary key AUTO_INCREMENT, Content varchar(50),QuestionID int,isCorrect varchar(50));
create table Exam(ExamID int primary key AUTO_INCREMENT, Code varchar(50),Title varchar(50),CategoryID int,Duration int, CreatorID int, CreateDate date);
create table ExamQuestion(ExamID int, QuestionID int);




