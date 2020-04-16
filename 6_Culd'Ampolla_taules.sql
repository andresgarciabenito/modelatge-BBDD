SHOW DATABASES;
USE mydb;
SHOW TABLES;

DESCRIBE address;
SELECT * FROM address;

INSERT INTO address (street,number,floor,door,city,zip,country,id) 
VALUES ('Avenida Meridiana',100,1,'A','Barcelona',08027,'España',1),
('Passeig de Maragall',100,2,'B','Barcelona',08041,'España',2),
('Carrer Maria Claret',100,3,'C','Barcelona',08041,'España',3),
('Avenida Diagonal',100,4,'D','Barcelona',08019,'España',4),
('Ronda del Guinardó',100,5,'E','Barcelona',08025,'España', 5);

SELECT * FROM customer;

INSERT INTO customer (id,name,address,phone,referral,registration) 
VALUES (00001, 'Andreu Vila','Avenida Meridiana 100 1A',+34000000001,'',20190305),
(00002,'Marc Martinez','Passeig de Maragall 200 2B',+34000000002,00001,0190306),
(00003,'Josep García','Carrer Maria Claret 300 3C',+34000000003,00002,20190307),
(00004,'Alan Torres','Avenida Diagonal 400 4D',+34000000004,00003,20190308),
(00005,'Jordi Navas','Ronda del Guinardó 500 5D',+34000000005,00004,20190309);
SELECT * FROM customer;

SELECT * FROM address;

DELETE FROM address WHERE id=1;
DELETE FROM address WHERE id=2;
DELETE FROM address WHERE id=3;
DELETE FROM address WHERE id=4;
DELETE FROM address WHERE id=5;

SELECT * FROM address;
/* borramos todo el contenido de address que estaba errado
y lo cargamos de nuevo corregid0*/

INSERT INTO address (street,number,floor,door,city,zip,country,id) 
VALUES ('Longwan St',100,1,'A','Zhejiang Sheng',08027,'China',1),
('Yu Cang Dong St',100,2,'B','Zhejiang Sheng',08027,'China',2),
('Longwan St',100,3,'C','Zhejiang Sheng',08027,'China',3),
('Longwan St',100,4,'D','Zhejiang Sheng',08027,'China',4),
('Longwan St',100,5,'E','Zhejiang Sheng',08027,'China',5);

SELECT * FROM address;
SELECT * FROM supplier;

INSERT INTO supplier (id,name,phone,fax,NIF,Address_id) 
VALUES (00001, 'Supplier1','+8610000000001','+8610000000001','86454228',1),
(00002, 'Supplier2','+8610000000002','+8610000000002','03452701',2),
(00003, 'Supplier3','+8610000000003','+8610000000003','13608949',3),
(00004, 'Supplier4','+8610000000004','+8610000000004','27466194',4),
(00005, 'Supplier5','+8610000000005','+8610000000005','63524190',5);

SELECT * FROM glass;

INSERT INTO glass (Id,Brand,Graduation,FrameColour,GlassColour,FrameMaterial,Price,Supplier_Id) 
VALUES (0001,'Ace&Tate',0000,'Black','N/A','Acetate',25,00001),
(0002,'Polaroid',0000,'Grey','N/A','Acetate',25,00002),
(0003,'Marc&Miller',0000,'Blue','N/A','Acetate',25,00003),
(0004,'Lobster',0000,'Green','N/A','Acetate',25,00004),
(0005,'RayBan',0000,'Red','N/A','Acetate',25,00005);

SELECT * FROM glass;

SELECT * FROM salemanager;
INSERT INTO salemanager (Id,Name,Surname)
VALUES  (001,'Esteban','Buenasventas'),
(002,'Margaret','Vendepoco'),
(003,'Aurelio','Ahuyentaclientes'),
(004,'Rosalia','Liquidadora'),
(005,'Joan','Crackdestocks');

SELECT * FROM chart;
INSERT INTO chart (Id,Customer_Id,Sale_Manager_Id,Glass_Id,Glass_Price)
VALUES (001,00001,001,0001,25),
(002,00002,001,0002,25),
(003,00003,001,0003,25),
(004,00004,001,0004,25),
(005,00005,001,0005,25),
(006,00001,005,0001,25),
(007,00002,005,0002,25),
(008,00003,005,0003,25),
(009,00004,005,0004,25),
(010,00005,003,0005,25);


