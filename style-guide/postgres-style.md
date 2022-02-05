# Postgres Style Guide 

## Names
Use UpperCase for statements, operators and keywords 
```sql
-- Bad
SELECT * FROM foo order by bar;

-- Good 
SELECT * FROM "Foo" ORDER BY "Foo"."Bar";
```

Always use UpperCamel case for naming tables, properties, variables, methods, procedures, ... 

```sql
-- Bad
CREATE TABLE foo(
    id integer primary key 
    -- other property 
);

-- Good
CREATE TABLE "Foo"(
    Id UUID PRIMARY KEY 
    -- other property 
);
```

## Calling Methods 
We always using UpperCamel case so you must use ```""``` for correct calling 

```sql 
-- Bad 
CALL InsertFooFunction();

-- Good
CALL "InsertFooFunction"();
```

When you using operations you must to determine the table that you are using
```sql 
-- Bad 
SELECT * FROM "Foo" WHERE "Bar" = 1;

-- Good 
SELECT * FROM "Foo" WHERE "Foo"."Bar" = 1;
```

## Function And Create Table 
Use UpperCamel case for types too: 
```sql
-- Bad 
CREATE TABLE "Foo"(
    bar integer 
    baz integer
);

-- Good
CREATE TABLE "Foo"(
    bar INTEGER,
    baz TEXT 
);
```

## Operators 
Use same difference operator as other languages 
```sql 
-- Bad
SELECT "Foo"."Baz" FROM "Foo" WHERE "Foo"."Bar" <> "Foo"."Baz";

-- Good 
SELECT "Foo"."Baz" FROM "Foo" WHERE "Foo"."Bar" != "Foo"."Baz";
```

```sql 
-- Bad
SELECT 'Foo' || 'Bar';

-- Good
SELECT CONCAT('foo', 'bar')
```

Don't use casting when not needed 
```sql
-- Bad
SELECT CAST('bar' AS INTEGER)

-- Good
SELECT 'bar'::INTEGER
```

## Functions 
We always use functions for modification and retrieving data 

**Use ```Query*``` for inputs**
```sql 
-- good
CREATE TABLE "Foo"("QueryBar" INTEGER) 
    RETURNS TEXT AS
    $$
    BEGIN
        SELECT 'Baz'
    END
    $$ LANGUAGE 'plpgsql';
```

**You can use default**
```sql
CREATE TABLE "Foo"("QueryBar" INTEGER DEFAULT 0) 
    RETURNS TEXT AS
    $$
    BEGIN
        SELECT 'Baz'
    END
    $$ LANGUAGE 'plpgsql';
```

**If you are inserting data in database, return inserted row as output**
```sql
CREATE OR REPLACE FUNCTION "InsertBucket"(
	"QueryName" CHARACTER VARYING
)
RETURNS TABLE(
	"Id" UUID,
	"Name" CHARACTER VARYING,
)
AS
$$
DECLARE
	"BucketUUID" uuid;
BEGIN
	INSERT INTO
		"Bucket"("Name")
	VALUES("QueryName")
	RETURNING "Bucket"."Id" INTO "BucketUUID";

	RETURN QUERY
		SELECT "Bucket"."Id" , "Bucket"."Name"
		FROM "Bucket"
		WHERE "Bucket"."Id" = "BucketUUID";
END
$$
LANGUAGE 'plpgsql';%
````

## Table 
Use **_Singular_** words for table names 

```sql
--bad
SELECT "Foo" FROM "Bars";

-- good
SELECT "Bar"."Foo" FROM "Bar";
```

## Indexes
Index Names must be very explicit on the ```INDEX_*table*_ON_*column*(_AND_*column*)``` pattern.
```sql
-- bad
CREATE INDEX ON foo(bar, baz);

-- good
CREATE INDEX "INDEX_Foo_ON_Bar_AND_Baz" ON "Foo"("Bar", "Baz");
```

## Statements
specify wanted property 
```sql
-- bad
SELECT * FROM "Foo";

-- good
SELECT "Foo"."Bar", "Foo"."Baz" FROM "Foo";
```

**JOIN:** Use join on instead of join and natural join
```sql
-- bad
SELECT baz FROM foo NATURAL JOIN bar;

-- bad
SELECT baz FROM foo JOIN bar USING(foo_id);

-- good
SELECT "Foo"."Baz" FROM "Foo" JOIN "Bar" ON "Foo"."Id" = "Bar"."Foo_id";
```

**Do not use NOT IN, it never matches if there is but a single NULL in the list.**

## Indention 
Create Table
```sql
CREATE TABLE IF NOT EXISTS "Location" (
	"Id"				UUID 				NOT NULL 		DEFAULT gen_random_uuid() 	PRIMARY KEY,
	"Name"				VARCHAR(255)		NOT NULL,
	"IP"				VARCHAR(255)		NOT NULL,
	"Path"				VARCHAR(255)		NOT NULL,
	"PublicPath"		VARCHAR(255)		NOT NULL 		UNIQUE,
	"Default"			INT2				NOT NULL,
	
	CONSTRAINT "LocationIpPathUnique"	UNIQUE ("Name", "IP")
);
```

Create Function
```sql
CREATE OR REPLACE FUNCTION "GetOneBucket"(Name VARCHAR)
RETURNS TABLE (
    "Id" uuid,
    "Name" VARCHAR,
    "Location" uuid,
    "CreatedAt" date,
    "UpdatedAt" date,
    "DeletedAt" date
) AS
$$
BEGIN
    RETURN QUERY
        SELECT * FROM "Bucket" As bck
				WHERE bck."Name" = Name;
END
$$ LANGUAGE 'plpgsql';

```
