--DML KOMUTLARI VE QUERÝES

SELECT * 
	from Person


SELECT * 
	from Product


SELECT ProductName,SubCategoryID 
	FROM Product


SELECT
	ProductName AS "Product__Name" 
	FROM Product


SELECT * 
	from ProductDetail
	 WHERE ProductPrice>500



SELECT * 
	from ProductDetail
	 WHERE ProductTax=8



SELECT * 
	from ProductDetail
	 WHERE ProductTax=8 and ProductID=5



SELECT * 
	from ProductDetail
	 WHERE ProductTax=4 or ProductID=5



SELECT * 
	from Product 
	WHERE ProductName in('Samsung','Dell')



SELECT * 
	from Product
	 WHERE ProductName like '%a%'



SELECT * 
	from Product
	 WHERE ProductName like 's%'



SELECT 
	ProductName,
	SubCategoryID,
	ProductActive
		FROM Product 
		WHERE ProductName IS NOT NULL



SELECT 
	ProductTax,
	ProductPrice,
	ProductTax*ProductPrice
	 AS TotalPrice 
	 FROM ProductDetail



SELECT 
	UPPER(ProductName) 
		AS Namee 
		FROM Product 
		WHERE 
	LOWER(ProductName) like '%a%' 
		ORDER BY Namee



SELECT
	 ProductName,
	 SUBSTRING(ProductName,1,2)
	  AS Short_Form 
	  FROM Product
	   ORDER BY Short_Form;




insert into 
	PersonType(PersonTypeName) 
		values('Undefined')
	

update ProductDetail	
	set ProductCount=60
	 where ProductDetailID=5



delete 
	from  ProductDetail
	 where ProductDetailID=13




SELECT 
	AVG(ProductPrice) 
	AS avg_ProductPrice 
	FROM ProductDetail;




SELECT 
	COUNT(ProductCount) 
	AS Total_ProductCount 
	FROM ProductDetail;



SELECT 
	PersonName,
	 COUNT(*) AS Person_Name 
	 FROM Person 
	 GROUP BY PersonName
	  ORDER BY PersonName;



SELECT
	 ProductID,
	 COUNT(ProductCount) as 'COUNT',
	  AVG(ProductTax) as 'AVG_TAX' 
	 FROM ProductDetail
	  group by ProductID 
	  HAVING (ProductID>=8);


	  
SELECT
	 PersonName,
	PersonMail,
	PersonAdress 
	FROM Person,
	PersonDetail 
	WHERE Person.PersonID=PersonDetail.CountryID



SELECT 
	PersonMail,
	PersonAdress 
	from Person P1 inner join PersonDetail P2 
	on P1.PersonID=P2.PersonID



SELECT 
	SubCategoryName,
	ProductName 
	from SubCategory S1 left outer join Product P1 
	on S1.SubCategoryID=P1.SubCategoryID





SELECT
	ProductName AS ProductName,
 CASE 
	
	WHEN SubCategoryActive=1 THEN 'ACTÝVE'
	WHEN SubCategoryActive=0 THEN 'PASSIVE'

	END AS DURUM
	from SubCategory  cross join Product


SELECT 
	ProductID 
	from Product 
	except select ProductID 
	from Basket

	
SELECT 
	ProductID 
	from Product union all select ProductID 
	from Basket





SELECT * 
	FROM ProductDetail 
	WHERE ProductTax=(SELECT ProductTax FROM ProductDetail WHERE ProductID=3)





SELECT 
       PersonName,
     AVG(ProductPrice) AS AVGPRICE,
	 SUM(ProductPrice) AS TOTALPRICE
     

  from dbo.Person P1

    inner join Sales P2 on P1.PersonID=P2.PersonID
	inner join ProductDetail P3 on P2.ProductID=P3.ProductID
	
	
	GROUP BY PersonName
	  


