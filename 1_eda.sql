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

--Fråga f: Antalet BEVILJADE ansökninghar per utbilningsanordnare administrativ enhet & utbildningsnamn, inom Data/IT
SELECT anordnare,utbildningsnamn, COUNT (*) AS antal_ansokningar
FROM ansokningar
Where Beslut = 'Beviljad' AND utbildningsomrade = 'Data/IT'
GROUP BY  anordnare, utbildningsnamn
ORDER BY antal_ansokningar DESC;

--Fråga g: Topp 5 län efter antal beviljade ansökningar
SELECT lan , COUNT (*) AS antal_ansokningar
FROM ansokningar 
WHERE Beslut = 'Beviljad' AND lan != 'Flera kommuner'
GROUP BY lan
ORDER BY antal_ansokningar DESC	
FETCH FIRST 5 ROWS ONLY;

--Fråga h: Andel distans och andel bundna utbildningar inom respektive utbildningsomtåde
SELECT utbildningsomrade,
ROUND(100 * SUM( CASE WHEN studieform = 'Distans' THEN 1 ELSE 0 END)/COUNT(*),1) AS andel_distans_procent,
ROUND(100 * sum( CASE WHEN studieform = 'Bunden' THEN 1 ELSE 0 END)/COUNT (*), 1) AS andel_bunden_procent
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY andel_distans_procent DESC;

--Fråga i: Antal utbildningar som innehåller ordet AI
SELECT COUNT (*) AS antal_ai_utbildningar
FROM ansokningar
WHERE utbildningsnamn LIKE '%AI%';
