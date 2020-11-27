--Kodluyoruz SQL W2 ödevi
--Murat Süngü

--Banking sorularý cevaplarý 
--***************************

--Yýlýn 4. aylarýnda en çok hangi amaçla kredi çekilmiþtir? ----Banking þemasý için
SELECT PURPOSE,COUNT(*) FROM LOANS WHERE MONTH=4 GROUP BY PURPOSE;

-- Bankanýn 50 ve ya 51 yaþýnda kadýn müþterilerinden ayný isme sahip olan müþterisi/müþterileri var mý? Varsa isimleri neler?----Banking þemasý için
select count(*),first from clients where age in (50,51) and sex='Female' group by first order by count(*) desc;

--Hangi yýllarda kaç hesap açýlmýþtýr?----Banking þemasý için
select count(*),year from accounts group by year order by year;

-- Ýþlemlerin tiplerine göre toplam sayýlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için
select count(*),operation from transactions group by operation order by count(*) desc;

-- Ýþlemlerin tiplerine göre toplam tutarlarýnýn büyükten küçüðe sýralamasý nedir?----Banking þemasý için
select sum(amount),operation from transactions group by operation order by sum(amount) desc;



--Sales sorularý cevaplarý 
--***************************

-- Birim fiyatý 150'den büyük olan order_itemlarý bulunuz. ----Sales þemasý için
select * from order_items where unit_price>150;

-- Ýþe alým tarihi Mayýs 2016 olan çalýþanlarý bulunuz. ----Sales þemasý için
select * from employees where hire_date between '01.05.2016' and '31.05.2016';

-- Adý Charlie ya da Charlsie olan contactlarý bulunuz. ----Sales þemasý için
select * from contacts where first_name in ('Charlie','Charlsie');

-- Adet sayýsý 10dan büyük 50den küçük envanterleri bulunuz. ----Sales þemasý için
select * from inventories where quantity<50 and quantity>10;

-- Bir sipariþte toplam 100.0000'den fazla ücret ödeyen emirler nedir? ----Sales þemasý için
select * from order_items where quantity*unit_price>100000;

-- Manager'ý olmayan çalýþanlar hangileridir? ----Sales þemasý için
select * from employeEs where manager_id IS NULL;

-- State bilgisi boþ olan lokasyonlarý bulunuz.----Sales þemasý için
select * from locations where state is null;

-- Durumu iptal olan ve satýcýlarý olmayan emirler hangileridir? ----Sales þemasý için
select * from orders where status='Canceled' and salesman_id is null;

-- Ocak 2016 ile Haziran 2016 arasýnda verilen sipariþler hangileridir? ----Sales þemasý için
select * from orders where order_date between '01.01.2016' and '30.06.2016';

-- Unvaný 'S' ile baþlamayan çalýþanlarý bulunuz. ----Sales þemasý için
select * from employeEs where job_týtle not like 'S%' ;

-- Herhangi bir çeþit Intel Xeon ürünler hangileridir? ----Sales þemasý için
select * from products where product_name like 'Intel Xeon%';

-- Ýsmi 'C' ile baþlayan kontaklar hangileridir? Soyadýna göre alfabetik sýra ile sýralayalým. ----Sales þemasý için
select * from contacts where fýrst_name like 'C%' order by last_name;

-- Ürün adý 'Asus' ile baþlayan ve liste fiyatý standart ücretinden küçük olan ürünleri bulunuz. ----Sales þemasý için
select * from products where product_name like 'Asus%' and standard_cost>list_price ;

-- 1,2,4,5 id'li kategorilerin bilgilerini bulunuz. ----Sales þemasý için
select * from product_categories where category_ýd in (1,2,3,4,5);

-- Sipariþ durumu 'Shipped'den farklý olan müþterilerin bilgilerini bulunuz. ----Sales þemasý için
select * from customers join orders on orders.status not like 'Shipped' ;

-- Adet sayýsý 100e eþit olan envanterlerin product bilgisini bulunuz. ----Sales þemasý için
select * from products join inventories on quantity=100 ;

-- Beijing (8 numaralý warehouse)'da kaç farklý envanter vardýr? ----Sales þemasý için
select count(*) from inventories join warehouses on warehouses.warehouse_id=8 ;

