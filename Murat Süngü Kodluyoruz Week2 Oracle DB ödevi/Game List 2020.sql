--Murat S�ng� Kodluyoruz Week2 Oracle SQL DB �devi

/*
Bu �emada 2020 y�l�nda ��km�� olan t�m oyunlar i�in bir DB olu�turdum. Reference1 tablosunda oyunlar i�in girilen referans yorumlar mevcut.
Publisher tablosunda oyunlar� ��kartan firmalar�n isimlerini i�eriyor.
Game_list tablosunda 523 adet oyunun verisi bulunmakta, bu oyunlardan bir ka� tanesinin ismi ayn�. Bunun sebebi ise baz� oyunlar�n farkl� 
zamanlarda farkl� platformlar i�in ��km�� olmas�. Oyunlar tablosunda oyunun ismi, ��k�� tarihi, oyunun t�r� mevcut.
Platform tablosunda oyunlar�n ��kt��� platformlar, bu platformlar�n kategorisi ve markalar� yer almakta.

Oyunlar ve Platform k�sm� birbirine n-n tarz�nda ba�l� olmas� gerekti�inden ara bir tablo olu�turdum. PLATFORM_GAME_CONNECTION tablosunda game_id ve platform_id
aras�nda bir ba�lant� kurarak analizler ��kartmak m�mk�n oluyor. oyun tablosunda �oklayan verilerden de b�ylece ka��nm�� oluyorum.

Yay�nc�lar�n ve referanslar�n oldu�u tablolar, id k�s�mlar� ile oyun listesine ba�lanm�� durumda.

*/
-----------------------------
------ GAMELIST SCHEMA ------
-----------------------------

alter session set "_ORACLE_SCRIPT"=true;���
CREATE USER GAMELIST IDENTIFIED BY game123;�
GRANT CREATE SESSION TO GAMELIST;
GRANT CONNECT, RESOURCE, DBA TO GAMELIST;

---------CREATING TABLES-------------------
-------------------------------------------

CREATE TABLE REFERENCE1(
REFERENCE_ID NUMBER PRIMARY KEY,
REFERENCES1 VARCHAR2(350));

--------------------------------------------

CREATE TABLE PUBLISHER(
PUBLISHER_ID NUMBER PRIMARY KEY,
PUBLISHER_NAME VARCHAR2(250));

--------------------------------------------

CREATE TABLE GAME_LIST(
GAME_ID NUMBER PRIMARY KEY,
GAME_NAME NVARCHAR2(150),
RELEASE_DATE DATE,
GENRE VARCHAR2(50),
GENRE2 VARCHAR2(50),
GENRE3 VARCHAR2(50),
PUBLISHER_ID NUMBER,
CONSTRAINT FK_PUBLISHER_ID FOREIGN KEY(PUBLISHER_ID)
	REFERENCES PUBLISHER(PUBLISHER_ID),
REFERENCE_ID NUMBER,
CONSTRAINT FK_REFERENCE_ID FOREIGN KEY(REFERENCE_ID)
	REFERENCES REFERENCE1(REFERENCE_ID));

-------------------------------------------

CREATE TABLE PLATFORM(
PLATFORM_ID NUMBER PRIMARY KEY,
PLATFORM_NAME VARCHAR2(50),
BRAND VARCHAR2(30),
CATEGORY VARCHAR2(30));

-------------------------------------------

CREATE TABLE PLATFORM_GAME_CONNECTION(
ID NUMBER PRIMARY KEY,
GAME_ID NUMBER, --FK
CONSTRAINT FK_GAME_ID FOREIGN KEY(GAME_ID)
	REFERENCES GAME_LIST(GAME_ID),
PLATFORM_ID NUMBER, --FK
CONSTRAINT FK_PLATFORM_ID FOREIGN KEY(PLATFORM_ID)
	REFERENCES PLATFORM(PLATFORM_ID));

--------------------------------------------
--Insert yapmak i�in verileri excel olarak klas�re ekledim. Insert Scripti yazarsam kodlar �ok uzayaca��ndan bu �ekilde payla�mak istedim.
--------------------------------------------

--GAME LIST tablosu i�in GAMES Synonym'i olu�turdum.
CREATE SYNONYM GAMES
    FOR GAMELIST.GAME_LIST;

--Kategorilere g�re oyunlar� g�stermek i�in(Konsol, Pc ve Mobil �zelinde) bir View olu�turdum.
CREATE VIEW CATEGORIES AS
    SELECT PLATFORM.CATEGORY,PLATFORM_GAME_CONNECTION.ID
    FROM PLATFORM INNER JOIN PLATFORM_GAME_CONNECTION
    ON PLATFORM.PLATFORM_ID = PLATFORM_GAME_CONNECTION.PLATFORM_ID;
    
 --A�a��daki kodla Hangi kategori i�in ka� oyun ��km�� onu g�rebiliyoruz. Say�lar�n toplam� oyun say�s�ndan fazla ��nk� genelde bir oyun birden fazla platform i�in ��k�yor.   
SELECT CATEGORY,COUNT(*) FROM CATEGORIES
GROUP BY CATEGORY;

