--create a table
create table TBLDERSLER
( 
DERSID tinyint,
DERSAD varchar(20)
)

--We wanted to add a new column:
alter table TBLDERSLER
Add KONTENJAN smallint

--We wanted to delete the existing column:
alter table TBLDERSLER
drop column KONTENJAN

--select
select * from TBLOGRENCILER
SELECT OGRAD, OGRCINSIYET FROM TBLOGRENCILER

--select with conditions
SELECT * FROM TBLOGRENCILER WHERE OGRAD='Ali' 
SELECT * FROM TBLOGRENCILER WHERE OGRAD='Ali' or OGRKULUP= 'satran�'
SELECT * FROM TBLNOTLAR
SELECT (SINAV1 + SINAV2+  SINAV3)/3 FROM TBLNOTLAR 
SELECT t.OGRENCI as �d , (SINAV1 + SINAV2+  SINAV3)/3 as ortalama FROM TBLNOTLAR t order by OGRENCI

--INSERT
select * from TBLOGRENCILER
insert into TBLOGRENCILER(OGRAD, OGRSOYAD, OGRSEHIR) VALUES ( 'BARAN', 'Y�CEDA�', 'ELAZI�')

Insert into TBLNOTLAR (OGRENCI, DERS, SINAV1, SINAV3) VALUES (6, 2, 88, 67)

--delete

delete from TBLDERSLER where DERSID = 2

--TRUNCATE
truncate table TBLDERSLER -- RESET THE LESSONS TABLE.

--UPDATE

UPDATE TBLOGRENCILER set OGRCINSIYET = 'erkek' where OGRAD = 'baran'

insert into TBLNOTLAR (OGRENCI, ders, s�nav1, s�nav2) values (5, 2, 78, 66)

update TBLNOTLAR set ortalama= (s�nav1 + s�nav2 + s�nav3 )/3 
update TBLNOTLAR set DURUM=1 WHERE ortalama >=50
update TBLNOTLAR set DURUM=0 WHERE ortalama <50


--count, sum, avg, max, min
select COUNT(*) as mevcut from TBLOGRENCILER 
select SUM(s�nav1), SUM(s�nav2), SUM(s�nav3) from TBLNOTLAR
select AVG(s�nav1),AVG(s�nav2),AVG(s�nav3) from TBLNOTLAR
select MAX(s�nav1),MAX(s�nav2),MAX(s�nav3) from TBLNOTLAR
select Min(s�nav1),Min(s�nav2),Min(s�nav3) from TBLNOTLAR

--GROUP BY
select t.OGRCINSIYET, count(*) as toplam from TBLOGRENCILER t group by t.OGRCINSIYET
select t.OGRKULUP, COUNT(*) as toplam from TBLOGRENCILER t group by t.OGRKULUP

--having
select t.OGRKULUP, COUNT(*) as toplam from TBLOGRENCILER t group by t.OGRKULUP having t.OGRKULUP= 1
select t.OGRSEHIR, COUNT(*) from TBLOGRENCILER t group by t.OGRSEHIR having count(*)=2


--like
select * from TBLOGRENCILER where OGRAD like'a%' 
select * from TBLOGRENCILER where OGRAD like'a%' or OGRSEHIR like '%a%'-- neden and uymad�
select * from TBLOGRENCILER where OGRAD not like'a%'

--distinct (recurring fetch)
select OGRSEHIR from TBLOGRENCILER
select distinct OGRSEHIR from TBLOGRENCILER
select COUNT(distinct(OGRSEHIR)) AS '�EH�R SAYISI' from TBLOGRENCILER


--ORDER BY (ARRANGEMENT)
select OGRSEHIR from TBLOGRENCILER order by OGRSEHIR
select distinct OGRSEHIR from TBLOGRENCILER -- distinct te zaten asc s�ras�nda geliyor
select distinct OGRSEHIR from TBLOGRENCILER order by OGRSEHIR desc

