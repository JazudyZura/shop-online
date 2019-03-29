create database QL_SHOPONLINE
use  QL_SHOPONLINE
GO

CREATE TABLE CUSTOMER
(	ID_CUSTOMER INT IDENTITY(1,1) NOT NULL,
	NAME_CUSTOMER  nVarchar(50) NOT NULL,
	NAME_ACCOUNT Varchar(50) UNIQUE,
	PASSWORD Varchar(50) NOT NULL,
	EMAIL Varchar(100) UNIQUE,
	ADDRESS nVarchar(200),
	PHONE_NUMBER Varchar(50),
	BIRTHDAY DATETIME
	CONSTRAINT PK_CUSTOMER PRIMARY KEY(ID_CUSTOMER)
)

GO




CREATE TABLE ORDER_BILL
(
	ID_ORDER INT IDENTITY(1,1) NOT NULL,
	ID_CUSTOMER INT NOT NULL,
	UPDATE_ORDER DATETIME NOT NULL DEFAULT GETDATE(),
	STATUS_PAY BIT,
	DELIVERY_DATE DATETIME NOT NULL , --NGÀY GIAO HÀNG
	STATUS_TRANSPORTATION  bit,
	CONSTRAINT PK_ORDER PRIMARY KEY (ID_ORDER),
	
	CONSTRAINT FK_ORDER_CUSTOMER FOREIGN KEY (ID_CUSTOMER )REFERENCES dbo.CUSTOMER(ID_CUSTOMER),
	
)
GO


 

Create Table CATEGORIES-- nhom loai san pham
(
	ID_CATEGORIES char (1) not null,
	NAME_CATEGORIES nvarchar(50) NOT NULL,
	CONSTRAINT PK_CATEGORIES PRIMARY KEY(ID_CATEGORIES)
)
GO



insert into dbo.CATEGORIES
        ( ID_CATEGORIES, NAME_CATEGORIES )
VALUES  ( 'B', -- ID_CATEGORIES - char(5)
          N'BAGS'  -- NAME_CATEGORIES - nvarchar(50)
          )
INSERT INTO dbo.CATEGORIES
        ( ID_CATEGORIES, NAME_CATEGORIES )
VALUES  ( 'C', -- ID_CATEGORIES - char(5)
          N'CLOTHINGS '  -- NAME_CATEGORIES - nvarchar(50)
          )	
INSERT INTO dbo.CATEGORIES
        ( ID_CATEGORIES, NAME_CATEGORIES )
VALUES  ( 'H', -- ID_CATEGORIES - char(5)
          N'HATS'  -- NAME_CATEGORIES - nvarchar(50)
          )	  
INSERT INTO dbo.CATEGORIES
        ( ID_CATEGORIES, NAME_CATEGORIES )
VALUES  ( 'S', -- ID_CATEGORIES - char(5)
          N'SNEAKERS'  -- NAME_CATEGORIES - nvarchar(50)
          )

CREATE TABLE PRODUCT      -- BẢNG QUẦN ÁO
(
	ID_PRODUCT INT IDENTITY(1,1) NOT NULL,
	ID_CATEGORIES char(1) NOT NULL,
	NAME_PRODUCT NVARCHAR(100) NOT NULL,
	PRICE FLOAT NOT NULL,--GIA BAN
	DETAILS NVarchar(Max),--ThongTin KY THUAT 
	SPECIFICATION NVarchar(Max),--ThongTin MO TA
	IMAGES1 VARCHAR(50),
	IMAGES2 VARCHAR(50),
	IMAGES3 VARCHAR(50),
	IMAGES4 VARCHAR(50),
	UPDATE_DAY DATETIME NOT NULL DEFAULT GETDATE(),--NGAY CAP NHAT TU DONG CAP NHATTHEO HE THONG
	NUMBER INT NOT NULL,--SO LUONG
	
	Constraint PK_PRODUCT Primary Key(ID_PRODUCT),
	Constraint FK_PRODUCT Foreign Key(ID_CATEGORIES) References dbo.CATEGORIES(ID_CATEGORIES),
	
)
GO

