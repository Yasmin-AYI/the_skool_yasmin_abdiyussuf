SET PAGESIZE 200
SET LINESIZE 200

--Fråga a: Antal ansökningar per utbildningsområde, sorterat på flest ansökningar
SELECT utbildningsomrade, COUNT (*) AS antal_ansokningar
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC; 

--Fråga b: Antal BEVILJADE ansökningar per utbildningsområde
Select utbildningsomrade, COUNT (*) AS antal_ansokningar
FROM ansokningar 
WHERE Beslut ='Beviljad'
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC;

--Fråga c: Antal AVSLAGNA ansökningar per utbildningsområde
SELECT utbildningsomrade, COUNT(*) AS antal_ansokningar
FROM ansokningar 
WHERE Beslut = 'Avslag' 
GROUP BY utbildningsomrade
ORDER BY antal_ansokningar DESC; 

--Fråga d: Antal BEVILJADE ansökningar  per utbildningsnamn inom Data/IT
SELECT utbildningsnamn, COUNT (*) AS antal_ansokningar
FROM ansokningar
Where Beslut = 'Beviljad' AND utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_ansokningar DESC;

--Fråga e: Antalet AVSLAGNA ansökningar per utbildningsnamn inom DATA/IT 
SELECT utbildningsnamn, COUNT (*) AS antal_ansokningar
FROM ansokningar
WHERE Beslut = 'Avslag' AND  utbildningsomrade = 'Data/IT'
GROUP BY utbildningsnamn
ORDER BY antal_ansokningar DESC;

