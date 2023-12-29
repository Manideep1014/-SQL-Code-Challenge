

-- CODING CHALLENGE :- PetPals, The Pet Adoption Platform. Create Database if not exists

-- 1. Provide a SQL script that initializes the database for the Pet Adoption Platform ”PetPals”.
if exists (select * from sys.databases where name = 'PetPals')
begin
	drop database PetPals;
end;
go

create database PetPals;

use PetPals;



-- 2. Create tables for pets, shelters, donations, adoption events, and participants.
-- 3. Define appropriate primary keys, foreign keys, and constraints.
-- 4. Ensure the script handles potential errors, such as if the database or tables already exist.
IF OBJECT_ID(N'dbo.Pets', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Pets];  
GO
IF OBJECT_ID(N'dbo.Shelters', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Shelters];  
GO
IF OBJECT_ID(N'dbo.Donations', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Donations];  
GO
IF OBJECT_ID(N'dbo.AdoptionEvents', N'U') IS NOT NULL  
   DROP TABLE [dbo].[AdoptionEvents];  
GO
IF OBJECT_ID(N'dbo.Participants', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Participants];  
GO
IF OBJECT_ID(N'dbo.Users', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Users];  
GO
IF OBJECT_ID(N'dbo.Adoption', N'U') IS NOT NULL  
   DROP TABLE [dbo].[Adoption];  
GO


-- TABLES CREATION


CREATE TABLE  Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    Breed VARCHAR(100),
    Type VARCHAR(50),
    AvailableForAdoption BIT
);

CREATE TABLE  Shelters (
    ShelterID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(255)
);

CREATE TABLE  Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(100),
    DonationType VARCHAR(50),
    DonationAmount DECIMAL(10, 2),
    DonationItem VARCHAR(100),
    DonationDate DATETIME
);

CREATE TABLE  AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventDate DATETIME,
    Location VARCHAR(255)
);

CREATE TABLE  Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(100),
    ParticipantType VARCHAR(50),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);


insert into Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption)
values
    (1, 'Argus', 2, 'German Shepherd', 'Dog', 0),
    (2, 'Alf', 1, 'Persian', 'Cat', 1),
    (3, 'Basil', 3, 'German Shepherd', 'Dog', 1),
    (4, 'Ivory', 1, 'Pomeranian', 'Dog', 1),
    (5, 'Houdini', 2, 'Ragdoll', 'Cat', 0),
    (6, 'Jake', 4, 'Beagle', 'Dog', 1),
    (7, 'Nellie', 1, 'Maine Coon', 'Dog', 0),
    (8, 'Mitch', 2, 'Siamese', 'Cat', 1),
    (9, 'Wayne', 1, 'Golden Retriever', 'Dog', 1),
    (10, 'Scarlett', 3, 'Golden Retriever', 'Dog', 1);

	SELECT * FROM Pets


insert into Shelters (ShelterID, Name, Location)
values
    (1, 'Loving Paws Sanctuary', 'Mumbai, Maharashtra'),
    (2, 'Harmony Haven for Pets', 'Delhi, Delhi'),
    (3, 'Whisker Haven', 'Bangalore, Karnataka'),
    (4, 'Rainbow Shelter', 'Chennai, Tamil Nadu'),
    (5, 'Fur-ever Home Shelter', 'Kolkata, West Bengal'),
    (6, 'Furry Friends Shelter', 'Hyderabad, Telangana'),
    (7, 'Tail Wagging Retreat', 'Pune, Maharashtra'),
    (8, 'Joyful Tails', 'Ahmedabad, Gujarat'),
    (9, 'Rescue Me Pet Sanctuary', 'Jaipur, Rajasthan'),
    (10, 'Second Chance Critter Rescue', 'Lucknow, Uttar Pradesh');

	--SELECT * FROM Shelters


insert into Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate)
values
    (1, 'Kohli', 'Cash', 100.00, NULL, '2023-01-15 10:30:00'),
    (2, 'Rohit', 'Item', NULL, 'Pet Food', '2023-02-02 15:45:00'),
    (3, 'Messi', 'Cash', 50.00, NULL, '2023-03-10 08:20:00'),
    (4, 'Ronaldo', 'Item', NULL, 'Pet Toys', '2023-04-05 12:10:00'),
    (5, 'Neymar', 'Cash', 75.00, NULL, '2023-05-20 14:55:00'),
    (6, 'Suarez', 'Item', NULL, 'Pet Bed', '2023-06-18 09:30:00'),
    (7, 'Dembele', 'Cash', 120.00, NULL, '2023-07-03 11:40:00'),
    (8, 'Pedri', 'Item', NULL, 'Cat Litter', '2023-08-22 16:15:00'),
    (9, 'Gavi', 'Cash', 90.00, NULL, '2023-09-14 13:25:00'),
    (10, 'Araujo', 'Item', NULL, 'Dog Leash', '2023-10-30 07:50:00');

	--select * from Donations


