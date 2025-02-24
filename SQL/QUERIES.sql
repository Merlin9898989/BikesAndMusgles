/* 1. Alle Motorräder auflisten */
SELECT * FROM Motorcycle;

/* 2. Alle Hersteller auflisten */
SELECT * FROM Make;

/* 3. Modelle und Baujahre aller Motorräder anzeigen */
SELECT model, year FROM Motorcycle;

/* 4. Alle Motorräder mit einer bestimmten Motorisierung (z. B. 1000 ccm) */
SELECT m.model, e.displacement 
FROM Motorcycle m
JOIN Engine e ON m.engineId = e.id
WHERE e.displacement = 1000;

/* 5. Motorräder mit mehr als 150 PS auflisten */
SELECT m.model, p.power 
FROM Motorcycle m
JOIN Performance p ON m.performanceId = p.id
WHERE p.power > 150;

/* 6. Motorräder mit einem bestimmten Hersteller anzeigen (z. B. Yamaha) */
SELECT m.model
FROM Motorcycle m
JOIN MotorcycleMake mm ON m.id = mm.motorcycleId
JOIN Make ma ON mm.makeId = ma.id
WHERE ma.name = 'Yamaha';

/* 7. Durchschnittliche Leistung aller Motorräder berechnen */
SELECT AVG(p.power) AS avg_power 
FROM Performance p;

/* 8. Motorräder mit der höchsten Endgeschwindigkeit anzeigen */
SELECT m.model, p.topSpeed
FROM Motorcycle m
JOIN Performance p ON m.performanceId = p.id
WHERE p.topSpeed = (SELECT MAX(topSpeed) FROM Performance);

/* 9. Motorräder nach Leistung sortieren (absteigend) */
SELECT m.model, p.power
FROM Motorcycle m
JOIN Performance p ON m.performanceId = p.id
ORDER BY p.power DESC;

/* 10. Motorräder mit einem bestimmten Fahrwerkstyp suchen und deren Hersteller anzeigen */
SELECT m.model, s.frontSuspension, ma.name
FROM Motorcycle m
JOIN Suspension s ON m.suspensionId = s.id
JOIN MotorcycleMake mm ON m.id = mm.motorcycleId
JOIN Make ma ON mm.makeId = ma.id
WHERE s.frontSuspension LIKE '%Upside-Down%';