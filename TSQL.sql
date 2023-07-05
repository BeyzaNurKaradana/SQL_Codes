--"Declare" is used to define functions in SQL. The defined function name starts with "@" and its type must also be entered.
declare @Sayi int
set @Sayi= 24
select @Sayi as 'sonuc'

declare @kisi1 varchar(10)
set @kisi1='Beyza' 
select @kisi1 as ki�i

declare @say�1 int, @say�2 int, @say�3 int
set @say�1= 10 
set @say�2= 15
set @say�3= 2

select @say�1 + @say�2 * @say�3 

--Query that returns the sum and digits of a 3-digit number
--123= 6
--answer..> A total of 5 definitions, with 3 digit values, the sum of the number itself.
declare @say� int, @y�zler_basama�� int, @onlar_basama�� int, @birler_basama�� int, @toplam int
set @say�= 125
set @y�zler_basama��= @say�/100
set @onlar_basama��= (@say�/10) % 10
set @birler_basama��= @say� %10
set @toplam = @y�zler_basama�� + @onlar_basama�� + @birler_basama��

select @say�, @y�zler_basama��, @onlar_basama��, @birler_basama��, @toplam

--How are variables used in tables? Let's see.
use SatisVT
--let's bring the highest balance value but not with "max"; Let's do it with a variable.
select * from TBLMUSTERI

declare @bakiye int
set @bakiye= (select MAX(muster�bak�ye) from TBLMUSTERI)

select @bakiye

--Let's bring the information of the product with the most stock with the variable.
select * from TBLURUNLER
declare @stok int
set @stok=(select MAX(urunstok) from TBLURUNLER)

select @stok as maxstok

select * from TBLURUNLER where URUNSTOK= @stok

--system functions
select @@ERROR, @@MICROSOFTVERSION, @@SERVERNAME

--print--There is no table-based value here, it always comes based on messages.
print 'hello'
--Let's make a program that calculates the product of 2 numbers.
declare @s1 int, @s2 int, @�arp�m int
set @s1= 10
set @s2=15
set @�arp�m= @s1*@s2

print '10 ve 15 say�lar�n�n �arp�m�'
print '****************************'
print @�arp�m
select @�arp�m

--Table type variables-- Allows holding more than one table value with the help of a variable (like a temporary table).
--Let's make an example of people's name, surname, city.
declare @ki�iler table 
(
ki�i�d int identity(1,1),
ki�iad varchar(10),
ki�i�ehir varchar(15)
)

insert into @ki�iler (ki�iad, ki�i�ehir) values ( 'mehmet', 'ankara')
insert into @ki�iler values ('ay�e', 'istanbul')
select * from  @ki�iler
select ki�iad from @ki�iler where ki�iad like 'a%'

--IF-ELSE
if(1<5)
print 'merhaba'
else
print 'selam'

--Is there a total of 100 products or not?
select * from TBLURUNLER
 if(select sum(URUNSTOK) from TBLURUNLER)>100
print 'yes'
else
print 'no'

--CASE--They are structures used in cases where there is a lot of branching.
select * from TBLURUNLER 
select URUNAD, URUNMARKA, URUNDURUM=
case urundurum
when '1' then '�r�n var'
when '0' then '�r�n yok'
end
from TBLURUNLER

select urunad, urunmarka, KATEGORI=
case kategor�
when '1' then 'laptop'
when '2' then 'beyaz e�ya'
when '3' then 'k���k ev aleti'
end
from TBLURUNLER

--case --find critical level

select URUNAD, URUNMARKA, URUNSTOK, URUNSTOK=
case
when urunstok>=1 and urunstok<=5 then 'kritik seviye'
when urunstok>=6 and urunstok<=10 then 'takviye yap�lmal�'
when urunstok>10 then '�r�n stok say�s� yeterli'
end
from tblurunler

--WHILE 
declare @sayac int
set @sayac= 1
while @sayac<=5
begin
print 'merhaba sql dersleri'
set @sayac+=1
end

--EXAMPLE --Let's print the numbers between 1 and 10 on the screen.
declare @say� int
set @say�= 1
while @say�<=10
begin
print @say�
set @say�+=1
end

--Here the program prints after adding 1.
declare @say� int
set @say�= 1
while @say�<=10
begin
set @say�+=1
print @say�
end


--EXAMPLE--Let's calculate the sum of the numbers between 1 and 10.
declare @toplam int, @sayac int
set @toplam= 0
set @sayac=1
while @sayac<=10
begin
set @toplam = @toplam + @sayac
set @sayac+=1
end
print @toplam

--EXAMPLE-- Let's increase the sales prices by 10 percent until the profit rate reaches 450.
while (select avg(URUNSATISFIYAT - URUNALISFIYAT) from TBLURUNLER where KATEGORI= 2)<=450
begin
update TBLURUNLER set URUNSATISFIYAT+= URUNSATISFIYAT*10/100
end
select * from TBLURUNLER

--waitfor-- It has a meaning like run my query at this minute, this hour, this second.
waitfor delay '00:00:05'
select * from TBLURUNLER

waitfor delay '00:00:05'
insert into TBLKATEGORI(KATEGORIAD) values('di�er')
select * from TBLKATEGORI
--delete from TBLKATEGORI where KATEGORIID=8





