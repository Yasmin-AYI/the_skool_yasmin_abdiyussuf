SET LOAD SCAN_ROWS 50000
LOAD ansokningar data/tabell3.csv NEW
SELECT COUNT (*) FROM ansokningar;
