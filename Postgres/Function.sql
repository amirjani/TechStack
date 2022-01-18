CREATE OR REPLACE FUNCTION InsertBucket(Name CHARACTER VARYING, Location CHARACTER VARYING) 
returns void AS 
$$
BEGIN
	RETURN QUERY
		INSERT INTO "Bucket"("Name", "Location")
		VALUES(Name, Location);
COMMIT;
END
$$ LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION ListBucket() 
returns table(
	Id uuid,
	Name VARCHAR,
	Location uuid,
	CreatedAt date, 
	UpdatedAt date,
	DeletedAt date
) AS 
$$
BEGIN
	RETURN QUERY
		SELECT * FROM "Bucket"
COMMIT;
END
$$ LANGUAGE 'plpgsql'