--like
select* from TBLOGRENCILER where OGRAD like '%a%'--those with the letter "a" in the student name.
select* from TBLOGRENCILER where OGRSEHIR like '%ir%'
select* from TBLOGRENCILER where OGRSEHIR like '%ir_%'--Let there be an "r" in it, but something else after it.
select* from TBLOGRENCILER where OGRAD like '%[a,b]%'-- those with "a" or "b" in them.
select* from TBLOGRENCILER where OGRAD like '[a,b]%' -- starting with "a" or "b".
select* from TBLOGRENCILER where OGRKULUP like '[a-m]%' -- Get those whose name starts with any between "a" and "m".
select* from TBLOGRENCILER where OGRKULUP like '%[�,z]'

--top
select top 3 * from TBLOGRENCILER -- fetch the first 3 records.
select top 3 * from TBLOGRENCILER order by OGRID desc -- fetch the last 3 records.

--percent
select top 30 percent * from TBLOGRENCILER -- fetch the first 30 percent record.
select top 35 percent * from TBLOGRENCILER -- There are normally 10 records. If a percentage between 30-40 is written, it acts as if 40 is written.
select top 35 percent * from TBLOGRENCILER order by OGRID desc

--in( It is a command that saves the or statement.)
select * from TBLOGRENCILER where OGRSEHIR= 'adana' or OGRSEHIR= 'ankara' or OGRSEHIR= 'edirne'
select * from TBLOGRENCILER where OGRSEHIR in ('adana', 'ankara', 'edirne')
select * from TBLNOTLAR where s�nav1 in (70, 75, 80, 85, 90)
select * from TBLNOTLAR where s�nav1 not in (70, 75, 80, 85, 90)-- bring those that don't include them.

--between(The "between" function includes the 1st value but not the 2nd value.)
select * from TBLNOTLAR where ORTALAMA between 74 and 90
select * from TBLOGRENCILER where OGRAD between 'a' and 'c'
select * from TBLOGRENCILER where OGRAD not between 'a' and 'c'

update TBLOGRENCILER set OGRKULUP= 5 where OGRKULUP= 'temizlik'
insert into TBLOGRENCILER(OGRAD, OGRKULUP, OGRCINSIYET, OGRSEHIR) values('Berna', 4, 'k�z', 'Ankara') 

--Merge Process. Join....
select NOTID, DERSAD from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID
select NOTID, DERSAD,s�nav1, s�nav2, s�nav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID
select NOTID, DERSAD, ograd,OGRSOYAD, s�nav1, s�nav2, s�nav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID 
inner join TBLOGRENCILER on TBLOGRENCILER.OGRID = TBLNOTLAR.OGRENCI 
select NOTID, DERSAD, ograd+OGRSOYAD as [isim soyisim], s�nav1, s�nav2, s�nav3, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLNOTLAR.DERS = TBLDERSLER.DERSID 
inner join TBLOGRENCILER on TBLOGRENCILER.OGRID = TBLNOTLAR.OGRENCI 

update TBLNOTLAR set durum= 'ge�emedi' where DURUM='0'

UPDATE TBLNOTLAR SET ORTALAMA=(SINAV1+ SINAV2+ SINAV3)/3 WHERE DERS=1
UPDATE TBLNOTLAR SET DURUM='ge�ti' where ortalama>=50
UPDATE TBLNOTLAR SET DURUM='ge�emedi' where ortalama<50

--EXAM GRADE INFORMATION FOR THE COURSE NAMED MATHEMATICS IN THE COURSES TABLE
--answer1
select ogrenc�, dersad, s�nav1, s�nav2, s�nav3, ortalama, DURUM from TBLNOTLAR inner join TBLDERSLER on TBLDERSLER.DERSID = TBLNOTLAR.DERS where dersad= 'MATEMAT�K'
--answer2
SELECT * FROM TBLNOTLAR WHERE DERS=1 
SELECT * FROM TBLNOTLAR WHERE DERS=(SELECT DERSID FROM TBLDERSLER WHERE DERSAD= 'MATEMAT�K')

