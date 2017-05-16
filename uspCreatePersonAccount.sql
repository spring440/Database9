create procedure createPersonAccount
@lName varchar(250),
@fName varchar(250),
@Email varchar(250),
@Pass varchar(250),
@Street varchar(max),
@Unit varchar(10),
@City varchar(50),
@Zip varchar(10),
@State int

as begin
-- this usp is used to create a new account
-- this assumes the email format and password has been check on the server side or front end
-- email is provided in person separetly in case someone is manually added to the table rather than create an account
-- everyone is set as an atteendee since it assumes someone creating an account is planning on attending the event

insert Users values(@Email, @Pass)
declare @UserID int
set @UserID = @@identity

insert Person values(@lName, @fName, @Street, @Unit, @City, @Zip, @State, @Email)
declare @PersonID int
set @PersonID = @@IDENTITY

insert User_Person values(@UserID, @PersonID)

insert Person_Role values(@PersonID, 2)

end