-- Liste fiyati 1000 ile 3000 arasinda olan kaç product var?----Sales þemasý için
select count(*) from products where list_price between 1000 and 3000;





--Telco sorularý cevaplarý 
--***************************

-- Kotasý limitsiz olan ürünler hangileridir? ----Telco þemasý için
SELECT PRODUCT_NAME FROM PRODUCT WHERE QUOTA='LIMITLESS';

-- Statüsü 'Initial' olan müþterileri bulunuz. ----Telco þemasý için
SELECT CUSTOMER_NUM,NAME,surname FROM CUSTOMER WHERE STATUS='INITIAL';

-- Þehir bilgisi 'ISTANBUL' olan adresleri bulunuz. ----Telco þemasý için
SELECT * FROM address WHERE CITY='Istanbul' or cýty='Istanbu';

-- Birincil iletiþim bilgisi olmayan telefon numaralarýný bulunuz. ----Telco þemasý için
select cnt_value from contact where is_primary=0 and cnt_type='PHONE';

-- Hesap ödeme þekli nakit olmayan hesaplar hangileridir? ----Telco þemasý için
SELECT * FROM ACCOUNT WHERE payment_type NOT IN ('CASH');

-- Statüsü deaktif olan müþterilerin baðlantý kesim tarihleri nedir? ----Telco þemasý için
SELECT DISCONNECTION_DATE FROM CUSTOMER WHERE STATUS='DEACTIVE' ;

-- Hesap kapanýþ tarihi dolu olan hesaplarý bulunuz. ----Telco þemasý için
SELECT * FROM ACCOUNT WHERE account_closýng_date IS NOT NULL;

-- Elektronik fatura mail adresi (E_bill_email) olan hesaplar hangileridir? ----Telco þemasý için
SELECT * FROM ACCOUNT WHERE býll_presentatýon_type='EBILL' ;

-- Sözleþme bitiþ tarihi 1 Ocak 2000'den büyük , 1 Ocak 2005'ten küçük olan sözleþmeleri bulunuz. ----Telco þemasý için
SELECT * FROM AGREEMENT WHERE commýtment_end_date BETWEEN '01.01.2000' AND '01.01.2005';

-- 2005 yýlýndan önce yapýlan ve hala aktif olan subscriptionlar hangileridir? ----Telco þemasý için
SELECT * FROM SUBSCRIPTION WHERE create_date<'01.01.2005' AND STATUS='ACTIVE';

-- Sözleþme baþlangýç tarihi Ocak 2010'dan büyük olan sözleþmeleri bulunuz. ----Telco þemasý için
SELECT * FROM AGREEMENT WHERE commýtment_start_date>'31.01.2010' ;

-- Ýsmi E ile baþlayan müþterileri bulunuz. ----Telco þemasý için
SELECT * FROM CUSTOMER WHERE NAME LIKE 'E%' ;

-- Product tipi 'DSL' ile biten ürünleri bulunuz. ----Telco þemasý için
SELECT * FROM PRODUCT WHERE PRODUCT_TYPE LIKE '%DSL';

-- Ýsminde ya da soyisminde 'ü' harfi geçen müþteriler hangileridir? ----Telco þemasý için
SELECT * FROM CUSTOMER WHERE NAME LIKE '%ü%' OR SURNAME LIKE '%ü%' ;

-- Ülke kodu UK ve AU olan adresleri bulunuz.----Telco þemasý için
SELECT * FROM ADDRESS WHERE country_cd IN ('UK','AU');

-- Taahhüt süresi 240 ve 120 ay olan bütün sözleþmeleri bulmak istiyoruz.----Telco þemasý için
SELECT * FROM AGREEMENT WHERE commýtment_duratýon IN ('120 MONTHS','240 MONTHS');

-- Sözleþme alt tipi MAIN olan kaç tane sözleþme vardýr?----Telco þemasý için
SELECT COUNT(*) FROM AGREEMENT WHERE SUBTYPE='MAIN';

-- Deaktif müþterilerin sayýsýný bulunuz.----Telco þemasý için
SELECT COUNT(*) FROM CUSTOMER WHERE status='DEACTIVE';

-- Ýletiþim tipi olarak email ve statusu kullanýmda olan kaç müþteri var?----Telco þemasý için
SELECT * FROM CUSTOMER JOIN contact ON contact.cnt_type='EMAIL' AND customer.status='ACTIVE';

















