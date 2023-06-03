--------------------------------------------------------------------------------------------------------
-- PART 1 : Creating tables

-- 1 
Create table `supplier` (
 `SUPP_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `SUPP_NAME` varchar(50) NOT NULL,
 `SUPP_CITY` varchar(50) NOT NULL,
 `SUPP_PHONE` varchar(50) NOT NULL,
 PRIMARY KEY (`SUPP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 2
Create table `customer` (
 `CUS_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `CUS_NAME` varchar(20) NOT NULL,
 `CUS_PHONE` varchar(10) NOT NULL,
 `CUS_CITY` varchar(30) NOT NULL,
 `CUS_GENDER` enum('M','F') NOT NULL,
 PRIMARY KEY (`CUS_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 3
Create table `category` (
 `CAT_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `CAT_NAME` varchar(20) NOT NULL,
 PRIMARY KEY (`CAT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 4
Create table `product` (
 `PRO_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `PRO_NAME` varchar(20) NOT NULL DEFAULT 'Dummy',
 `PRO_DESC` varchar(60) NOT NULL,
 `CAT_ID` int unsigned DEFAULT NULL,
 PRIMARY KEY (`PRO_ID`),
 KEY `CAT_ID` (`CAT_ID`),
 CONSTRAINT `product_ibfk_1` FOREIGN KEY (`CAT_ID`) REFERENCES `category` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


-- 5 
Create table `supplier_pricing` (
 `PRICING_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `PRO_ID` int unsigned DEFAULT NULL,
 `SUPP_ID` int unsigned DEFAULT NULL,
 `SUPP_PRICE` int unsigned DEFAULT '0',
 PRIMARY KEY (`PRICING_ID`),
 KEY `PRO_ID` (`PRO_ID`),
 KEY `SUPP_ID` (`SUPP_ID`),
 CONSTRAINT `supplier_pricing_ibfk_1` FOREIGN KEY (`PRO_ID`) REFERENCES `product` (`PRO_ID`),
 CONSTRAINT `supplier_pricing_ibfk_2` FOREIGN KEY (`SUPP_ID`) REFERENCES `supplier` (`SUPP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 6
Create table `order` (
  `ORD_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `ORD_AMOUNT` int NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUS_ID` int unsigned DEFAULT NULL,
  `PRICING_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ORD_ID`),
  KEY `CUS_ID` (`CUS_ID`),
  KEY `PRICING_ID` (`PRICING_ID`),
  CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CUS_ID`) REFERENCES `customer` (`CUS_ID`),
  CONSTRAINT `order_ibfk_2` FOREIGN KEY (`PRICING_ID`) REFERENCES `supplier_pricing` (`PRICING_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- 7
Create table `rating` (
 `RAT_ID` int unsigned NOT NULL AUTO_INCREMENT,
 `ORD_ID` int unsigned DEFAULT NULL,
 `RAT_RATSTARTS` int NOT NULL,
 PRIMARY KEY (`RAT_ID`),
 KEY `ORD_ID` (`ORD_ID`),
 CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`ORD_ID`) REFERENCES `order` (`ORD_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
--------------------------------------------------------------------------------------------------------
-- PART 2 : Inserting values

-- 1
INSERT INTO SUPPLIER VALUES(1,"Rajesh Retails","Delhi",'1234567890');
INSERT INTO SUPPLIER VALUES(2,"Appario Ltd.","Mumbai",'2589631470');
INSERT INTO SUPPLIER VALUES(3,"Knome products","Banglore",'9785462315');
INSERT INTO SUPPLIER VALUES(4,"Bansal Retails","Kochi",'8975463285');
INSERT INTO SUPPLIER VALUES(5,"Mittal Ltd.","Lucknow",'7898456532');

-- 2
INSERT INTO CUSTOMER VALUES(1,"AAKASH",'9999999999',"DELHI",'M');
INSERT INTO CUSTOMER VALUES(2,"AMAN",'9785463215',"NOIDA",'M');
INSERT INTO CUSTOMER VALUES(3,"NEHA",'9999999999',"MUMBAI",'F');
INSERT INTO CUSTOMER VALUES(4,"MEGHA",'9994562399',"KOLKATA",'F');
INSERT INTO CUSTOMER VALUES(5,"PULKIT",'7895999999',"LUCKNOW",'M');

-- 3
INSERT INTO CATEGORY VALUES( 1,"BOOKS");
INSERT INTO CATEGORY VALUES(2,"GAMES");
INSERT INTO CATEGORY VALUES(3,"GROCERIES");
INSERT INTO CATEGORY VALUES (4,"ELECTRONICS");
INSERT INTO CATEGORY VALUES(5,"CLOTHES");

-- 4
INSERT INTO PRODUCT VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2);
INSERT INTO PRODUCT VALUES(2,"TSHIRT","SIZE-L with Black, Blue and White variations",5);
INSERT INTO PRODUCT VALUES(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD",4);
INSERT INTO PRODUCT VALUES(4,"OATS","Highly Nutritious from Nestle",3);
INSERT INTO PRODUCT VALUES(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1);
INSERT INTO PRODUCT VALUES(6,"MILK","1L Toned MIlk",3);
INSERT INTO PRODUCT VALUES(7,"Boat EarPhones","1.5Meter long Dolby Atmos",4);
INSERT INTO PRODUCT VALUES(8,"Jeans","Stretchable Denim Jeans with various sizes and color",5);
INSERT INTO PRODUCT VALUES(9,"Project IGI","compatible with windows 7 and above",2);
INSERT INTO PRODUCT VALUES(10,"Hoodie","Black GUCCI for 13 yrs and above",5);
INSERT INTO PRODUCT VALUES(11,"Rich Dad Poor Dad","Written by RObert Kiyosaki",1);
INSERT INTO PRODUCT VALUES(12,"Train Your Brain","By Shireen Stephen",1);

-- 5
INSERT INTO SUPPLIER_PRICING VALUES(1,1,2,1500);
INSERT INTO SUPPLIER_PRICING VALUES(2,3,5,30000);
INSERT INTO SUPPLIER_PRICING VALUES(3,5,1,3000);
INSERT INTO SUPPLIER_PRICING VALUES(4,2,3,2500);
INSERT INTO SUPPLIER_PRICING VALUES(5,4,1,1000);
INSERT INTO SUPPLIER_PRICING VALUES(6,12,2,780);
INSERT INTO SUPPLIER_PRICING VALUES(7,12,4,789);
INSERT INTO SUPPLIER_PRICING VALUES(8,3,1,31000);
INSERT INTO SUPPLIER_PRICING VALUES(9,1,5,1450);
INSERT INTO SUPPLIER_PRICING VALUES(10,4,2,999);
INSERT INTO SUPPLIER_PRICING VALUES(11,7,3,549);
INSERT INTO SUPPLIER_PRICING VALUES(12,7,4,529);
INSERT INTO SUPPLIER_PRICING VALUES(13,6,2,105);
INSERT INTO SUPPLIER_PRICING VALUES(14,6,1,99);
INSERT INTO SUPPLIER_PRICING VALUES(15,2,5,2999);
INSERT INTO SUPPLIER_PRICING VALUES(16,5,2,2999);

-- 6
INSERT INTO `ORDER` VALUES (101,1500,"2021-10-06",2,1);
INSERT INTO `ORDER` VALUES(102,1000,"2021-10-12",3,5);
INSERT INTO `ORDER` VALUES(103,30000,"2021-09-16",5,2);
INSERT INTO `ORDER` VALUES(104,1500,"2021-10-05",1,1);
INSERT INTO `ORDER` VALUES(105,3000,"2021-08-16",4,3);
INSERT INTO `ORDER` VALUES(106,1450,"2021-08-18",1,9);
INSERT INTO `ORDER` VALUES(107,789,"2021-09-01",3,7);
INSERT INTO `ORDER` VALUES(108,780,"2021-09-07",5,6);
INSERT INTO `ORDER` VALUES(109,3000,"2021-09-10",5,3);
INSERT INTO `ORDER` VALUES(110,2500,"2021-09-10",2,4);
INSERT INTO `ORDER` VALUES(111,1000,"2021-09-15",4,5);
INSERT INTO `ORDER` VALUES(112,789,"2021-09-16",4,7);
INSERT INTO `ORDER` VALUES(113,31000,"2021-09-16",1,8);
INSERT INTO `ORDER` VALUES(114,1000,"2021-09-16",3,5);
INSERT INTO `ORDER` VALUES(115,3000,"2021-09-16",5,3);
INSERT INTO `ORDER` VALUES(116,99,"2021-09-17",2,14);

-- 7
INSERT INTO RATING VALUES(1,101,4);
INSERT INTO RATING VALUES(2,102,3);
INSERT INTO RATING VALUES(3,103,1);
INSERT INTO RATING VALUES(4,104,2);
INSERT INTO RATING VALUES(5,105,4);
INSERT INTO RATING VALUES(6,106,3);
INSERT INTO RATING VALUES(7,107,4);
INSERT INTO RATING VALUES(8,108,4);
INSERT INTO RATING VALUES(9,109,3);
INSERT INTO RATING VALUES(10,110,5);
INSERT INTO RATING VALUES(11,111,3);
INSERT INTO RATING VALUES(12,112,4);
INSERT INTO RATING VALUES(13,113,2);
INSERT INTO RATING VALUES(14,114,1);
INSERT INTO RATING VALUES(15,115,1);
INSERT INTO RATING VALUES(16,116,0);

--------------------------------------------------------------------------------------------------------
-- PART 3 : Queries

-- 4) Display the total number of customers based on gender who have placed individual
--    orders of worth at least Rs.3000.

select cus.CUS_GENDER, Count(DISTINCT cus.CUS_ID) as TotalCustomers 
from `customer` cus
join `order` ord on ord.cus_id = cus.cus_id
where ord.ord_amount >= 3000
group by cus.CUS_GENDER
;

-- 5) Display all the orders along with product name ordered by a customer having Customer_Id=2

select cus.cus_name, cus.cus_city, pro.pro_name, pro.pro_desc, sp.supp_price, ord.ord_amount 
from `customer` cus
join `order` ord on ord.cus_id = cus.cus_id
join `supplier_pricing` sp on ord.pricing_id = sp.pricing_id
join `product` pro on sp.pro_id = pro.pro_id
where cus.cus_id=2
;

-- 6) Display the Supplier details who can supply more than one product

select supp.SUPP_NAME,supp.SUPP_CITY, supp.SUPP_PHONE, count(pro.PRO_NAME) as num_of_products  
from `supplier` supp
join `supplier_pricing` sp on sp.supp_id = supp.supp_id 
join `product` pro on sp.PRO_ID=pro.PRO_ID
group by supp.supp_name
having count(pro.PRO_NAME) > 1
;

-- 7) Find the least expensive product from each category and print the table with category id, 
--    name, product name and price of the product

select cat.cat_id, cat.cat_name, pro.pro_name, min(sp.supp_price) 
from `category` cat
join `product` pro on cat.cat_id=pro.cat_id
join `supplier_pricing` sp on pro.pro_id = sp.pro_id
where sp.supp_price in 
(select min(sp2.supp_price) from supplier_pricing sp2 
join `product` pro2 on pro2.pro_id = sp2.pro_id where pro2.cat_id = cat.cat_id)
group by cat.cat_id, cat.cat_name
;

-- 8) Display the Id and Name of the Product ordered after “2021-10-05”.

