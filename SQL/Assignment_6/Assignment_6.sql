-- câu 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó
DROP PROCEDURE IF EXISTS get_accounts;
DELIMITER $$
CREATE PROCEDURE get_accounts (IN Department_Name NVARCHAR(50))
BEGIN
	SELECT a.Full_name,a.User_name
    FROM `account` a 
    JOIN Department d
    ON a.DepartmentID = d.DepartmentID
    WHERE d.DepartmentName= Department_Name;
END $$
DELIMITER ;

-- câu 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS get_SL_acount
DELIMITER $$
CREATE PROCEDURE get_SL_acount ()
BEGIN
	SELECT  g.GroupName, count(ga.AccountID)
    FROM `group` g
    LEFT JOIN GroupAccount ga
    ON g.GroupID = ga.GroupID
    GROUP BY g.GroupID;
END $$
DELIMITER ;
-- câu 3:Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại
DROP PROCEDURE IF EXISTS type_Question;
DELIMITER $$
CREATE PROCEDURE type_Question()
BEGIN
	SELECT count(TypeID)
    FROM Question
    WHERE YEAR(CreateDate)=YEAR(NOW()) AND MONTH(CreateDate)=MONTH(NOW())
    GROUP BY TypeID;
END $$
DELIMITER ;    
    
-- câu 4:Tạo store để trả ra id của type question có nhiều câu hỏi nhất
DROP PROCEDURE IF EXISTS Get_QuestionID;
DELIMITER $$
CREATE PROCEDURE Get_QuestionID( OUT out_TypeID INT)
BEGIN
	
	SELECT q.QuestionID INTO out_TypeID 
    FROM Question q
	JOIN ExamQuestion e
    ON q.QuestionID = e.QuestionID
    GROUP BY e.QuestionID
    HAVING count(e.QuestionID)= (SELECT max(SLQ)FROM 
													(SELECT count(e.QuestionID)as SLQ FROM ExamQuestion e GROUP BY e.QuestionID)as TKTN); 
END $$
DELIMITER ;
set @out_TypeID = 0;
call testingsystem.Get_QuestionID(@out_TypeID);
select @out_TypeID;
-- câu 5: Sử dụng store ở question 4 để tìm ra tên của type question
SELECT q.Content 
FROM question q 
WHERE q.TypeID=@out_TypeID;
 