insert into AdoptionEvents (EventID, EventName, EventDate, Location)
values
    (1, 'Manideep Adoptions Festival', '2023-01-25 11:00:00', 'Mumbai, Maharashtra'),
    (2, 'FriendsHomes Expo', '2023-03-15 14:30:00', 'Lucknow, Uttar Pradesh'),
    (3, 'Adopt-a-Palooza', '2023-05-05 12:00:00', 'Bangalore, Karnataka'),
    (4, 'Pet Adoption Expo', '2023-07-10 10:00:00', 'Bangalore, Karnataka'),
    (5, 'Year Ending Carnival', '2023-09-02 15:00:00', 'Ahmedabad, Gujarat'),
    (6, 'Paws for Love', '2023-10-18 13:45:00', 'Mumbai, Maharashtra'),
    (7, 'Pets Fair', '2023-12-01 09:30:00', 'Lucknow, Uttar Pradesh'),
    (8, 'Love For Pets', '2024-02-08 11:20:00', 'Kolkata, West Bengal'),
    (9, 'Pets Offer Sale', '2024-04-03 16:00:00', 'Jaipur, Rajasthan'),
    (10, 'Adopt A Heart', '2024-06-22 10:45:00', 'Chennai, Tamil Nadu');

	--select * from AdoptionEvents


insert into Participants (ParticipantID, ParticipantName, ParticipantType, EventID)
values
    (1, 'Manideep', 'Shelter', 1),
    (2, 'Shyam', 'Adopter', 1),
    (3, 'Vasanth', 'Shelter', 2),
    (4, 'Ram', 'Adopter', 2),
    (5, 'Prem', 'Shelter', 3),
    (6, 'Akhil', 'Adopter', 3),
    (7, 'Jayanth', 'Shelter', 4),
    (8, 'Bobby', 'Adopter', 4),
    (9, 'Rainbow Shelter', 'Shelter', 5),
    (10, 'Ananya', 'Adopter', 5);

	--select * from Participants

	-- two more extra tables are added to perform queries which cannot be done using previous mentioned tables

create table Users(
    UserID int primary key,
	UserName varchar(255)
);

insert into Users values	
	(1, 'Iyer'),
	(2, 'Pandya'),
	(3, 'Shardhul'),
	(4,'Gill'),
	(5,'Rinku');

create table Adoption(
    AdoptionID int primary key,
	PetID int foreign key references Pets(PetID),
	UserID int foreign key references Users(UserID)
);

insert into Adoption values
    (1,5,5),
	(2,3,3),
	(3,2,1),
	(4,10,2);


	--TASKS AND QUERIES

--5. Write an SQL query that retrieves a list of available pets (those marked as available for adoption)
--   from the "Pets" table. Include the pet's name, age, breed, and type in the result set. Ensure that
--   the query filters out pets that are not available for adoption.

select Name, Age, Breed, Type from Pets 
where AvailableForAdoption <> 0;


--6. Write an SQL query that retrieves the names of participants (shelters and adopters) registered 
--   for a specific adoption event. Use a parameter to specify the event ID. Ensure that the query 
--   joins the necessary tables to retrieve the participant names and types

declare @EventID int;
set @EventID = 5;
select P.* from AdoptionEvents as A 
join Participants P on A.EventID=P.EventID 
where A.EventID = @EventID;


--7. Create a stored procedure in SQL that allows a shelter to update its information (name and 
--   location) in the "Shelters" table. Use parameters to pass the shelter ID and the new information. 
--   Ensure that the procedure performs the update and handles potential errors, such as an invalid shelter ID

CREATE PROCEDURE UpdateShelterInfo
    @ShelterID INT,
    @NewName VARCHAR(100),
    @NewLocation VARCHAR(255)
	as 
	begin
        UPDATE Shelters
        SET Name = @NewName,
            Location = @NewLocation
        WHERE ShelterID = @ShelterID;

        PRINT 'Shelter information updated successfully.';
	end
  
  UpdateShelterInfo @ShelterID=2,@NewName= 'Saketh', @NewLocation= 'Nizampet'


--8. Write an SQL query that calculates and retrieves the total donation amount for each shelter (by shelter name)
-- from the "Donations" table. The result should include the shelter name and the total donation amount. 
--Ensure that the query handles cases where a shelter has received no donations.

alter table Donations add ShelterID int foreign key references Shelters(ShelterID);

update Donations set ShelterID = 1 where DonationID = 1;
update Donations set ShelterID = 2 where DonationID = 2;
update Donations set ShelterID = 3 where DonationID = 3;
update Donations set ShelterID = 4 where DonationID = 4;
update Donations set ShelterID = 5 where DonationID = 5;
update Donations set ShelterID = 5 where DonationID = 6;
update Donations set ShelterID = 7 where DonationID = 7;
update Donations set ShelterID = 8 where DonationID = 8;
update Donations set ShelterID = 10 where DonationID = 9;
update Donations set ShelterID = 10 where DonationID = 10;