CREATE TABLE DETAIL_ORDER
(
	
	ID_ORDER INT NOT NULL,
	ID_PRODUCT INT NOT NULL,
	NUMBER Int Check(NUMBER>0),
	PRICE FLOAT Check(PRICE>=0),
	
	CONSTRAINT PK_DETAIL_ORDER PRIMARY KEY(ID_PRODUCT,ID_ORDER),
	
	CONSTRAINT FK_ORDER_DETAIL FOREIGN KEY (ID_ORDER) REFERENCES dbo.ORDER_BILL(ID_ORDER),
	CONSTRAINT FK_PRODUCT_DETAIL FOREIGN KEY (ID_PRODUCT) REFERENCES dbo.PRODUCT(ID_PRODUCT),

)
GO
--DROP TABLE dbo.DETAIL_ORDER


INSERT INTO dbo.PRODUCT
        (
          ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 
          'C' , -- ID_CATEGORIES - char(5)
          N'Checkered Loose Fit Shirt' , -- NAME_PRODUCT - nvarchar(100)
          '26' , -- PRICE - decimal
          N'Material	Polyester' , -- DETAILS - nvarchar(max)
          N'Revive the classic 90s trend with this boyfriend shirt! It comes with a timeless checkered pattern, a point collar, a button-down front closure, one chest pocket, and long sleeves with buttoned cuffs. This piece would look best tied around your waist, and partnered with your white sleeveless top, denim cutoff shorts, and low cut sneakers.' , -- SPECIFICATION - nvarchar(max)
          'CLO2.jpg' , -- IMAGES1 - varchar(50)
          'clo21.jpg' , -- IMAGES2 - varchar(50)
          'clo22.jpg' , -- IMAGES3 - varchar(50)
          'clo23.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          25  -- NUMBER - int
        )

INSERT INTO dbo.PRODUCT
        ( 
          ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 
          's' , -- ID_CATEGORIES - char(5)
          N'New Balance WX608RG1_NBPT8F901E' , -- NAME_PRODUCT - nvarchar(100)
          99.0 , -- PRICE - float
          N'Upper: synthetic leather, natural leather (leather) / window: EVA + rubber
color	Option Notes
size	Option Notes
Height (Y, N)	N
Height information	-
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	INDONESIA' , -- DETAILS - nvarchar(max)
          N'Do not wipe it in water.
Keep it in a place with low temperature and humidity and good ventilation.
Use of insect repellent, such as naphthalene, near the flame may cause deformation or discoloration, so please refrain.
Keeping it closely with other leather products or other material products may cause transfer, so please refrain.' , -- SPECIFICATION - nvarchar(max)
          'snk1.ipg' , -- IMAGES1 - varchar(50)
          'snk11.jpg' , -- IMAGES2 - varchar(50)
          'snk12.jpg' , -- IMAGES3 - varchar(50)
          'snk13.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          0  -- NUMBER - int
        )

		GO
		UPDATE dbo.PRODUCT SET NUMBER= 50 WHERE NAME_PRODUCT LIKE  N'New Balance WX608RG1_NBPT8F901E'
		GO
        
INSERT INTO dbo.PRODUCT
        ( ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 's' , -- ID_CATEGORIES - char(5)
          N'New Balance KV990PEI_NBPV6F921P' , -- NAME_PRODUCT - nvarchar(100)
          59.0 , -- PRICE - float
          N'Upper: Synthetic leather, mesh / lining: Polyester / window: EVA + rubber
color	Option Notes
size	Option Notes
Height (Y, N)	-
Height information	-
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Eland World New Balance Division
Country of manufacture	Vietnam' , -- DETAILS - nvarchar(max)
          N'1. Please refrain from wiping in water. 
2. Store in a place where temperature and humidity are low and ventilation is good. 
3. Do not get close to firearms or use insect repellent such as naphthalene as it will cause deformation and discoloration. 
4. Please keep it close to leather products or other materials.

Natural leather ( leather ) How to care' , -- SPECIFICATION - nvarchar(max)
          'snk2.jpg' , -- IMAGES1 - varchar(50)
          'snk21.jpg' , -- IMAGES2 - varchar(50)
          'snk22.jpg' , -- IMAGES3 - varchar(50)
          'snk23.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          52  -- NUMBER - int
        )
		GO
        
