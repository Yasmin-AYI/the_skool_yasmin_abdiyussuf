SET PAGESIZE 200
SET LINESIZE 200

--Fråga 1: Vilka utbildningsområden har högst beeviljande (Andel i procent)?
-- Motivering: The skool är det blir dyrt samt tidskrävande för dem att ansöka
-- På mötet sa våran stakeholder (KG) att de vill kunna identifiera vilka yrkesområden har högst konkurrens för att kuna pricka rätt på deras ansökningar

SELECT utbildningsomrade,
ROUND(100 * SUM( CASE WHEN beslut = 'Beviljad' THEN 1 ELSE 0 END)/COUNT(*),1) AS andel_beviljad_procent
FROM ansokningar
GROUP BY utbildningsomrade
ORDER BY andel_beviljad_procent DESC;


--Fråga 2: Vilka beviljas ofta, platsbundna eller distansutbildningar (Andel i procent)?
-- Motivering: Stakeholdern (KG) vill jämföra statistiken för bägge för att kunna välja utbildningsform 

SELECT studieform,
ROUND(100 * SUM( CASE WHEN Beslut  = 'Beviljad' THEN 1 ELSE 0 END)/COUNT(*),1) AS andel_beviljad_procent
FROM ansokningar
GROUP BY studieform
ORDER BY andel_beviljad_procent DESC;


--Fråga 3: Vilka har högst beviljningsgrad, privata eller kommunala anordnare (Andel i procent)?
-- The skool är en privat aktör. Stakeholdern (KG) nämde i mötet att han ville kunna anlauysera skillnader för att se vilka som lyckadess bäst


SELECT huvudmannatyp,
ROUND(100 * SUM( CASE WHEN Beslut = 'Beviljad' THEN 1 ELSE 0 END)/COUNT(*),1) AS andel_beviljad_procent
FROM ansokningar
GROUP BY huvudmannatyp
ORDER BY andel_beviljad_procent DESC;
