--------------------------------------------------------
--  已建立檔案 - 星期五-六月-03-2016   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence DEPT_TABLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PSE"."DEPT_TABLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence EMP_TABLE_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "PSE"."EMP_TABLE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1000 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table APARTMENT
--------------------------------------------------------

  CREATE TABLE "PSE"."APARTMENT" 
   (	"APAR_ID" NUMBER, 
	"APAR_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table APPLY_CHANGE
--------------------------------------------------------

  CREATE TABLE "PSE"."APPLY_CHANGE" 
   (	"APID" NUMBER, 
	"EID" VARCHAR2(20 BYTE), 
	"DEP_ID" NUMBER, 
	"JOB_ID" NUMBER, 
	"AP_DEP_ID" NUMBER, 
	"AP_JOB_ID" NUMBER, 
	"WHY" VARCHAR2(100 BYTE), 
	"STATUS" NUMBER, 
	"APPLY_DATE" DATE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table DEP
--------------------------------------------------------

  CREATE TABLE "PSE"."DEP" 
   (	"DEP_ID" NUMBER, 
	"DEP_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "PSE"."EMPLOYEE" 
   (	"EID" VARCHAR2(5 BYTE), 
	"NAME" VARCHAR2(20 BYTE), 
	"ID" VARCHAR2(10 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"PWD" VARCHAR2(25 BYTE), 
	"JOB_ID" NUMBER(10,0), 
	"DEP_ID" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."EMPLOYEE"."EID" IS '一個英文字母+3個數字 ';
   COMMENT ON COLUMN "PSE"."EMPLOYEE"."NAME" IS '姓名';
   COMMENT ON COLUMN "PSE"."EMPLOYEE"."ID" IS '身分證';
   COMMENT ON COLUMN "PSE"."EMPLOYEE"."EMAIL" IS '電子信箱';
   COMMENT ON COLUMN "PSE"."EMPLOYEE"."PWD" IS '密碼';
   COMMENT ON COLUMN "PSE"."EMPLOYEE"."JOB_ID" IS '';
--------------------------------------------------------
--  DDL for Table HOLIDAY
--------------------------------------------------------

  CREATE TABLE "PSE"."HOLIDAY" 
   (	"HID" NUMBER(3,0), 
	"H_DATE" DATE, 
	"H_NAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."HOLIDAY"."HID" IS '假日編號';
   COMMENT ON COLUMN "PSE"."HOLIDAY"."H_DATE" IS '日期';
   COMMENT ON COLUMN "PSE"."HOLIDAY"."H_NAME" IS '假日名稱';
--------------------------------------------------------
--  DDL for Table HOURS
--------------------------------------------------------

  CREATE TABLE "PSE"."HOURS" 
   (	"EID" VARCHAR2(5 BYTE), 
	"YEAR" VARCHAR2(4 BYTE), 
	"KID" NUMBER(3,0), 
	"CREDIT" NUMBER(4,1)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."HOURS"."EID" IS '員工編號';
   COMMENT ON COLUMN "PSE"."HOURS"."YEAR" IS '年度';
   COMMENT ON COLUMN "PSE"."HOURS"."KID" IS '假別編號';
   COMMENT ON COLUMN "PSE"."HOURS"."CREDIT" IS '額度上限（事假無上限）';
--------------------------------------------------------
--  DDL for Table IDENTITY
--------------------------------------------------------

  CREATE TABLE "PSE"."IDENTITY" 
   (	"IDENTITY" VARCHAR2(20 BYTE), 
	"IDENTITY_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table JOB
--------------------------------------------------------

  CREATE TABLE "PSE"."JOB" 
   (	"JOB_ID" NUMBER, 
	"JOB_NAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PSE_KIND
--------------------------------------------------------

  CREATE TABLE "PSE"."PSE_KIND" 
   (	"KID" NUMBER(3,0), 
	"KNAME" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."PSE_KIND"."KID" IS '假別編號';
   COMMENT ON COLUMN "PSE"."PSE_KIND"."KNAME" IS '價別名稱';
--------------------------------------------------------
--  DDL for Table PSE_MAIN
--------------------------------------------------------

  CREATE TABLE "PSE"."PSE_MAIN" 
   (	"PID" NUMBER(8,0), 
	"EID" VARCHAR2(5 BYTE), 
	"STATUS" NUMBER(3,0), 
	"APPLYTIME" DATE, 
	"REPLY" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."PSE_MAIN"."PID" IS '價單編號';
   COMMENT ON COLUMN "PSE"."PSE_MAIN"."EID" IS '員工編號';
   COMMENT ON COLUMN "PSE"."PSE_MAIN"."STATUS" IS '狀態編號';
   COMMENT ON COLUMN "PSE"."PSE_MAIN"."APPLYTIME" IS '申請時間';
   COMMENT ON COLUMN "PSE"."PSE_MAIN"."REPLY" IS '主管回復';
--------------------------------------------------------
--  DDL for Table PSE_STATUS
--------------------------------------------------------

  CREATE TABLE "PSE"."PSE_STATUS" 
   (	"STATUS" NUMBER(3,0), 
	"SNAME" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."PSE_STATUS"."SNAME" IS '狀態名稱(通過/退回/待審核)';
--------------------------------------------------------
--  DDL for Table PSE_SUB
--------------------------------------------------------

  CREATE TABLE "PSE"."PSE_SUB" 
   (	"PID" NUMBER(8,0), 
	"PCID" NUMBER(2,0), 
	"STARTDATETIME" DATE, 
	"ENDDATETIME" DATE, 
	"PCTOTAL" NUMBER(3,1), 
	"KID" NUMBER(3,0), 
	"PS" VARCHAR2(255 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "PSE"."PSE_SUB"."PID" IS '假單編號';
   COMMENT ON COLUMN "PSE"."PSE_SUB"."PCID" IS '子假單序號';
   COMMENT ON COLUMN "PSE"."PSE_SUB"."STARTDATETIME" IS '起始日期時間';
   COMMENT ON COLUMN "PSE"."PSE_SUB"."ENDDATETIME" IS '結束日期時間';
   COMMENT ON COLUMN "PSE"."PSE_SUB"."PCTOTAL" IS '假別時數';
   COMMENT ON COLUMN "PSE"."PSE_SUB"."KID" IS '假別編號';
REM INSERTING into PSE.APARTMENT
SET DEFINE OFF;
Insert into PSE.APARTMENT (APAR_ID,APAR_NAME) values (1,'HR');
Insert into PSE.APARTMENT (APAR_ID,APAR_NAME) values (2,'SALE');
Insert into PSE.APARTMENT (APAR_ID,APAR_NAME) values (3,'IT');
Insert into PSE.APARTMENT (APAR_ID,APAR_NAME) values (4,'FINANCE');
Insert into PSE.APARTMENT (APAR_ID,APAR_NAME) values (5,'MARKETING');
REM INSERTING into PSE.APPLY_CHANGE
SET DEFINE OFF;
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100001,'E155',2,2,5,2,'挑戰自我',1,to_date('2016-01-02 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100002,'E156',3,2,4,2,'太累了',2,to_date('2016-01-03 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100003,'E157',4,2,3,2,'挑戰自我',1,to_date('2016-01-04 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100004,'E158',5,3,2,3,'工作沒挑戰',2,to_date('2016-01-05 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100005,'E109',2,4,1,2,'挑戰自我',1,to_date('2016-01-06 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100006,'E110',3,1,5,4,'無法勝任',2,to_date('2016-01-07 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100007,'E111',4,4,4,1,'挑戰自我',1,to_date('2016-01-08 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100008,'E112',5,1,3,2,'挑戰自我',2,to_date('2016-01-09 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100009,'E113',2,4,2,4,'挑戰自我',1,to_date('2016-01-10 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100010,'E114',3,1,5,1,'挑戰自我',2,to_date('2016-01-11 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100011,'E115',4,4,4,2,'我不喜歡這工作',1,to_date('2016-01-12 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100012,'E116',5,1,3,4,'太累了',2,to_date('2016-01-13 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100013,'E117',2,4,2,1,'挑戰自我',1,to_date('2016-01-14 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100014,'E118',3,1,5,2,'工作沒挑戰',2,to_date('2016-01-15 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100015,'E119',4,1,4,4,'工作沒挑戰',1,to_date('2016-01-16 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100016,'E120',5,4,3,1,'挑戰自我',2,to_date('2016-01-17 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100017,'E121',2,1,2,2,'挑戰自我',1,to_date('2016-01-18 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100018,'E122',3,4,5,4,'工作沒挑戰',2,to_date('2016-01-19 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100019,'E123',4,1,4,1,'挑戰自我',1,to_date('2016-01-20 00:00:00','RRRR-MM-DD HH24:MI:SS'));
Insert into PSE.APPLY_CHANGE (APID,EID,DEP_ID,JOB_ID,AP_DEP_ID,AP_JOB_ID,WHY,STATUS,APPLY_DATE) values (100020,'E101',5,2,3,2,'挑戰自我',2,to_date('2016-01-21 00:00:00','RRRR-MM-DD HH24:MI:SS'));
REM INSERTING into PSE.DEP
SET DEFINE OFF;
Insert into PSE.DEP (DEP_ID,DEP_NAME) values (1,'HR');
Insert into PSE.DEP (DEP_ID,DEP_NAME) values (2,'SALE');
Insert into PSE.DEP (DEP_ID,DEP_NAME) values (3,'IT');
Insert into PSE.DEP (DEP_ID,DEP_NAME) values (4,'FINANCE');
Insert into PSE.DEP (DEP_ID,DEP_NAME) values (5,'MARKETING');
REM INSERTING into PSE.EMPLOYEE
SET DEFINE OFF;
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E158','Beverly Uber','A232961722','aaa111@yahoo.com.tw','aaa111',3,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E159','Beulah Taxxi','A283589185','aaa111@yahoo.com.tw','aaa111',1,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E160','Betty Kitty','A212136170','aaa111@yahoo.com.tw','aaa111',4,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E101','Loren Rivers','A192435152','aaa111@yahoo.com.tw','aaa111',2,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E102','Bennett Green','A161217731','aaa111@yahoo.com.tw','aaa111',3,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E103','Pepys Walker','A172721175','aaa111@yahoo.com.tw','aaa111',2,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E104','Marlon Saxon','A168636565','aaa111@yahoo.com.tw','aaa111',3,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E105','Desiree English','A167824221','aaa111@yahoo.com.tw','aaa111',2,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E106','Terri Wright','A186011931','aaa111@yahoo.com.tw','aaa111',4,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E107','Benson Harris','A164605466','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E108','Monica McDonald','A113696762','aaa111@yahoo.com.tw','aaa111',1,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E109','Jonson Roberts','A117304621','aaa111@yahoo.com.tw','aaa111',4,8);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E110','Hal Banks','A117275287','aaa111@yahoo.com.tw','aaa111',1,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E111','Rusk Bridges','A148436630','aaa111@yahoo.com.tw','aaa111',4,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E112','Lambert Grove','A178984390','aaa111@yahoo.com.tw','aaa111',1,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E113','Arlene Nixon','A186544524','aaa111@yahoo.com.tw','aaa111',4,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E114','Meg Thomas','A197533662','aaa111@yahoo.com.tw','aaa111',1,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E115','Roxanne French','A167167427','aaa111@yahoo.com.tw','aaa111',4,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E116','Wanda Robinson','A119554772','aaa111@yahoo.com.tw','aaa111',1,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E117','Alerander Drum','A167373461','aaa111@yahoo.com.tw','aaa111',4,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E118','Emanuel Taylor','A133711180','aaa111@yahoo.com.tw','aaa111',1,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E119','Alex Rivers','A196123877','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E120','Connie Bell','A108631697','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E121','Stacey Vine','A172874475','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E122','Marjory Evans','A117128121','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E123','Elinor Johnson','A158547533','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E124','Olive Evans','A115505228','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E125','Heather Field','A153278668','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E126','Grote Bell','A257346641','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E127','Thelma Smith','A226365607','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E128','Lucia Thompson','A296283656','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E129','Judith Bell','A244847433','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E130','MacArthur Banks','A285819337','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E131','Nettie Jackson','A280685359','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E132','Cora Salmon','A225823897','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E133','Clay Johnson','A253136416','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E134','Lindsey Roberts','A228958673','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E135','Louisa Dennis','A258873334','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E136','Jamie Smith','A242725158','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E137','Lydia Hughes','A284571963','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E138','Marty Patel','A236456142','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E139','Andre Roberts','A261356851','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E140','Jay Holloway','A264750575','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E141','Keppel Hall','A257240279','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E142','Christian Robinson','A204947212','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E143','Duane Wright','A267374666','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E144','Cowper Dennis','A232961722','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E145','Kellie Walker','A283589185','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E146','Marlon Roberts','A212136170','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E147','Scripps Wright','A248515307','aaa111@yahoo.com.tw','aaa111',1,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E148','Flower Moore','A271710143','aaa111@yahoo.com.tw','aaa111',4,4);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E149','Julius Banks','A247813064','aaa111@yahoo.com.tw','aaa111',1,5);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E150','Louie Harris','A212472831','aaa111@yahoo.com.tw','aaa111',4,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E151','Alva Ello','A232961722','aaa111@yahoo.com.tw','aaa111',3,null);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E152','Amanda Kyler','A283589185','aaa111@yahoo.com.tw','aaa111',3,null);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E153','Amelia Gigi','A212136170','aaa111@yahoo.com.tw','aaa111',1,1);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E154','Ann Jerrny','A248515307','aaa111@yahoo.com.tw','aaa111',4,1);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E155','Audrey Max','A271710143','aaa111@yahoo.com.tw','aaa111',2,2);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E156','Bella Paddy','A247813064','aaa111@yahoo.com.tw','aaa111',2,3);
Insert into PSE.EMPLOYEE (EID,NAME,ID,EMAIL,PWD,JOB_ID,DEP_ID) values ('E157','Bess Puppy','A212472831','aaa111@yahoo.com.tw','aaa111',2,4);
REM INSERTING into PSE.HOLIDAY
SET DEFINE OFF;
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (1,to_date('2016-05-01 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (2,to_date('2016-05-07 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (3,to_date('2016-05-08 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (4,to_date('2016-05-14 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (5,to_date('2016-05-15 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (6,to_date('2016-05-21 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (7,to_date('2016-05-22 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (8,to_date('2016-05-28 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (9,to_date('2016-05-29 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (10,to_date('2016-06-04 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (11,to_date('2016-06-05 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (12,to_date('2016-06-11 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (13,to_date('2016-06-12 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (14,to_date('2016-06-18 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (15,to_date('2016-06-19 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (16,to_date('2016-06-25 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (17,to_date('2016-06-26 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (18,to_date('2016-07-02 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (19,to_date('2016-07-03 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (20,to_date('2016-07-09 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (21,to_date('2016-07-10 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (22,to_date('2016-07-16 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (23,to_date('2016-07-17 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (24,to_date('2016-07-23 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (25,to_date('2016-07-24 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (26,to_date('2016-07-30 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (27,to_date('2016-07-31 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (28,to_date('2016-08-06 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (29,to_date('2016-08-07 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (30,to_date('2016-08-13 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (31,to_date('2016-08-14 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (32,to_date('2016-08-20 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (33,to_date('2016-08-21 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (34,to_date('2016-08-27 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (35,to_date('2016-08-28 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (36,to_date('2016-09-03 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (37,to_date('2016-09-04 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (38,to_date('2016-09-10 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (39,to_date('2016-09-11 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (40,to_date('2016-09-17 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (41,to_date('2016-09-18 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (42,to_date('2016-09-24 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (43,to_date('2016-09-25 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (44,to_date('2016-10-01 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (45,to_date('2016-10-02 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (46,to_date('2016-10-08 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (47,to_date('2016-10-09 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (48,to_date('2016-10-15 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (49,to_date('2016-10-16 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (50,to_date('2016-10-22 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (51,to_date('2016-10-23 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (52,to_date('2016-10-29 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (53,to_date('2016-10-30 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (54,to_date('2016-11-05 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (55,to_date('2016-11-06 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (56,to_date('2016-11-12 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (57,to_date('2016-11-13 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (58,to_date('2016-11-19 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (59,to_date('2016-11-20 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (60,to_date('2016-11-26 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (61,to_date('2016-11-27 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (62,to_date('2016-12-03 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (63,to_date('2016-12-04 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (64,to_date('2016-12-10 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (65,to_date('2016-12-11 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (66,to_date('2016-12-17 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (67,to_date('2016-12-18 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (68,to_date('2016-12-24 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (69,to_date('2016-12-25 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (70,to_date('2016-12-31 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期六');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (71,to_date('2017-01-01 12:00:00','RRRR-MM-DD HH24:MI:SS'),'星期日');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (72,to_date('2017-06-09 12:00:00','RRRR-MM-DD HH24:MI:SS'),'端午節');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (73,to_date('2017-06-10 12:00:00','RRRR-MM-DD HH24:MI:SS'),'彈性放假');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (74,to_date('2016-09-15 12:00:00','RRRR-MM-DD HH24:MI:SS'),'中秋節');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (75,to_date('2016-09-16 12:00:00','RRRR-MM-DD HH24:MI:SS'),'彈性放假');
Insert into PSE.HOLIDAY (HID,H_DATE,H_NAME) values (76,to_date('2016-10-10 12:00:00','RRRR-MM-DD HH24:MI:SS'),'國慶日');
REM INSERTING into PSE.HOURS
SET DEFINE OFF;
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2016',2,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2016',3,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2016',4,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2016',5,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2016',2,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2016',3,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2016',4,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2016',5,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2016',2,240);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2016',3,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2016',4,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2016',5,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2016',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2016',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2016',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2016',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2017',2,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2017',3,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2017',4,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E151','2017',5,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2017',2,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2017',3,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2017',4,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E152','2017',5,50);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E153','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E154','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E155','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E156','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2017',2,240);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2017',3,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2017',4,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E101','2017',5,15);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E102','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E103','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E104','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E105','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E106','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E107','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E108','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E109','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E110','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E111','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E112','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E113','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E114','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E115','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E116','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E117','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E118','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E119','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E120','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E121','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E122','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E123','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E124','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E125','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E126','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E127','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E128','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E129','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E130','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E131','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E132','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E133','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E134','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E135','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E136','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E137','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E138','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E139','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E140','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E141','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E142','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E143','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E144','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E145','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E146','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E147','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E148','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E149','2017',5,40);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2017',2,10);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2017',3,20);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2017',4,30);
Insert into PSE.HOURS (EID,YEAR,KID,CREDIT) values ('E150','2017',5,40);
REM INSERTING into PSE.IDENTITY
SET DEFINE OFF;
Insert into PSE.IDENTITY (IDENTITY,IDENTITY_NAME) values ('M','部門經理');
Insert into PSE.IDENTITY (IDENTITY,IDENTITY_NAME) values ('V','總經理');
Insert into PSE.IDENTITY (IDENTITY,IDENTITY_NAME) values ('H','人資');
Insert into PSE.IDENTITY (IDENTITY,IDENTITY_NAME) values ('E','員工');
REM INSERTING into PSE.JOB
SET DEFINE OFF;
Insert into PSE.JOB (JOB_ID,JOB_NAME) values (1,'助理');
Insert into PSE.JOB (JOB_ID,JOB_NAME) values (2,'部門經理');
Insert into PSE.JOB (JOB_ID,JOB_NAME) values (3,'總經理');
Insert into PSE.JOB (JOB_ID,JOB_NAME) values (4,'專員');
REM INSERTING into PSE.PSE_KIND
SET DEFINE OFF;
Insert into PSE.PSE_KIND (KID,KNAME) values (1,'事假');
Insert into PSE.PSE_KIND (KID,KNAME) values (2,'病假');
Insert into PSE.PSE_KIND (KID,KNAME) values (3,'喪假');
Insert into PSE.PSE_KIND (KID,KNAME) values (4,'產假');
Insert into PSE.PSE_KIND (KID,KNAME) values (5,'特休');
REM INSERTING into PSE.PSE_MAIN
SET DEFINE OFF;
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000001,'E101',2,to_date('2016-05-03 12:52:03','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000002,'E101',2,to_date('2016-05-04 12:52:04','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000003,'E101',4,to_date('2016-05-05 12:52:05','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000004,'E101',4,to_date('2016-05-06 12:52:06','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000005,'E106',1,to_date('2016-05-09 12:52:07','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000006,'E106',2,to_date('2016-05-10 12:52:08','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000007,'E106',2,to_date('2016-05-11 12:52:09','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000008,'E106',2,to_date('2016-05-12 12:52:10','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000009,'E106',2,to_date('2016-05-13 12:52:11','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000010,'E106',2,to_date('2016-05-16 12:52:12','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000011,'E106',2,to_date('2016-05-17 12:52:13','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000012,'E106',1,to_date('2016-05-18 12:52:14','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000013,'E106',1,to_date('2016-05-19 12:52:15','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000014,'E106',1,to_date('2016-05-20 12:52:16','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000015,'E106',1,to_date('2016-05-23 12:52:17','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000016,'E106',1,to_date('2016-05-24 12:52:18','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000017,'E106',1,to_date('2016-05-25 12:52:19','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000018,'E106',2,to_date('2016-05-26 12:52:20','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000019,'E106',2,to_date('2016-06-01 12:52:21','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000020,'E106',2,to_date('2016-06-02 12:52:22','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000021,'E106',2,to_date('2016-06-03 12:52:23','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000022,'E106',2,to_date('2016-06-06 12:52:24','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000023,'E106',2,to_date('2016-06-07 12:52:25','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000024,'E106',2,to_date('2016-06-08 12:52:26','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000025,'E106',2,to_date('2016-07-01 12:52:27','RRRR-MM-DD HH24:MI:SS'),'該時段要開會');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000026,'E106',1,to_date('2016-07-04 12:52:28','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000027,'E107',1,to_date('2016-07-05 12:52:29','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000028,'E107',1,to_date('2016-07-06 12:52:30','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000029,'E107',1,to_date('2016-07-07 12:52:31','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000030,'E107',1,to_date('2016-07-08 12:52:32','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000031,'E107',1,to_date('2016-07-11 12:52:33','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000032,'E107',1,to_date('2016-07-12 12:52:34','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000033,'E107',1,to_date('2016-07-13 12:52:35','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000034,'E107',1,to_date('2016-07-14 12:52:36','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000035,'E107',1,to_date('2016-07-15 12:52:37','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000036,'E108',1,to_date('2016-07-18 12:52:38','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000037,'E108',1,to_date('2016-07-19 12:52:39','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000038,'E108',1,to_date('2016-07-20 12:52:40','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000039,'E108',1,to_date('2016-07-21 12:52:41','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000040,'E108',1,to_date('2016-07-22 12:52:42','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000041,'E109',1,to_date('2016-07-22 12:52:43','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000042,'E109',1,to_date('2016-07-22 12:52:44','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000043,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000044,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000045,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000046,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000047,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000048,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000049,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000050,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000051,'E109',1,to_date('2016-08-05 12:52:45','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000052,'E109',1,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000053,'E109',1,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000054,'E109',1,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000055,'E109',2,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000056,'E109',2,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),'nonononono');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000057,'E109',1,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000058,'E109',2,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),'?????????');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000059,'E109',2,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000060,'E109',3,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000061,'E109',3,to_date('2016-09-20 12:52:54','RRRR-MM-DD HH24:MI:SS'),'xcvxcvxcvxcv');
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000062,'E101',3,to_date('2016-05-23 10:56:00','RRRR-MM-DD HH24:MI:SS'),null);
Insert into PSE.PSE_MAIN (PID,EID,STATUS,APPLYTIME,REPLY) values (10000063,'E101',3,to_date('2016-05-27 04:34:00','RRRR-MM-DD HH24:MI:SS'),null);
REM INSERTING into PSE.PSE_STATUS
SET DEFINE OFF;
Insert into PSE.PSE_STATUS (STATUS,SNAME) values (1,'通過');
Insert into PSE.PSE_STATUS (STATUS,SNAME) values (2,'退回');
Insert into PSE.PSE_STATUS (STATUS,SNAME) values (3,'待審核');
Insert into PSE.PSE_STATUS (STATUS,SNAME) values (4,'刪除');
REM INSERTING into PSE.PSE_SUB
SET DEFINE OFF;
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000062,1,to_date('2016-05-10 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-10 10:00:00','RRRR-MM-DD HH24:MI:SS'),1,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000063,1,to_date('2016-05-31 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-31 03:30:00','RRRR-MM-DD HH24:MI:SS'),5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000001,1,to_date('2016-05-09 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-09 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000001,2,to_date('2016-05-16 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-16 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000001,3,to_date('2016-05-23 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-23 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000002,1,to_date('2016-05-30 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-30 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000002,2,to_date('2016-06-06 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-06 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000003,1,to_date('2016-06-13 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-13 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000004,1,to_date('2016-06-20 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-20 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000004,2,to_date('2016-06-27 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-27 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000005,1,to_date('2016-07-04 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-04 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000006,1,to_date('2016-07-11 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-11 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000006,2,to_date('2016-07-18 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-18 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000007,1,to_date('2016-07-25 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-25 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000007,2,to_date('2016-08-01 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-01 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000007,3,to_date('2016-08-08 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-08 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000008,1,to_date('2016-08-15 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-15 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000008,2,to_date('2016-08-22 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-22 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000008,3,to_date('2016-08-29 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-29 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000009,1,to_date('2016-09-05 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-05 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000010,1,to_date('2016-09-12 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-12 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000011,1,to_date('2016-09-19 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-19 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000011,2,to_date('2016-09-26 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-26 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000012,1,to_date('2016-10-03 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-03 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000013,1,to_date('2016-10-10 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-10 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000014,1,to_date('2016-10-17 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-17 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000014,2,to_date('2016-10-24 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-24 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000015,1,to_date('2016-10-31 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-31 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000016,1,to_date('2016-11-07 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-07 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000017,1,to_date('2016-11-14 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-14 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000018,1,to_date('2016-11-21 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-21 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000019,1,to_date('2016-11-28 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-28 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000020,1,to_date('2016-12-05 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-05 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000021,1,to_date('2016-12-12 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-12 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000022,1,to_date('2016-12-19 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-19 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000023,1,to_date('2016-12-26 09:30:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-26 04:00:00','RRRR-MM-DD HH24:MI:SS'),6.5,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000024,1,to_date('2016-05-03 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-03 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000025,1,to_date('2016-05-10 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-10 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000026,1,to_date('2016-05-17 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-17 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000027,1,to_date('2016-05-24 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-24 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000028,1,to_date('2016-05-31 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-31 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000029,1,to_date('2016-06-07 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-07 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000030,1,to_date('2016-06-14 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-14 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000031,1,to_date('2016-06-21 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-21 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000031,2,to_date('2016-06-28 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-28 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000032,1,to_date('2016-07-05 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-05 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000032,2,to_date('2016-07-12 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-12 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000033,1,to_date('2016-07-19 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-19 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000033,2,to_date('2016-07-26 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-26 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000033,3,to_date('2016-08-02 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-02 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000034,1,to_date('2016-08-09 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-09 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000035,1,to_date('2016-08-16 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-16 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000035,2,to_date('2016-08-23 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-23 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000035,3,to_date('2016-08-30 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-08-30 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000036,1,to_date('2016-09-06 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-06 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000037,1,to_date('2016-09-13 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-13 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000037,2,to_date('2016-09-20 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-09-20 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000038,1,to_date('2016-10-04 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-04 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000039,1,to_date('2016-10-11 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-11 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000040,1,to_date('2016-10-18 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-18 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000041,1,to_date('2016-10-25 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-10-25 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000042,1,to_date('2016-11-01 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-01 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000043,1,to_date('2016-11-08 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-08 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000044,1,to_date('2016-11-15 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-15 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000045,1,to_date('2016-11-22 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-22 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000046,1,to_date('2016-11-29 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-11-29 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000047,1,to_date('2016-12-06 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-06 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000048,1,to_date('2016-12-13 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-13 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000049,1,to_date('2016-12-20 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-20 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000050,1,to_date('2016-12-27 09:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-12-27 01:00:00','RRRR-MM-DD HH24:MI:SS'),4,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000051,1,to_date('2016-05-02 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-02 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000052,1,to_date('2016-05-09 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-09 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000053,1,to_date('2016-05-16 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-16 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000054,1,to_date('2016-05-23 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-23 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000055,1,to_date('2016-05-30 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-05-30 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000056,1,to_date('2016-06-06 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-06 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,4,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000057,1,to_date('2016-06-13 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-13 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000058,1,to_date('2016-06-20 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-20 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,2,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000059,1,to_date('2016-06-27 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-27 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,1,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000060,1,to_date('2016-07-04 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-04 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,3,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000061,1,to_date('2016-07-11 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-07-11 06:00:00','RRRR-MM-DD HH24:MI:SS'),8,5,null);
Insert into PSE.PSE_SUB (PID,PCID,STARTDATETIME,ENDDATETIME,PCTOTAL,KID,PS) values (10000063,2,to_date('2016-06-01 10:00:00','RRRR-MM-DD HH24:MI:SS'),to_date('2016-06-03 04:00:00','RRRR-MM-DD HH24:MI:SS'),21,1,null);
--------------------------------------------------------
--  DDL for Index EMPLOYEE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."EMPLOYEE_PK" ON "PSE"."EMPLOYEE" ("EID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PSE_SUB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."PSE_SUB_PK" ON "PSE"."PSE_SUB" ("PID", "PCID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PSE_MAIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."PSE_MAIN_PK" ON "PSE"."PSE_MAIN" ("PID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PSE_KIND_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."PSE_KIND_PK" ON "PSE"."PSE_KIND" ("KID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index IDENTITY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."IDENTITY_PK" ON "PSE"."IDENTITY" ("IDENTITY") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index APPLY_CHANGE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."APPLY_CHANGE_PK" ON "PSE"."APPLY_CHANGE" ("APID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index JOB_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."JOB_PK" ON "PSE"."JOB" ("JOB_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HOLIDAY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."HOLIDAY_PK" ON "PSE"."HOLIDAY" ("HID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index PSE_STATUS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."PSE_STATUS_PK" ON "PSE"."PSE_STATUS" ("STATUS") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index HOURS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."HOURS_PK" ON "PSE"."HOURS" ("EID", "YEAR", "KID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index APARTMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PSE"."APARTMENT_PK" ON "PSE"."DEP" ("DEP_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "PSE"."EMPLOYEE" MODIFY ("EID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."EMPLOYEE" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."EMPLOYEE" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."EMPLOYEE" MODIFY ("JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."EMPLOYEE" ADD CONSTRAINT "EMPLOYEE_PK" PRIMARY KEY ("EID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."EMPLOYEE" MODIFY ("PWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table JOB
--------------------------------------------------------

  ALTER TABLE "PSE"."JOB" ADD CONSTRAINT "JOB_PK" PRIMARY KEY ("JOB_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."JOB" MODIFY ("JOB_NAME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."JOB" MODIFY ("JOB_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PSE_SUB
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("PCID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("STARTDATETIME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("ENDDATETIME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("PCTOTAL" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" MODIFY ("KID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_SUB" ADD CONSTRAINT "PSE_SUB_PK" PRIMARY KEY ("PID", "PCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table HOURS
--------------------------------------------------------

  ALTER TABLE "PSE"."HOURS" MODIFY ("CREDIT" NOT NULL ENABLE);
  ALTER TABLE "PSE"."HOURS" ADD CONSTRAINT "HOURS_PK" PRIMARY KEY ("EID", "YEAR", "KID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."HOURS" MODIFY ("KID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."HOURS" MODIFY ("YEAR" NOT NULL ENABLE);
  ALTER TABLE "PSE"."HOURS" MODIFY ("EID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APPLY_CHANGE
--------------------------------------------------------

  ALTER TABLE "PSE"."APPLY_CHANGE" ADD CONSTRAINT "APPLY_CHANGE_PK" PRIMARY KEY ("APID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("WHY" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("AP_JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("AP_DEP_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("JOB_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("DEP_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("EID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APPLY_CHANGE" MODIFY ("APID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PSE_MAIN
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_MAIN" MODIFY ("APPLYTIME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_MAIN" ADD CONSTRAINT "PSE_MAIN_PK" PRIMARY KEY ("PID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."PSE_MAIN" MODIFY ("PID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_MAIN" MODIFY ("EID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_MAIN" MODIFY ("STATUS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table APARTMENT
--------------------------------------------------------

  ALTER TABLE "PSE"."APARTMENT" MODIFY ("APAR_ID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."APARTMENT" MODIFY ("APAR_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEP
--------------------------------------------------------

  ALTER TABLE "PSE"."DEP" ADD CONSTRAINT "APARTMENT_PK" PRIMARY KEY ("DEP_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."DEP" MODIFY ("DEP_NAME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."DEP" MODIFY ("DEP_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table HOLIDAY
--------------------------------------------------------

  ALTER TABLE "PSE"."HOLIDAY" MODIFY ("HID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."HOLIDAY" ADD CONSTRAINT "HOLIDAY_PK" PRIMARY KEY ("HID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."HOLIDAY" MODIFY ("H_DATE" NOT NULL ENABLE);
  ALTER TABLE "PSE"."HOLIDAY" MODIFY ("H_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PSE_KIND
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_KIND" MODIFY ("KID" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_KIND" ADD CONSTRAINT "PSE_KIND_PK" PRIMARY KEY ("KID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."PSE_KIND" MODIFY ("KNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table IDENTITY
--------------------------------------------------------

  ALTER TABLE "PSE"."IDENTITY" MODIFY ("IDENTITY" NOT NULL ENABLE);
  ALTER TABLE "PSE"."IDENTITY" MODIFY ("IDENTITY_NAME" NOT NULL ENABLE);
  ALTER TABLE "PSE"."IDENTITY" ADD CONSTRAINT "IDENTITY_PK" PRIMARY KEY ("IDENTITY")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table PSE_STATUS
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_STATUS" MODIFY ("STATUS" NOT NULL ENABLE);
  ALTER TABLE "PSE"."PSE_STATUS" ADD CONSTRAINT "PSE_STATUS_PK" PRIMARY KEY ("STATUS")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "PSE"."PSE_STATUS" MODIFY ("SNAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table HOURS
--------------------------------------------------------

  ALTER TABLE "PSE"."HOURS" ADD CONSTRAINT "HOURS_EMPLOYEE_FK1" FOREIGN KEY ("EID")
	  REFERENCES "PSE"."EMPLOYEE" ("EID") ENABLE;
  ALTER TABLE "PSE"."HOURS" ADD CONSTRAINT "HOURS_PSE_KIND_FK1" FOREIGN KEY ("KID")
	  REFERENCES "PSE"."PSE_KIND" ("KID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PSE_MAIN
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_MAIN" ADD CONSTRAINT "PSE_MAIN_EMPLOYEE_FK1" FOREIGN KEY ("EID")
	  REFERENCES "PSE"."EMPLOYEE" ("EID") ENABLE;
  ALTER TABLE "PSE"."PSE_MAIN" ADD CONSTRAINT "PSE_MAIN_PSE_STATUS_FK1" FOREIGN KEY ("STATUS")
	  REFERENCES "PSE"."PSE_STATUS" ("STATUS") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PSE_SUB
--------------------------------------------------------

  ALTER TABLE "PSE"."PSE_SUB" ADD CONSTRAINT "PSE_SUB_PSE_KIND_FK1" FOREIGN KEY ("KID")
	  REFERENCES "PSE"."PSE_KIND" ("KID") ENABLE;
  ALTER TABLE "PSE"."PSE_SUB" ADD CONSTRAINT "PSE_SUB_PSE_MAIN_FK1" FOREIGN KEY ("PID")
	  REFERENCES "PSE"."PSE_MAIN" ("PID") ENABLE;