select cus.cus_name, ord.ord_amount, ord.ord_date, pro.pro_name, pro.PRO_DESC  
from `order` as ord
join supplier_pricing as sp on ord.PRICING_ID=sp.PRICING_ID
inner join product as pro on sp.pro_id=pro.PRO_ID   
inner join customer as cus on ord.CUS_ID=cus.cus_id
where ord.ORD_DATE > "2021-09-01";

-- 9) Display customer name and gender whose names start or end with character 'A'.

select cus.cus_name,cus.cus_gender 
from customer cus 
where cus.cus_name like 'A%' or cus.cus_name like '%A';

-- 10) Create a stored procedure to display supplier id, name, Rating(Average rating of all the 
--     products sold by every customer) and Type_of_Service. For Type_of_Service, If rating =5, 
--     print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
--     Service” else print “Poor Service”. Note that there should be one rating per supplier.

DELIMITER //
CREATE PROCEDURE SupplierRating()
Begin
	select supp.supp_id,supp.supp_name, ROUND(avg(rat.rat_ratstarts),2) as rating,
	case when avg(rat.rat_ratstarts) = 5 then 'Excellent Service' 
	when  avg(rat.rat_ratstarts) > 4 then 'Good Service'
	when avg(rat.rat_ratstarts) > 2 then 'Average Service'
	else 'Poor Service'
	end as "Type_of_Service"
	from supplier supp
	join supplier_pricing sp on sp.SUPP_ID=supp.SUPP_ID
	join `order` ord on ord.PRICING_ID = sp.PRICING_ID
	join rating rat on rat.ORD_ID = ord.ORD_ID
	group by supp.supp_ID,supp.supp_name;
END //
DELIMITER ;

call SupplierRating;

--------------------------------------------------------------------------------------------------------
-- END 
--------------------------------------------------------------------------------------------------------