INSERT INTO dbo.PRODUCT
        ( ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 'C' , -- ID_CATEGORIES - char(5)
          N'UNI CLASSIC POLARTEC® FlyAnolac' , -- NAME_PRODUCT - nvarchar(100)
          219.0 , -- PRICE - float
          N'Outer material 1: Polyester 100% / Outer material 2: Nylon 100%
color	Option Notes
size	Option Notes
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	VIETNAM' , -- DETAILS - nvarchar(max)
          N'Please wash with neutral detergent.
Use chlorine, oxygen bleach, deformation, it will cause discoloration, please refrain.
If the detergent touches the clothes, it will cause partial discoloration, so please completely wash the detergent.
Washing together with dark color and white color products may cause dye transfer. Separate or wash separately.
If you immerse in water for a long time (more than 30 minutes), please dehydrate and dry immediately
If dried in the shade during drying, you can prevent discoloration by daylight.' , -- SPECIFICATION - nvarchar(max)
          'clo3.jpg' , -- IMAGES1 - varchar(50)
          'clo31.jpg' , -- IMAGES2 - varchar(50)
          'clo32.jpg' , -- IMAGES3 - varchar(50)
          'clo33.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          90  -- NUMBER - int
        )

GO
INSERT INTO dbo.PRODUCT
        ( ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 'B' , -- ID_CATEGORIES - char(5)
          N'3Pockets Backpack' , -- NAME_PRODUCT - nvarchar(100)
          119.0 , -- PRICE - float
          N'Material	100% polyester%
color	Option Notes
size	Option Notes
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Eland World New Balance Division
Country of manufacture	INDONESIA' , -- DETAILS - nvarchar(max)
          N'1. Do not use detergents with bleach or bleach. 
2. Hand washable materials should be handled at temperatures below 30 ° C. However, do not immerse in water for a long time. 
3. Separate or wash separately from other color products. 
4. After washing, remove as much moisture as possible. 
5. Please refrain from rubbing the surface roughly. 
6. For leather, use only leather cleaner. ' , -- SPECIFICATION - nvarchar(max)
          'bag1.jpg' , -- IMAGES1 - varchar(50)
          'bag12.jpg' , -- IMAGES2 - varchar(50)
          'bag13.jpg' , -- IMAGES3 - varchar(50)
          'bag11.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          39  -- NUMBER - int
        )
		GO
INSERT INTO dbo.PRODUCT
        ( ID_CATEGORIES ,
          NAME_PRODUCT ,
          PRICE ,
          DETAILS ,
          SPECIFICATION ,
          IMAGES1 ,
          IMAGES2 ,
          IMAGES3 ,
          IMAGES4 ,
          UPDATE_DAY ,
          NUMBER
        )
