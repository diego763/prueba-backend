BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "auth" (
	"auth_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"employee_id"	INTEGER NOT NULL,
	"auth_user"	TEXT NOT NULL UNIQUE,
	"auth_pass"	TEXT NOT NULL,
	FOREIGN KEY("employee_id") REFERENCES "employee"("employee_id")
);
CREATE TABLE IF NOT EXISTS "entry_record" (
	"entry_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"employee_id"	INTEGER NOT NULL,
	"entry_out_time"	INTEGER NOT NULL DEFAULT 0,
	"entry_logout"	INTEGER NOT NULL DEFAULT 0,
	"entry_date_created"	TEXT,
	FOREIGN KEY("employee_id") REFERENCES "employee"("employee_id")
);
CREATE TABLE IF NOT EXISTS "report" (
	"report_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"employee_id"	INTEGER NOT NULL,
	"office_code"	TEXT NOT NULL,
	"report_title"	TEXT NOT NULL,
	"report_description"	TEXT NOT NULL,
	"report_date_crated"	TEXT NOT NULL,
	FOREIGN KEY("office_code") REFERENCES "office"("office_code"),
	FOREIGN KEY("employee_id") REFERENCES "employee"("employee_id")
);
CREATE TABLE IF NOT EXISTS "employee" (
	"employee_id"	INTEGER PRIMARY KEY AUTOINCREMENT,
	"employee_name"	TEXT NOT NULL,
	"employee_rut"	TEXT NOT NULL UNIQUE,
	"employee_age"	INTEGER NOT NULL,
	"employee_vigilant"	INTEGER NOT NULL DEFAULT 0,
	"employee_vigilant_hiring_date"	TEXT
);
CREATE TABLE IF NOT EXISTS "vigilant_has_office" (
	"vigilant_id"	INTEGER NOT NULL,
	"office_code"	TEXT NOT NULL,
	"active"	INTEGER DEFAULT 0,
	FOREIGN KEY("vigilant_id") REFERENCES "employee"("employee_id"),
	FOREIGN KEY("office_code") REFERENCES "office"("office_code")
);
CREATE TABLE IF NOT EXISTS "office" (
	"office_code"	TEXT UNIQUE,
	"office_address"	TEXT NOT NULL,
	"bank_code"	TEXT NOT NULL,
	PRIMARY KEY("office_code"),
	FOREIGN KEY("bank_code") REFERENCES "bank"("bank_code")
);
CREATE TABLE IF NOT EXISTS "bank" (
	"bank_code"	TEXT UNIQUE,
	"bank_name"	TEXT,
	PRIMARY KEY("bank_code")
);
INSERT INTO "auth" VALUES (1,1,'user_empleado1','123456');
INSERT INTO "auth" VALUES (2,2,'user_empleado2','123456');
INSERT INTO "auth" VALUES (3,3,'user_empleado3','123456');
INSERT INTO "entry_record" VALUES (1,1,1,0,'2022-01-17');
INSERT INTO "entry_record" VALUES (2,2,0,1,'2022-01-17');
INSERT INTO "entry_record" VALUES (3,3,0,0,'2022-01-17');
INSERT INTO "report" VALUES (1,3,'office_1','Puertas no cierran','...descripcion del problema','2022-01-17');
INSERT INTO "employee" VALUES (1,'empleado 1','11.111.111-1',30,0,NULL);
INSERT INTO "employee" VALUES (2,'empleado 2','22.222.222-2',31,0,NULL);
INSERT INTO "employee" VALUES (3,'vigilante 1','33.333.333-3',28,1,'2022-01-17');
INSERT INTO "vigilant_has_office" VALUES (3,'office_1',1);
INSERT INTO "vigilant_has_office" VALUES (3,'office_2',0);
INSERT INTO "office" VALUES ('office_1','calle 12, numero 8888','bank_1');
INSERT INTO "office" VALUES ('office_2','calle freire 244','bank_1');
INSERT INTO "office" VALUES ('office_3','calle angol 444','bank_2');
INSERT INTO "bank" VALUES ('bank_1','Banco 1');
INSERT INTO "bank" VALUES ('bank_2','Banco 2');
INSERT INTO "bank" VALUES ('bank_3','Banco_3');
COMMIT;
