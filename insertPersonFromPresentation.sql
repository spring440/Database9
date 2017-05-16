USE [s17guest09]
GO

INSERT INTO [dbo].[Person]
select DISTINCT  t.lName, t.fName, null, null, null, null, null, null, 'email@email.com' from TempPerson t order by fName
    
GO

