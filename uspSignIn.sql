create procedure SignIn
@Email varchar(250),
@Pass varchar(250)

as begin

declare @UserID int;

set @UserID = (select top 1 UserID from Users where Email = @Email and Password = @Pass)

if @UserID is null
begin;
	throw 5000, 'Email or Password is incorrect.', 1
end

insert UserToken values(@UserID, NEWID(), NEWID(), DATEADD(HOUR, 1 ,GETDATE()))

set nocount on;

select * from UserToken
where UserID = @UserID

end