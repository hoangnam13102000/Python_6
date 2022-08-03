-- câu 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW Bang1 as
SELECT a.*, d.DepartmentName FROM `account` a 
 JOIN department d 
ON a.DepartmentID=d.DepartmentID 
WHERE d.DepartmentName = 'Sale';
-- câu 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW Bang2 as
SELECT a.* FROM `account` a
JOIN groupaccount gr 
ON a.AccountID=gr.AccountID
GROUP BY gr.AccountID 
HAVING COUNT(gr.AccountID) = (SELECT MAX(SLAC) FROM 
											(SELECT count(gr1.AccountID) as SLAC FROM groupaccount gr1 GROUP BY gr1.AccountID) as TKTN);
-- câu 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất (CTE);
CREATE VIEW Bang2 as
WITH DS_so_luong_TK as (
		SELECT	count(ga.AccountID)  SLTK FROM groupaccount ga
        GROUP BY ga.AccountID),
        Slg_MAX as (SELECT MAX(SLTK) as Max from DS_so_luong_TK)
	SELECT a.*  FROM `account` a
	JOIN groupaccount gr 
	ON a.AccountID=gr.AccountID
	GROUP BY gr.AccountID HAVING COUNT(gr.AccountID)=(SELECT Max from  Slg_MAX );
-- câu 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE VIEW Bang3 as
SELECT q.* from question q where length( q.Content) >20;
DELETE FROM question q where length( q.Content) >20;



-- câu 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW Bang4 as
WITH DSNV as (
		SELECT	count(a.DepartmentID)  SLNV FROM account a
        GROUP BY a.DepartmentID),
        MAX_NV as (
			SELECT MAX( SLNV) as MaxNV from DSNV
        )
SELECT d.DepartmentName, count(a.DepartmentID) FROM department d
	JOIN account a
	ON d.DepartmentID=a.DepartmentID
    GROUP BY a.DepartmentID HAVING count(a.DepartmentID) =(SELECT MaxNV from Max_NV);
-- câu 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo
CREATE VIEW Bang5 as
SELECT q.*, a.Full_name from question q join account a on q.CreatorID=a.AccountID WHERE a.Full_name like 'Nguyễn%';