--HIGHEST exam1 GRADE FOR THE ALGORITHM course in the TABLE OF GRADES?
select * from TBLNOTLAR where s�nav1=(select max(s�nav1) from TBLNOTLAR) 

--Let all the common records in the student and grades table come.
select * from  TBLNOTLAR inner join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--right- left join
--It is desired to see which students have not entered grades.
select * from  TBLNOTLAR right join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--full join
select * from  TBLNOTLAR full join TBLOGRENCILER on TBLNOTLAR.OGRENCI = TBLOGRENCILER.OGRID

--arithmetic operations
--For course 1, 10 points should be added to the students whose 2nd exam grade is below 45.
 select * from TBLNOTLAR where DERS=1
 select AVG(ortalama) as ortalama from TBLNOTLAR where DERS=1 



--MATHEMATICAL FUNCTIONS
--abs
select abs(90) as 'mutlak'
--power
select POWER(2,5) as '�s alma'
select POWER(s�nav1,2) as bbb from TBLNOTLAR
--sqrt
select SQRT(81) as 'karek�k'
select SQRT(83) as 'karek�k'--ondal�kl�y� da getirir.
--floor, ceiling 
select FLOOR(4.895) as 'taban' , CEILING(4.895) as 'tavan'

--sum
select sum(s�nav1) from TBLNOTLAR where ogrenc�=1
select s�nav1, DERS from TBLNOTLAR where ogrenc�=1

select dersad, s�nav1, s�nav2, s�nav3 from TBLNOTLAR inner join TBLDERSLER on TBLDERSLER.DERSID = TBLNOTLAR.DERS where 
OGRENCI=(select ogr�d from TBLOGRENCILER where OGRAD='ay�e' and OGRSOYAD= '��nar') 


--ALPHABETIC FUNCTIONS
--upper,lower
select upper('merhaba') as s�tun
select UPPER(ograd) as ad, UPPER(ogrsoyad) as soyad, LOWER(ogrseh�r) as �ehir from TBLOGRENCILER


--substring -- dersin sonundaki soruyu yap
select SUBSTRING(ograd,1,1) +'.'  + ' ' + ogrsoyad as [ad soyad], OGRKULUP from TBLOGRENCILER--ka��nc� karakterden itibaren ka��nc�y� als�n.


--len
select len('merhaba')

select ograd, len(ograd), ogrkulup from TBLOGRENCILER where OGRSEHIR= 'adana' and OGRKULUP=(select kulup�d from TBLKULUPLER where KULUPAD= 'bili�im')
--People whose name is 3 and 4 characters long.
select t.OGRAD from TBLOGRENCILER t where LEN(OGRAD)=3 or LEN(OGRAD)=4 


--ltrim- rtrim
select ('             Dicle Acet')
select ('Dicle Acet             ')
select rtrim ('Dicle Acet             ')
select ltrim('             Dicle Acet')

--replace
select replace(' Dicle', 'Dicle', 'can')
 
 --charindex