VALUES  ( 'B' , -- ID_CATEGORIES - char(5)
          N'3D SQUARE BACKPACK' , -- NAME_PRODUCT - nvarchar(100)
          149.0 , -- PRICE - float
          N'Material	Outer: 100% nylon / Lining: 100% polyester
color	Option Notes
size	Width 30.5 / length 47 / width 18.5
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	Vietnam' , -- DETAILS - nvarchar(max)
          N'1. Do not use detergents with bleach or bleach. 
2. Hand washable materials should be handled at temperatures below 30 ° C. However, do not immerse in water for a long time. 
3. Separate or wash separately from other color products. 
4. After washing, remove as much moisture as possible. 
5. Please refrain from rubbing the surface roughly. ' , -- SPECIFICATION - nvarchar(max)
          'bag2.jpg' , -- IMAGES1 - varchar(50)
          'bag21.jpg' , -- IMAGES2 - varchar(50)
          'bag22.jpg' , -- IMAGES3 - varchar(50)
          'bag23.jpg' , -- IMAGES4 - varchar(50)
          GETDATE() , -- UPDATE_DAY - datetime
          29  -- NUMBER - int
        ),
		( 'B' ,  N'WT_FLEECE SACOCHE' , 49.0 ,  N'Kinds	Sako Shoba
Material	Outer: 100% nylon, Lining: 100% polyester
color	Option Notes
size	Width 30 / length 21.5
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	Indonesia' , N'1. Do not use detergents with bleach or bleach. 
2. Hand washable materials should be handled at temperatures below 30 ° C. However, do not immerse in water for a long time. 
3. Separate or wash separately from other color products. 
4. After washing, remove as much moisture as possible. 
5. Please refrain from rubbing the surface roughly. 
6. For leather, use only leather cleaner. ' , 'bag3.jpg' , 'bag31.jpg' ,  'bag32.jpg' ,  'bag33.jpg' ,  GETDATE() ,  50  ),
		( 'S' ,  N'MSX90SID_NBPD8F908B' , 169.0 ,  N'Upper: leather (pig leather, cowhide), polyester, synthetic leather / window: Rubber
color	Option Notes
size	Option Notes
Height (Y, N)	N
Height information	-
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	CHINA' , N'If it gets wet, wipe it with a cotton cloth immediately. If dried directly with direct sunlight or heat, it will cause deformation and deterioration.
Do not store in a container with low air permeability, such as plastic bags, because it may cause mold if the humidity is high.
You can use the product for a long time if you care about once a week with a cream exclusive for leather.
If it gets dirty, clean it with leather cream. Never use general cleaner or benzene.
Since leather dyes are water-based, cotton, cotton, etc. may be contaminated with white natural fibers, so please be careful about moisture and sweat.' , 'snk3.jpg' , 'snk31.jpg' ,  'snk32.jpg' ,  'snk33.jpg' ,  GETDATE() ,  50  ),
		( 'S' ,  N'MS574LSW_NBPD8F842W' , 159.0 ,  N'Upper: leather (leather), mesh, synthetic leather / window: EVA + rubber
color	Option Notes
size	Option Notes
Height (Y, N)	N
Height information	-
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World New Balance Division
Country of manufacture	Vietnam' , N'Light dirt is wiped off with a nylon or brush, and dust is removed and the hair is clean.
Please note that wetting with water may cause stains, discoloration, and deformation. If it gets wet, immediately wash it off with a soft cloth.
Use of cleaner may cause discoloration and discoloration, so please use the exclusive product after checking the manual.' , 'snk4.jpg' , 'snk41.jpg' ,  'snk42.jpg' ,  'snk43.jpg' ,  GETDATE() ,  50  ),
		( 'S' ,  N'Mongch Sneakers ' , 24.0 ,  N'100% synthetic leather
color	(91) Silver
size	230,240,250
Height (Y, N)	Y
Height information	3cm
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Lee Land World Co., Ltd.
Country of manufacture	CHINA' , N'Light dirt is wiped off with a nylon or brush, and dust is removed and the hair is clean.
Please note that wetting with water may cause stains, discoloration, and deformation.' , 'snk5.jpg' , 'snk51.jpg' ,  'snk52.jpg' ,  'snk53.jpg' ,  GETDATE() ,  60  ),
		( 'S' ,  N'Adidas sneakers approach' , 125.0 ,  N'Upper: 100% polyester / Synthetic rubber Lining: 100% polyester Window: Special compound Synthetic rubber
color	White
size	250/255/260/265/270/275/280 (unit: mm)
Height (Y, N)	No content
Height information	2
Imported (Y, N)	Store genuine
Manufacturer (importer for imported goods)	Adidas / Adidas
Country of manufacture	Vietnam' , N'We will compensate you according to the consumer damage compensation regulations.
A / S person in charge and telephone number	The People 070-8817-2909' , 'snk6.jpg' , 'snk61.jpg' ,  'snk62.jpg' ,  'snk63.jpg' ,  GETDATE() ,  54  ),
		( 'B' ,  N'Max Cube Backpack ' , 29.0 ,  N'Material	[Outer] 100% polyester [Lining] Polyester 100%
color	00 WHITE / 09 BLACK / 78 NAVY
size	[FR size guide / unit: cm] Width 32 Length 43 width 11.5 (There may be some errors depending on the location of the beige.)
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Eland Retail
Country of manufacture	Vietnam' , N'It is the price and benefit of "NC Kang Book Store" standard.' , 'bag4.jpg' , 'bag41.jpg' ,  'bag42.jpg' ,  'bag43.jpg' ,  GETDATE() ,  50  ),
		( 'C' ,  N'Anchor Simple Polo' , 12.0 ,  N'[Outer] 100% cotton
color	00 WHITE, 06 CHARCOAL, 09 BLACK, 10 RED, 78 NAVY
size	[Based on size 130 / Unit: cm] Chest width 42 Shoulder width 35 Sleeve length 50 Total length 51 (There may be some errors depending on the location.)
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Lee Land Retail Co., Ltd.
Country of manufacture	Bangladesh' , N'Subject to relevant laws and consumer dispute resolution standards
A / S person in charge and telephone number	Eland Retail Co., Ltd. 1899-9500' , 'clo4.jpg' , 'clo41.jpg' ,  'clo42.jpg' ,  'clo43.jpg' ,  GETDATE() ,  20  ),
		( 'H' ,  N'Ball cap COURT SIDE HAT_White' , 25.0 ,  N'Material	Surface: 100% cotton
size	FREE
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World Folder Division
Country of manufacture	China' , N'Subject to the relevant laws and the Fair Trade Commission Notice of Consumer Dispute Resolution Standards.' , 'hat1.jpg' , 'hat11.jpg' ,  'hat12.jpg' ,  'hat13.jpg' ,  GETDATE() ,  46  ),
		( 'H' ,  N'OLYMPUS HAT' , 20.0 ,  N'See detailed image
color	Color: Khaki / Navy
size	Size: 56/58/60
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	SALEWA
Country of manufacture	Vietnam' , N'1. Hand wash for a short time (less than 10 minutes) 2. Do not use bleach or fabric softener and do not rub it 3. Do not use dryer and dry in shade 4. Wash it immediately because it may cause discoloration in sweat or water 5 Please note that it will be burned on cigarette or flame. 6. Due to the nature of the filler, hair may come out from the needle hole.' , 'hat2.jpg' , 'hat21.jpg' ,  'hat22.jpg' ,  'hat23.jpg' ,  GETDATE() ,  50  ),
		( 'H' ,  N'Ball Cap COURT SIDE HAT_Pink' , 23.0 ,  N'Surface: 100% cotton
size	FREE
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World Folder Division
Country of manufacture	China' , N'Subject to the relevant laws and the Fair Trade Commission Notice of Consumer Dispute Resolution Standards.' , 'hat3.jpg' , 'hat31.jpg' ,  'hat33.jpg' ,  'hat32.jpg' ,  GETDATE() ,  30  ),
		( 'H' ,  N'Beanie' , 22.0 ,  N'No content
size	No content
Imported (Y, N)	income
Manufacturer (importer for imported goods)	KAPPA
Country of manufacture	China' , N'Subject to relevant laws and consumer dispute resolution standards' , 'hat4.jpg' , 'hat41.jpg' ,  'hat42.jpg' ,  'hat43.jpg' ,  GETDATE() ,  50  ),
		( 'H' ,  N'Snoopy Ball Cap' , 12.0 ,  N'Material	100% cotton
size	FREE
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Eland World Co., Ltd.
Country of manufacture	Vietnam' , N'[Dry cleaning] Keep away from direct heat source when drying. If left wet for a long time by sweat and rain, there is a risk of discoloration. This product must be dry-cleaned. Do not add fiber modifiers. Product damage caused by consumer negligence is not covered. Due to the nature of the material, lint may be generated by frequent friction. Please keep it with the desiccant when storing for a long time. caution! Please be careful that small parts can be swallowed if swallowed. Please fasten zipper / button / snap and turn over after washing. Cover the cloth with your legs. Do not use fluorescent bleach. Do not swing or twist.' , 'hat5.jpg' , 'hat51.jpg' ,  'hat52.jpg' ,  'hat53.jpg' ,  GETDATE() ,  80  ),
		( 'C' ,  N'Monster University sweat pants' , 12.0 ,  N'100% cotton
color	PURPLE, BLACK, NAVY
size	S, M, L, XL
Imported (Y, N)	N
Manufacturer (importer for imported goods)	Eland World Co., Ltd.
Country of manufacture	Korea' , N'[Washing water] Keep away from direct heat source when drying. Please flip it over. If left wet for a long time due to sweat and rain, there is a risk of discoloration. Do not immerse in water. Wash the same collar. Do not add fiber modifiers. Product damage due to consumer negligence can not be compensated. Due to the nature of the material, frequent friction can cause lint. Please keep it with the desiccant when storing for a long time. caution! Please note that small parts can be swallowed if swallowed. Zipper / Button / Snap, etc., please wipe off after washing. Cover the cloth with your legs. Do not use fluorescent bleach. Do not swing or twist' , 'clo5.jpg' , 'clo51.jpg' ,  'clo52.jpg' ,  'clo53.jpg' ,  GETDATE() ,  50  ),
		( 'H' ,  N'Fila_ hat_F LOGO CAP Black' , 23.0 ,  N'100% cotton
color	Black
size	FREE
Imported (Y, N)	N
Manufacturer (importer for imported goods)	E-Land World Folder Division   
Country of manufacture	Korea' , N' Subject to the relevant laws and the Fair Trade Commission Notice of Consumer Dispute Resolution Standards.' , 'hat6.jpg' , 'hat61.jpg' ,  'hat62.jpg' ,  'hat63.jpg' ,  GETDATE() ,  70  ),
		( 'C' ,  N'Fila _ one-man 3D logo embroidered one-man _BLAC' , 34.0 ,  N'Cotton 84%, polyester 16%
color	BLACK
size	SML
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	E-Land World Folder Division
Country of manufacture	Vietnam' , N'not like this product, 
please sign in first. Close Close Close Close Close Close Close Close Close Save on Desktop [Icon Name] Enter yourself ₩ 0 [ . 
This item is eligible for Free International Shipping 
The product reviews and photos you have written can be used for commercial purposes.	' , 'clo6.jpg' , 'clo61.jpg' ,  'clo62.jpg' ,  'clo63.jpg' ,  GETDATE() ,  50  ),
		( 'S' ,  N'Ugly sneakers' , 35.0 ,  N'running shoes
color	(19) Black, (25) Pink
size	230,240,250
Height (Y, N)	Y
Height information	4cm
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Lee Land World Co., Ltd.
Country of manufacture	CHINA' , N'Handling Precautions	Handling caution reference
Quality assurance standards	Subject to relevant laws and consumer dispute resolution standards' , 'snk7.jpg' , 'snk71.jpg' ,  'snk72.jpg' ,  'snk73.jpg' ,  GETDATE() ,  50  ),
		( 'B' ,  N'Bunker messenger' , 22.0 ,  N'Material	100% polyester%
color	Light Gray, Black
size	FREE
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	Lee Land World Co., Ltd.
Country of manufacture	Vietnam' , N'Handling Precautions	Handling caution reference
Quality assurance standards	Subject to relevant laws and consumer dispute resolution standards' , 'bag5.jpg' , 'bag51.jpg' ,  'bag52.jpg' ,  'bag53.jpg' ,  GETDATE() ,  50  ),
		( 'B' ,  N'Pocket Messenger' , 25.0 ,  N'Material	100% polyester%
color	(10) White / (19) Black / (25) Pink / (CD) Light Violet
size	FREE
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	WOO-A VINA CO., LTD
Country of manufacture	Vietnam' , N'Handling Precautions	Handling caution reference
Quality assurance standards	Subject to relevant laws and consumer dispute resolution standards' , 'bag6.jpg' , 'bag61.jpg' ,  'bag62.jpg' ,  'bag63.jpg' ,  GETDATE() ,  40  ),
		
		( 'C' ,  N'Denim slit long skirt' , 47.0 ,  N'Polyester 51% Cotton 36% Rayon 13%
color	LIGHT INDIGO
size	24, 26, 28
Imported (Y, N)	Y
Manufacturer (importer for imported goods)	YINGKOU HONGDIGAMENT CO.LTD
Country of manufacture	China' , N'- Do not rinse with water, wash it with your hand or tap lightly. 
- Do not immerse in water containing detergent for more than 30 minutes. 
- For dark colors and light colors, please wash separately. 
- If left wet by sweat and rain for a long time, there is a risk of discoloration. 
- In case of embroidery fabric, please avoid severe friction. 
- Damage caused by consumer negligence is not covered.' , 'clo7.jpg' , 'clo71.jpg' ,  'clo72.jpg' ,  'clo73.jpg' ,  GETDATE() ,  55  )
       
          
  GO
 SELECT * FROM dbo.PRODUCT   
      
     GO
SELECT * FROM dbo.ORDER_BILL
         
CREATE TABLE ADMIN
( 
	USERNAME VARCHAR(30) NOT NULL,
	PASSWORD VARCHAR(30) NOT NULL,
	NAME NVARCHAR(50) NOT NULL,
	Constraint PK_ADMIN Primary Key(USERNAME)
 )         
          
		  GO
INSERT INTO dbo.ADMIN
        ( USERNAME, PASSWORD, NAME )
VALUES  ( 'LN', -- USERNAME - varchar(30)
          '96', -- PASSWORD - varchar(30)
          N'lE NI'  -- NAME - nvarchar(50)
          )
GO

INSERT INTO dbo.CUSTOMER
        ( NAME_CUSTOMER ,
          NAME_ACCOUNT ,
          PASSWORD ,
          EMAIL ,
          ADDRESS ,
          PHONE_NUMBER ,
          BIRTHDAY
        )
VALUES  ( N'zura' , -- NAME_CUSTOMER - nvarchar(50)
          'zu' , -- NAME_ACCOUNT - varchar(50)
          '123' , -- PASSWORD - varchar(50)
          'fdhdfgh@mail.com' , -- EMAIL - varchar(100)
          N'gsdfhy' , -- ADDRESS - nvarchar(200)
          '01265468' , -- PHONE_NUMBER - varchar(50)
          GETDATE()  -- BIRTHDAY - datetime
        )

SELECT *FROM dbo.CUSTOMER
SELECT *FROM dbo.ORDER_BILL