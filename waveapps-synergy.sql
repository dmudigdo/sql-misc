/*
    Buggered if I can remember what this does
*/

SELECT
  substr(date, 8, 4) || '-' ||               
    CASE substr(date, 4, 3)                    
        WHEN 'Jan' THEN '01'
        WHEN 'Feb' THEN '02'
        WHEN 'Mar' THEN '03'
        WHEN 'Apr' THEN '04'
        WHEN 'May' THEN '05'
        WHEN 'Jun' THEN '06'
        WHEN 'Jul' THEN '07'
        WHEN 'Aug' THEN '08'
        WHEN 'Sep' THEN '09'
        WHEN 'Oct' THEN '10'
        WHEN 'Nov' THEN '11'
        WHEN 'Dec' THEN '12'
    END || '-' ||
    substr(date, 1, 2) AS converted_date,
  description, credit - debit AS Amount 
  FROM 'synergy' where credit == '0' ;
