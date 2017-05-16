create procedure RefreshToken
@RefreshToken uniqueidentifier
as
begin
-- This usp refreshes a token to keep the user logged in
declare @Token uniqueidentifier
select @Token = Token 
from UserToken
Where RefreshToken = @RefreshToken

if @Token is null
begin;
	throw 50001, 'RefreshToken Is Invalid', 1;
end

declare @NewToken  uniqueidentifier
set @NewToken = NEWID()

update UserToken
set Token = @NewToken,
RefreshToken = NEWID(),
Expires = DATEADD(HOUR, 1 ,GETDATE())
where Token = @Token


select * from UserToken where Token = @NewToken


end


