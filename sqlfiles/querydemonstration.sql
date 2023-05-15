/* Query 1 */
SELECT TABLE_NAME, COLUMN_NAME, DATA_TYPE, COLUMN_KEY
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA IN ('ARTMUSEUM');

-- Comment on Outputs:
-- As expected, the primary keys in each table are shown with the keyword "PRI" in the COLUMN_KEY column.
-- Another constraint shown in the COLUMN_KEY column is MUL. Attributes with these constraints are foreign keys that do not
-- reference ART_OBJECT. The datatypes used for our attributes are mainly varchar and int. 

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE
	REFERENCED_TABLE_SCHEMA = 'artmuseum';

-- Comment on Outputs:
-- This output specifically shows the constraints of foreign keys, and name of referenced columns and tables


/* Query 2 */
SELECT Date_Born, Date_Died
FROM Artist
WHERE Artist_Name = "Nicholas Hilliard";

/* Query 3 */
SELECT Title, Year_Made, Artist FROM ART_OBJECT
ORDER BY Year_Made DESC;

/* Query 4 */ 
SELECT AO.Title, AO.Artist
FROM ART_OBJECT AS AO
WHERE Id_no IN (
    SELECT Id_no
    FROM EXHIBITIONS
    WHERE Exhibitions_name = "The Tudors: Art and Majesty in Renaissance England");

/* Query 5 */
SELECT ART_OBJECT.ARTIST, EXHIBITIONS.Exhibitions_name
FROM ART_OBJECT
JOIN EXHIBITIONS ON ART_OBJECT.Id_no = EXHIBITIONS.Id_no;


/* query 6 */ 
DROP TRIGGER IF EXISTS set_weight;
CREATE TRIGGER set_weight
BEFORE UPDATE ON SCULPTURE
FOR EACH ROW
SET NEW.Weight_kg = if (
    (SELECT Weight_kg
    FROM SCULPTURE
    WHERE (Id_no = NEW.Id_no)) < NEW.Weight_kg
                    OR (SELECT Weight_kg
                        FROM SCULPTURE
                        WHERE (Id_no = NEW.Id_no)) IS NULL, NEW.Weight_kg,
                                                (SELECT Weight_kg
                                                FROM SCULPTURE
                                                WHERE Id_no = NEW.Id_no));



UPDATE SCULPTURE SET Weight_kg = '12' WHERE Id_no = 23452; 


/* Query 7 */
SET SQL_SAFE_UPDATES = 0;

DROP TRIGGER IF EXISTS artob_update;
CREATE TRIGGER artob_update
BEFORE DELETE ON ARTIST
FOR EACH ROW 
UPDATE ART_OBJECT SET Artist = 'Unknown' WHERE Artist = 'Nicholas Hilliard';

DELETE FROM ARTIST WHERE Artist_Name = 'Nicholas Hilliard';

SET SQL_SAFE_UPDATES = 1;





