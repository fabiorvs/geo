CREATE DEFINER=`root`@`localhost` FUNCTION `Geo`(
	`lat_ini` FLOAT(18,10),
	`lon_ini` FLOAT(18,10),
	`lat_fim` FLOAT(18,10),
	`lon_fim` FLOAT(18,10)
)
RETURNS float(18,10)
LANGUAGE SQL
NOT DETERMINISTIC
CONTAINS SQL
SQL SECURITY DEFINER
COMMENT ''
BEGIN
DECLARE Theta FLOAT(18,10);
DECLARE Dist FLOAT(18,10);
DECLARE Miles FLOAT(18,10);
DECLARE kilometers FLOAT(18,10);

SET Theta = lon_ini - lon_fim;
SET Dist  = SIN(RADIANS(lat_ini)) * SIN(RADIANS(lat_fim)) +  COS(RADIANS(lat_ini)) * COS(RADIANS(lat_fim)) * COS(RADIANS(Theta));
SET Dist  = ACOS(Dist);
SET Dist  = DEGREES(Dist);
SET Miles = Dist * 60 * 1.1515;
SET kilometers = Miles * 1.609344;

RETURN kilometers;

END