select CHARINDEX('e', 'SQL derslerine devam ediyoruz')
select CHARINDEX('e', 'SQL derslerine devam ediyoruz',7)
select CHARINDEX('a',ograd) from TBLOGRENCILER
 -- reverse
 select REVERSE('Beyza')
 select reverse(dersad) from TBLDERSLER


 --DDL COMMANDS 
 create database SatisVT

 USE SatisVT
 create table TBLKATEGORI
 (
 KATEGORIID tinyint identity(1,1) primary key,
 KATEGORIAD VARCHAR(50) 
 )

 create table TBLURUNLER
 (
 URUNID int identity(1,1) primary key,
 URUNAD varchar(50),
 URUNMARKA varchar(50),
 KATEGORI tinyint,
 URUNALISFIYAT decimal(18,2),
 URUNSTOK decimal(18,2),
 URUNDURUM bit default '1'
 )


 create table TBLPERSONEL
 (
 PERSONELID smallint identity(1,1) primary key,
 PERSONELADSOYAD VARCHAR(50)
  
 )

 create table TBLMUSTERI
 (
 MUSTERIID int primary key  identity(1,1),
 MUSTERIAD varchar(50),
 MUSTERISOYAD varchar(50),
 MUSTERISEHIR varchar(13),
 MUSTERIBAKIYE decimal(18,2)
 
 )

 create table TBLHAREKET
 (
 HAREKETID int primary key identity(1,1),
 URUN int,
 MUSTERI int,
 PERSONEL smallint,
 ADET int,
 TUTAR decimal(18,2),
 TARIH smalldatetime
 )

 insert into TBLKATEGORI(KATEGORIAD) values('BILGISAYAR')
 insert into TBLKATEGORI(KATEGORIAD) values('BEYAZ E�YA')
 insert into TBLKATEGORI(KATEGORIAD) values('KU�UK EV ALETI')
 insert into TBLKATEGORI(KATEGORIAD) values('TV')

 insert into TBLURUNLER(URUNAD, URUNMARKA, KATEGORI, URUNALISFIYAT, URUNSATISFIYAT, URUNSTOK) values('BUZDOLABI', 'SIEMENS', 2, 4356, 4588, 10)
 
 --DML COMMANDS 
 SELECT * FROM TBLURUNLER

 UPDATE TBLURUNLER SET URUNAD= 'KETTLE' WHERE URUNAD= 'SU ISITICISI'
 UPDATE TBLURUNLER SET URUNAD= 'SU ISITICISI' WHERE URUNAD= 'KETTLE'

 --HOW MANY PRODUCTS ARE IN EACH CATEGORY TOTAL?
 select * from TBLURUNLER
 select KATEGORIAD,COUNT(*) as [toplam �r�n] from TBLKATEGORI inner join TBLURUNLER on 
 TBLURUNLER.KATEGORI= TBLKATEGORI.KATEGORIID group by KATEGORIAD order by COUNT(*)--------------------------------------------------------------------------------------------------------------------------------------------------------


select KATEGORI, COUNT(*) AS TOPLAM from TBLURUNLER GROUP BY KATEGORI

 --500 TL increase in the sales price of the products whose category is computer.
 update TBLURUNLER set URUNSATISFIYAT= URUNSATISFIYAT + 500 where KATEGORI=1
 update TBLURUNLER set URUNSATISFIYAT= URUNSATISFIYAT + 500 where 
 KATEGORI=(select kategor��d from TBLKATEGORI where KATEGORIAD= 'bilgisayar')--same as above.

 --(EXAMPLE)The query that gives 10 percent discount on products in the TV category?
update TBLURUNLER set URUNSATISFIYAT= URUNALISFIYAT + URUNSATISFIYAT* 0.11 where kategor�=4

select count(*) as 'ka� farkl� �r�n', sum(URUNSTOK) as 'stok say�s�' from TBLURUNLER

--(EXAMPLE)How much profit is made if all the items in stock are sold?
select * from TBLURUNLER
select  SUM(t.URUNSTOK*t.URUNSATISFIYAT) as [toplam kazan�] from TBLURUNLER t 
--(EXAMPLE) How much profit does each product bring in itself when it is sold?
select urunad, SUM(t.URUNSTOK*t.URUNSATISFIYAT) as [toplam kazan�] from TBLURUNLER t group by URUNAD

select URUNID, URUNAD, URUNMARKA, kategor�ad, URUNSATISFIYAT, URUNALISFIYAT, URUNSTOK, (URUNSATISFIYAT-URUNALISFIYAT) as kar, 
urunstok*(urunsat�sf�yat - urunal�sf�yat) as [toplam kar] from TBLURUNLER  inner join tblkategor�  on tblkategor�.kategor��d = tblurunler.kategor�

--PROCEDURE
select HAREKETID, urunad, muster�ad + ' ' + muster�soyad as m��teri, personeladsoyad as personel, adet, tutar, tar�h from 
TBLHAREKET inner join TBLURUNLER on TBLHAREKET.urun= TBLURUNLER.URUNID 
inner join TBLMUSTERI on TBLMUSTERI.muster��d = tblhareket.muster� inner join TBLPERSONEL on TBLPERSONEL.personel�d= tblhareket.personel
--INSTEAD OF WRITTING THE ABOVE QUESTION, WE CAN MAKE IT AS A SINGLE EXPRESSION AND CALL IT WHEN WE WANT. THAT'S WHAT PROCEDURE WORKS.
CREATE PROCEDURE HAREKETLER AS 
select HAREKETID, urunad, muster�ad + ' ' + muster�soyad as m��teri, personeladsoyad as personel, adet, tutar, tar�h from TBLHAREKET inner join TBLURUNLER on 
TBLHAREKET.urun= TBLURUNLER.URUNID 
inner join TBLMUSTERI on TBLMUSTERI.muster��d = tblhareket.muster� inner join TBLPERSONEL on TBLPERSONEL.personel�d= tblhareket.personel
--THIS IS NOW A PROCEDURE, WITH THE FOLLOWING EXPRESSION, WE CAN MAKE IT WORKING AS FOLLOWS:
EXECUTE HAREKETLER
--IF WE WANT TO DELETE THIS PROCEDURE, THE FOLLOWING COMMAND IS USED.
DROP PROCEDURE HAREKETLER

--DATAPART(DATEPART)
SELECT * FROM TBLHAREKET
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 3
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 3 AND 3
SELECT * FROM TBLHAREKET WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 3 AND MUSTERI=1

--LIST CUSTOMERS WHICH WERE ANKARA ON 1 AND 2 OCTOBER.
--ANSWER1
SELECT * FROM TBLHAREKET
SELECT MUSTERI,MUSTERIAD,TARIH, MUSTERISEHIR FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID= TBLHAREKET.MUSTERI WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 2 and MUSTERISEHIR= 'ankara' 
--ANSWER1
SELECT * FROM TBLHAREKET  WHERE DATEPART(DAY,TARIH) BETWEEN 1 AND 2 and MUSTERI=(SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR= 'ANKARA')

--DATANAME(DATENAME)

select DATENAME(month,GETDATE())--today's date (in months)
select DATENAME(day, getdate())
select DATENAME(WEEKDAY,'1999.08.23')--What day of the week was August 23rd in 1999?
select DATENAME(month, '1999.08.23')
--We wondered what day a date coincides with.
select DATENAME(weekday,'2022.05.11')

--DATEDIFF
SELECT DATEDIFF(DAY,'1999.08.23', '2021.05.09')
SELECT DATEDIFF(MONTH,'1999.08.23', '2021.05.09')
SELECT DATEDIFF(YEAR,'1999.08.23', '2021.05.09')

SELECT DATEDIFF(DAY,TARIH,GETDATE()) FROM TBLHAREKET WHERE HAREKETID=1 -- �LK ��LEMDEN BU YANA BU KADAR G�N GE�M��

--DATEADD
SELECT DATEADD(DAY,30,GETDATE())--BUG�N�N �ZER�NE 30 G�N EKLED�K VE TAR�H� G�RD�K.
SELECT DATEADD(DAY,30,'1999.08.23')-- BU TAR�H�N �ZER�NE 30 G�N EKLED�K VE TAR�H� G�RD�K.

--SUBQUERY EXAMPLES

--HOW MANY OF EACH PRODUCT ARE SOLD?
SELECT  URUN, COUNT(*) AS ADET  FROM TBLHAREKET  group by URUN order by adet

SELECT  URUNAD, COUNT(*) AS ADET FROM TBLHAREKET inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN  group by URUNAD --group by inner joinden �nce gelemez.

