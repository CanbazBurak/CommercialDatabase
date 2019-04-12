--DDL SCRÝPT

CREATE database Commertial

CREATE table ProductDetail(

ProductDetailID int identity (1,1) primary key,
ProductID int,
ProductPrice numeric(18,2) CONSTRAINT chck check(ProductPrice >=0),
ProductTax numeric(18,0)  CONSTRAINT chckk check(ProductTax >=0),
ProductCount int  CONSTRAINT chckkk check(ProductCount >=0)
)

CREATE table Sales(

SaleslID int identity (1,1) primary key,
ProductID int,
ProductCount int CONSTRAINT chckkkk check(ProductCount >=0),
PersonID int,
SalesDate date
)

CREATE table SubCategory(

SubCategoryID int identity (1,1) primary key,
SubCategoryName nvarchar(50) CONSTRAINT namechck NOT NULL ,
CategoryID int,
SubCategoryActive int default '1' 
)

CREATE table Person(

PersonID int identity (1,1) primary key,
PersonName nvarchar(50) CONSTRAINT namechck NOT NULL ,
PersonMail nvarchar(50),
PersonNumber nvarchar(50),
PersonTypeID int,
PersonActive int default '1',
PersonCreateDate date
)


CREATE table PersonDetail(

PersonDetailID int identity (1,1) primary key,
CityID int,
CountryID int,
PersonAdress nvarchar(50),
PersonID int,
PersonGender nvarchar(50)
)

CREATE table PersonType(

PersonTypeID int identity (1,1) primary key,
PersonTypeName nvarchar(50) CONSTRAINT namechckk NOT NULL ,
PersonTypeActive int default '1'
)

CREATE table Product(

ProductID int identity (1,1) primary key,
ProductName nvarchar(50) CONSTRAINT namechckkk NOT NULL ,
SubCategoryID int,
CategoryID int,
ProductActive int default'1'
)

CREATE table Basket(

BasketID int identity (1,1) primary key,
ProductID int,
PersonID int,
BasketDate datetime,
BasketPosition int
)

CREATE table Category(

CategoryID int identity (1,1) primary key,
CategoryName nvarchar(50) CONSTRAINT namechckkkk NOT NULL ,
CategoryActive int default '1'
)

CREATE table City(

CityID int identity (1,1) primary key,
CityName nvarchar(50) CONSTRAINT namchck NOT NULL ,
CityActive int default '1'
)

CREATE table Comment(

CommentID int identity (1,1) primary key,
Comment nvarchar(50),
ProductID int,
PersonID int,
CommentDate date,
CommentActive int default '0'
)

CREATE table Country(

CountrytID int identity (1,1) primary key,
CountryName nvarchar(50) CONSTRAINT nammchck NOT NULL ,
CityID int,
CountryActive int default '1'
)

ALTER TABLE PersonDetail ALTER COLUMN PersonGender varchar(6) 

ALTER TABLE Country ALTER COLUMN CountryName varchar(20)

ALTER TABLE Basket ADD CHECK (BasketPosition<0)

ALTER TABLE Person DROP COLUMN PersonNumber

