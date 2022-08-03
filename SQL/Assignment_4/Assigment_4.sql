-- câu 1:
select a.Full_name,d.DepartmentName
from account as a 
join department as d 
on a.DepartmentID=d.DepartmentID;
-- câu 2:
select * 
from account as a 
where a.CreateDate='2010-12-20';
-- câu 3:
select * from position as p 
join account as a 
on p.PositionID=a.PositionID 
where p.PositionName='Dev';
-- câu 4:
select DepartmentName
from department as d
join account as a
on d.DepartmentID=a.DepartmentID
group by a.DepartmentID having count(a.AccountID) >3;
-- câu 5:
SELECT E.QuestionID, Q.Content FROM examquestion E
INNER JOIN question Q ON Q.QuestionID = E.QuestionID
GROUP BY E.QuestionID
HAVING count(E.QuestionID) = (SELECT MAX(countQues) as maxcountQues FROM (
SELECT COUNT(E.QuestionID) AS countQues FROM examquestion E
GROUP BY E.QuestionID) AS countTable);

-- câu 6: Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
select c.CategoryName, q.Content,count(q.QuestionID) as soluong, group_concat(q.QuestionID) as nhom
from categoryquestion as c 
left join question as q
on c.CategoryID=q.CategoryID
group by q.CategoryID;
-- câu 7:Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
select q.Content,count(eq.ExamID) as soluong, group_concat(eq.ExamID) as nhom
from  examquestion as eq
left join question as q
on eq.QuestionID=q.QuestionID
group by q.QuestionID ; 
-- câu 8: Lấy ra Question có nhiều câu trả lời nhất
select q.Content,count(a.AnswerID)
from question as q
join answer as a
on q.QuestionID=a.QuestionID
group by a.AnswerID
having count( a.AnswerID)= (select max(countQues)as maxcountQues FROM (
SELECT COUNT(a.AnswerID) AS countQues FROM answer a
GROUP BY a.AnswerID) AS countTable);
-- câu 9:
SELECT g.GroupName ,count(ga.AccountID)
from `group` as g
join groupaccount as ga
on g.GroupID=ga.GroupID
join account as a
on a.AccountID=ga.AccountID
group by ga.AccountID
order by count(ga.AccountID);
-- câu 10:
SELECT p.PositionName,count(a.PositionID) as soluong
FROM position p JOIN account a ON p.PositionID=a.PositionID
GROUP BY a.PositionID
HAVING count(a.PositionID)=(SELECT min(ca) FROM
(SELECT count(ac.PositionID) AS ca FROM position p LEFT join `account` as ac on p.PositionID = ac.PositionID
GROUP BY p.PositionID) AS cp);

-- câu 11:
select d.DepartmentName,p.PositionName, count(a.AccountID)
from position as p 
 join account as a
on p.PositionID=a.PositionID 
 join department as d
on a.DepartmentID=d.DepartmentID
group by a.PositionID,d.DepartmentID;
-- câu 12: Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì,
select q.*,t.TypeName,a.Content from question as q
join typequestion as t
on q.TypeID=t.TypeID
join answer as a
on a.QuestionID=q.QuestionID;
-- câu 13:
select t.TypeName, count(t.TypeID) 
from typequestion  as t 
left join question as q
on q.TypeID=t.TypeID
group by t.TypeID;
-- câu 14: Lấy ra group không có account nào
SELECT * 
FROM `group` as g
LEFT JOIN groupaccount ga on g.GroupID=ga.GroupID
GROUP BY g.GroupID HAVING count(ga.GroupID)=0;
-- câu 16: Lấy ra question không có answer nào
SELECT * 
from question as q
 LEFT join answer as a
on q.QuestionID=a.QuestionID
where a.Content is Null;
-- câu 17:
select *
from account as a
join groupaccount as g on a.AccountID=g.AccountID
where g.GroupID=1
union
select *
from account as a join groupaccount as g 
on a.AccountID=g.AccountID
where g.GroupID=2;
-- câu 18:
SELECT * 
FROM groupaccount as ga
JOIN `group` g
ON ga.GroupID = g.GroupID 
GROUP BY ga.GroupID HAVING count(ga.GroupID) > 2
UNION ALL
SELECT 
* FROM groupaccount as ga
JOIN `group` g
ON ga.GroupID = g.GroupID
GROUP BY ga.GroupID HAVING count(ga.GroupID) < 7;

