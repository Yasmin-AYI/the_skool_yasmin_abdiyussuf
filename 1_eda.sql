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
