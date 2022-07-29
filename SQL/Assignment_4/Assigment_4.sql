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
select eq.QuestionID,q.Content,count(eq.QuestionID) 
from examquestion as eq
join question as q
on q.QuestionID=eq.QuestionID
group by eq.QuestionID
order by count(eq.QuestionID) desc
limit 1;
-- câu 6:
select c.CategoryName, q.Content,count(c.CategoryID)
from categoryquestion as c 
join question as q
on c.CategoryID=q.CategoryID
group by c.CategoryID;
-- câu 7:
select q.Content,count(eq.QuestionID)
from  examquestion as eq
join question as q
on eq.QuestionID=q.QuestionID
group by eq.QuestionID ; 
-- câu 8:
select q.Content,count(a.AnswerID)
from question as q
join answer as a
on q.QuestionID=a.QuestionID
group by a.AnswerID
order by count(a.AnswerID) desc
limit 1;
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
select p.PositionName 
from position as p 
join account as a
on p.PositionID=a.PositionID 
group by a.AccountID
order by count(a.AccountID) asc
limit 1;
-- câu 11:
select DepartmentName,p.PositionName, count(a.PositionID)
from position as p 
join account as a
on p.PositionID=a.PositionID 
join department as d
on a.DepartmentID=d.DepartmentID
group by a.PositionID;
-- câu 12:
select q.*,t.TypeName,a.Content from question as q
join typequestion as t
on q.TypeID=t.TypeID
join answer as a
on a.QuestionID=q.QuestionID;
-- câu 13:
select t.TypeName, count(q.TypeID) 
from question as q 
join typequestion as t
on q.TypeID=t.TypeID
group by q.TypeID;
-- câu 14:
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