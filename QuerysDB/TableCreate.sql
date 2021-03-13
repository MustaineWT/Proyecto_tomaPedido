
CREATE TABLE tb_BranchOffice (
    BranchOfficeId int identity(1,1) not null PRIMARY KEY,	
	companyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
    Name int NOT NULL,
	Direction varchar(200),
	city varchar(50),
	state char(1),  
);

drop table tb_TypePerson
create table tb_TypePerson
(
TypePersonId int identity(1,1) primary key,
Description varchar(200),
State char(1)
)
drop table tb_Person
create table tb_Person
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
PersonId int identity(1,1) primary key,
LastName varchar(200),
Dni varchar(15),
Phone varchar(20),
TypePersonId int FOREIGN KEY REFERENCES tb_TypePerson(TypePersonId),
State char(1)
)
drop table tb_User
CREATE TABLE tb_User
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Userid int identity(1,1) not null primary key,
PersonId  int FOREIGN KEY REFERENCES tb_Person(PersonId),
User_at varchar(100),
Password_at varchar(100),
State char(1)
)
create table tb_Client
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
CodClient int,
Ruc varchar(20),
BussinesName varchar(200),
Email varchar(200),
Direction varchar(200),
DirectionFiscal varchar(200),
Modulo varchar(200),
Order_at varchar(200),
Latitude decimal,
Longitude decimal,
Distance varchar(200),
SubTurn int,
Turn int,
SalesChannel varchar(50),
PerceptionFlag int,
State char(1),
Create_at date
)

create table tb_Zone
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Zone varchar(100),
Description varchar(200),
State char(1),
Create_at date
)
create table tb_Route
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Route varchar(100),
Description varchar(200),
Zone varchar(200),
FFVV int,
State char(1),
Create_at date
)

create table tb_Module
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Module varchar(100),
Route varchar(100),
Description varchar(200),
FFVV int,
State char(1),
Create_at date
)

create table tb_RouteXPerson
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Route varchar(100),
PersonID int FOREIGN KEY REFERENCES tb_Person(PersonId),
State char(1),
Create_at date
)

create table tb_ListPrice
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
ListPriceId int identity(1,1) primary key,
Description varchar(100),
State char(1),
Create_at date
)
drop table tb_DetailListPrice
create table tb_DetailListPrice
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
ListPriceId int  FOREIGN KEY REFERENCES tb_ListPrice(ListPriceId),
Article varchar(100),
AmtPriceHigh decimal,
AmtPriceLess decimal,
UndSale varchar(50),
DateValidStart date,
DateValidEnd date,
State char(1),
Create_at date
)

create table tb_ListPriceXArticle
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
ListPriceId int  FOREIGN KEY REFERENCES tb_ListPrice(ListPriceId),
Article varchar(100),
State char(1),
Create_at date
)

create table tb_ListPriceXClient
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
ListPriceId int  FOREIGN KEY REFERENCES tb_ListPrice(ListPriceId),
CodClient int,
State char(1),
Create_at date
)

create table tb_UndMeasure
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
UndMeasureId int identity(1,1) primary key,
UndMeasure varchar(50),
Description varchar(50),
State char(1),
Create_at date
)

create table tb_Family
(
FamilyId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)

create table tb_Category
(
CategoryId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
create table tb_Brand
(
BrandId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
create table tb_Format
(
FormatId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
create table tb_Flavor
(
FlavorId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
create table tb_Provider
(
ProviderId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
create table tb_Maker
(
MakerId int identity(1,1) primary key,
Description varchar(150),
State char(1),
Create_at date
)
select * from tb_company

create table tb_Article
(
CompanyId int FOREIGN KEY REFERENCES tb_company(CompanyId),
FamilyId int FOREIGN KEY REFERENCES tb_Family(FamilyId),
CategoryId int FOREIGN KEY REFERENCES tb_Category(CategoryId),
Article varchar(50),
Description varchar(200),
DescriptionTwo varchar(50),
UndWight varchar(20),
QWight decimal,
UndVolumen varchar(20),
QTotal decimal,
UndBuy varchar(20),
UndCost varchar(20),
UndDriving varchar(20),
UndAcco varchar(20),
BrandId int FOREIGN KEY REFERENCES tb_Brand(BrandId),
FormatId int FOREIGN KEY REFERENCES tb_Format(FormatId),
FlavorId int FOREIGN KEY REFERENCES tb_Flavor(FlavorId),
ProviderId int FOREIGN KEY REFERENCES tb_Provider(ProviderId),
MakerId int FOREIGN KEY REFERENCES tb_Maker(MakerId),
StateMobil int,
ArticleValue int,
State char(1),
Create_at date
)

create table tb_Articule2F
(
CompanyId int FOREIGN KEY REFERENCES tb_company(CompanyId),
Article varchar(50),
UndDriving varchar(20),
UndAcco varchar(20),
QContent int,
StateMobil int,
State char(1),
Create_at date
)

create table tb_MethodOfPayment
(
MethodOfPaymentId int identity(1,1) primary key,
Description varchar(50),
State char(1),
Create_at date
)
create table tb_ReasonForNotSale
(
ReasonForNotSaleId int identity(1,1) primary key,
Description varchar(50),
State char(1),
Create_at date
)

Create table tb_HeaderSale
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Order_at varchar(100),
NumberSale varchar(100),
WareHouse varchar(100),
CodClient int,
PersonId int FOREIGN KEY REFERENCES tb_Person(PersonId),
DateSale date,
DateDelivery date,
MethodOfPaymentId int FOREIGN KEY REFERENCES tb_MethodOfPayment(MethodOfPaymentId),
Observation varchar(100),
QWight decimal,
QAmount decimal,
ReasonForNotSaleId int FOREIGN KEY REFERENCES tb_ReasonForNotSale(ReasonForNotSaleId),
State char(1),
StateFlag char(1),
DocumentSerie varchar(10),
DocumentNumber varchar(50),
DateModification date,
Latitude decimal,
Longitude decimal,
Battery decimal,
EndTime varchar(10),
DateBilling date,
FlagDelivered int,
DateDelivered date,
DirectionDelivery varchar(200),
LatitudeDelivery decimal,
LongitudeDelivery decimal,
Create_at date
)

Create table tb_DetailSale
(
CompanyId int FOREIGN KEY REFERENCES tb_Company(CompanyId),
BranchOfficeId int FOREIGN KEY REFERENCES tb_BranchOffice(BranchOfficeId),
Order_at varchar(100),
NumberSale varchar(100),
Article varchar(50),
TypeArticle char(1),
ListPriceId int FOREIGN KEY REFERENCES tb_ListPrice(ListPriceId),
GrossPrice decimal,
Quantity int,
NetPrice decimal,
UndMeasure varchar(20),
QWight decimal,
Perception decimal,
ISC decimal,
Mesh varchar(100),
State char(1),
Create_at date
)