select S.Name as ShelterName, coalesce(sum(D.DonationAmount), 0) as TotalDonationAmount
from Shelters S 
left join Donations D on S.ShelterID=D.ShelterID 
group by S.ShelterID, S.Name;


--9. Write an SQL query that retrieves the names of pets from the "Pets" table that do not have an
--owner (i.e., where "OwnerID" is null). Include the pet's name, age, breed, and type in the result set.

-- Creating new column 'OwnerID' in Pets table which references 'UserID' column in the 'Users' table.
alter table Pets add OwnerID int foreign key references Users(UserID);

update Pets set OwnerID = 1 where PetID = 2;
update Pets set OwnerID = 3 where PetID = 7;
update Pets set OwnerID = 4 where PetID = 3;


select Name, Age, Breed, Type from Pets 
where OwnerID is null;



--10. Write an SQL query that retrieves the total donation amount for each month and year

select format(DonationDate, 'MMMM yyyy') as Month_Year, coalesce(sum(DonationAmount), 0) as TotalDonationAmount
from Donations
group by format(DonationDate, 'MMMM yyyy');


--11. Retrieve a list of distinct breeds for all pets that are either aged between 1 and 3 years or older than 5 years.

select distinct Breed from Pets 
where (Age between 1 and 3) or (Age > 5);


--12. Retrieve a list of pets and their respective shelters where the pets are currently available for adoption.

alter table Pets add ShelterID int foreign key references Shelters(ShelterID);
update Pets set ShelterID = 1 where PetID = 1;
update Pets set ShelterID = 2 where PetID = 2;
update Pets set ShelterID = 1 where PetID = 3;
update Pets set ShelterID = 4 where PetID = 4;
update Pets set ShelterID = 5 where PetID = 5;
update Pets set ShelterID = 5 where PetID = 6;
update Pets set ShelterID = 7 where PetID = 7;
update Pets set ShelterID = 8 where PetID = 8;
update Pets set ShelterID = 10 where PetID = 9;
update Pets set ShelterID = 10 where PetID = 10;

select P.Name as [Pet Name], S.Name as [Shelter Name] 
from Pets P 
left join Shelters S on P.ShelterID = S.ShelterID 
where P.AvailableForAdoption = 1;


--13. Find the total number of participants in events organized by shelters located in specific city

select count(P.ParticipantID) as [TotalParticipants] 
from Participants P 
join AdoptionEvents AE on P.EventID = AE.EventID
join Shelters S on AE.Location = S.Location 
where S.Location = 'Lucknow, Uttar Pradesh';

-- (or) below query gives from each location
select count(P.ParticipantID) as [TotalParticipants] ,s.Location
from Participants P 
join AdoptionEvents AE on P.EventID = AE.EventID
join Shelters S on AE.Location = S.Location 
group by S.Location 


--14. Retrieve a list of unique breeds for pets with ages between 1 and 5 years

select distinct Breed from Pets 
where Age between 1 and 5;


--15. Find the pets that have not been adopted by selecting their information from the 'Pet' table

select PetID, Name, Age, Breed, Type, ShelterID from Pets 
where AvailableForAdoption = 1;


--16. Retrieve the names of all adopted pets along with the adopter's name from the 'Adoption' and
--'User' tables.

select P.Name as PetName, U.UserName as [AdopterName]
from Pets as P 
join Adoption as A on P.PetID = A.PetID 
join Users U on A.UserID = U.UserID;


--17. Retrieve a list of all shelters along with the count of pets currently available for adoption in each shelter.

select S.ShelterID, S.Name AS ShelterName, count(P.PetID) as [TotalAvailableForAdoption]
from Shelters S
left join Pets P ON S.ShelterID = P.ShelterID
where P.AvailableForAdoption = 1
group by S.ShelterID, S.Name;


--18. Find pairs of pets from the same shelter that have the same breed.

SELECT p1.PetID AS PetID1, concat(p1.Name,'+', p2.Name) as Pairs, p1.Breed AS Breed,
       p2.PetID AS PetID2
FROM Pets p1
INNER JOIN Pets p2 ON p1.ShelterID = p2.ShelterID
                   AND p1.Breed = p2.Breed
                   AND p1.PetID < p2.PetID


--19. List all possible combinations of shelters and adoption events

select S.ShelterID, S.Name as [Shelter Name], AE.EventID, AE.EventName, 
AE.EventDate, AE.Location from Shelters S
cross join AdoptionEvents AE;


--20. Determine the shelter that has the highest number of adopted pets

select ShelterID, (select Name from Shelters where ShelterID = Pets.ShelterID) [Shelter Name], 
	count(PetID) as [Number of Pets] from Pets
group by ShelterID
having count(PetID) = (select top 1 count(*) from Pets group by ShelterID order by count(*) desc);






