CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE IF NOT EXISTS "Location" (
	"Id"						uuid 						NOT NULL 		DEFAULT gen_random_uuid() 	PRIMARY KEY,
	"Name"					VARCHAR(255)		NOT NULL,
	"IP"						VARCHAR(255)		NOT NULL,
	"Path"					VARCHAR(255)		NOT NULL,
	"PublicPath"		VARCHAR(255)		NOT NULL 		UNIQUE,
	"Default"				int2						NOT NULL,
	
	CONSTRAINT "LocationIpPathUnique"	UNIQUE ("Name", "IP")
);

CREATE TABLE IF NOT EXISTS "Bucket" (
		"Id" 					uuid 						NOT NULL 	DEFAULT gen_random_uuid() 	PRIMARY KEY,
		"Name" 				VARCHAR(255) 		NOT NULL 															UNIQUE,
		"Location" 		uuid 						NOT NULL,
		"CreatedAt" 	DATE 											DEFAULT now( ),
		"UpdatedAt" 	DATE 											DEFAULT NULL,
		"DeletedAt" 	DATE DEFAULT NULL,
		
		CONSTRAINT "BucketLocationForeignKey" FOREIGN KEY ( "Location" ) REFERENCES "Location" ( "Id" ) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE INDEX BucketNameIndex ON "Bucket" ("Name");

CREATE TABLE IF NOT EXISTS "MultipartObject" (
	"Id"						uuid 						NOT NULL 		DEFAULT gen_random_uuid() 	PRIMARY KEY,
	"Key" 					VARCHAR(255) 		NOT NULL,
	"Bucket" 				uuid 						NOT NULL,
	"UploadId" 			VARCHAR(2555) 							DEFAULT NULL,
	"CreatedAt" 		DATE 						NOT NULL		DEFAULT now(),
	"UpdatedAt" 		DATE 												DEFAULT NULL,
	"DeletedAt" 		DATE 												DEFAULT NULL
);

CREATE TYPE "ObjectStatus" AS ENUM ('Completed', 'Aborted', 'Failed');
CREATE TABLE IF NOT EXISTS "Object" (
		"Id" 							uuid						NOT NULL 		DEFAULT gen_random_uuid() 	PRIMARY KEY,
		"Bucket" 					uuid 						NOT NULL,
		"Key" 						VARCHAR(255) 		NOT NULL,
		"Etag" 						VARCHAR(255) 		NOT NULL,
		"Status" 					"ObjectStatus" 	NOT NULL 		DEFAULT 'Completed',
		"MultipartObject" uuid 												DEFAULT NULL,
		"CreatedAt" 			DATE 						NOT NULL		DEFAULT now(),
		"UpdatedAt" 			DATE 												DEFAULT NULL,
		"DeletedAt" 			DATE 												DEFAULT NULL,
		
		CONSTRAINT "ObjectBucketForeignKey" FOREIGN KEY ( "Bucket" ) REFERENCES "Bucket" ( "Id" ) ON DELETE CASCADE ON UPDATE CASCADE,
		CONSTRAINT "ObjectMultipartObjectForeignKey" FOREIGN KEY ( "MultipartObject" ) REFERENCES "MultipartObject" ( "Id" ) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE OR REPLACE PROCEDURE InsertBucket(Name CHARACTER VARYING, Location CHARACTER VARYING) 
LANGUAGE plpgsql 
AS 
$$
BEGIN
	INSERT INTO "Bucket"("Name", "Location")
	VALUES(Name, Location);
COMMIT;
END
$$




