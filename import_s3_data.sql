CREATE OR REPLACE PROCEDURE public.read_from_s3
(	
    p_table text
, 	p_folder text
, 	p_bucket text
, 	p_region text
)
 LANGUAGE plpgsql
AS $procedure$
DECLARE
    var_script TEXT DEFAULT '';
BEGIN
	IF (SELECT column_name 
		FROM information_schema.columns 
		WHERE table_schema = ''
		and table_name=p_table 
		and column_name=''
		) IS NULL THEN
		var_script := 'truncate table public."' || p_table || '";';
		EXECUTE var_script;
		PERFORM aws_s3.table_import_from_s3(
		                          'public."' || p_table || '"',
		                          '',
		                          '(FORMAT csv, DELIMITER "|", encoding "UTF8", QUOTE ''"'')',
		                          p_bucket,
		                          '' || p_folder || '/UTF8/' || '.csv',
		                          p_region
		                          );
	END IF;
END;
$procedure$