--PRODUCTS SOLD IN THE COMPUTER CATEGORY ONLY?
SELECT URUN,COUNT(*) FROM TBLHAREKET GROUP BY URUN having urun=(select KATEGORIID from TBLKATEGORI where KATEGORIAD='bilgisayar')

--(EXAMPLE) BRING THE ABOVE WITH THE NAME OF THE PRODUCT SHOWN.

--ANSWER
SELECT * FROM TBLHAREKET WHERE URUN IN(SELECT URUNID FROM TBLURUNLER WHERE KATEGORI=1)-- neden e�itlik yerine in var?.....> biyerde altsorguda 1 den fazla de�er d�n�yorsa o zaman in komutu kullan�lmal�.

--LET'S FIND THE EXPENDITURES OF ADANA CUSTOMERS.
SELECT MUSTERIAD + ' ' + MUSTERISOYAD as 'm��teri ad soyad', ADET* URUNSATISFIYAT as 'harcama' FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID = TBLHAREKET.MUSTERI 
inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN WHERE MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

SELECT  MUSTERIAD + ' ' + MUSTERISOYAD as  'm��teri ad soyad',ADET* URUNSATISFIYAT as 'harcama' FROM TBLHAREKET inner join TBLMUSTERI on TBLMUSTERI.MUSTERIID = TBLHAREKET.MUSTERI 
inner join TBLURUNLER on TBLURUNLER.URUNID= TBLHAREKET.URUN where MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

--ANSWER2
SELECT * FROM TBLHAREKET WHERE MUSTERI in (SELECT MUSTERIID FROM TBLMUSTERI WHERE MUSTERISEHIR='ADANA')

--THE BALANCE OF CUSTOMERS EXPENDING ON WHITE GOODS?
--ANSWER1
select muster�ad + ' ' +muster�soyad [m��teriler],MUSTERIBAKIYE from TBLMUSTERI inner join TBLHAREKET on TBLHAREKET.muster�= TBLMUSTERI.muster��d where urun=2

--ANSWER2
Select * from TBLHAREKET where urun= (select kategoRIID from TBLKATEGORI where KATEGORIAD='beyaz e�ya')



--total price of products sold to adana or ankara customers?
select sum(TUTAR) from TBLHAREKET where muster� in ( select muster��d from TBLMUSTERI where MUSTERISEHIR= 'adana' or MUSTERISEHIR= 'ankara')

--THE CASH TABLE NEEDS TO BE ADDED TO SEE THE GAIN:
CREATE TABLE TBLKASA
(
TOPLAM decimal(18,2)
)
 
 insert into TBLKASA values(0)
 select * from TBLKASA
 update TBLKASA set TOPLAM=(select SUM(tutar) from TBLHAREKET)

 --TR�GGER

 create table TBLSAYAC
 (
 �SLEM int 
 )
 insert into TBLSAYAC values(0)
 update TBLSAYAC set islem= (select COUNT(*) from TBLHAREKET)

 --When a data is entered in the motion table, the counter value increases by 1.
 create trigger ISLEMARTIS on tblhareket after insert as update tblsayac set islem= islem + 1

 create table TOPLAMKATEGORI
 ( 
 ADET tinyint
 )
 insert into TOPLAMKATEGORI values(0)

 update TOPLAMKATEGORI set ADET= (select count(*) from TBLKATEGORI)

 --Let's create the trigger:
 create trigger KATEGORIARTIS on tblkategor� after insert as update toplamkategor� set adet= adet + 1
 
 --Let's create a trigger.
 create trigger KATEGORIAZALIS on tblkategor� after delete as update toplamkategor� set adet= adet-1

 --V�EW
 create view test1 as select * from TBLKATEGORI
 select * from test1
 --Let's make changes in test 1:
 alter view test1 
 as 
 select * from TBLKATEGORI where KATEGORIID<2
 SELECT * FROM TEST1

 select * from test2
 SELECT * FROM TEST3 





