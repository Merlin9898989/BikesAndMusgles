CREATE TABLE Motorcycle (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    model TEXT NOT NULL,
    year INTEGER NOT NULL,
    type TEXT,
    engineId INTEGER NOT NULL,
    performanceId INTEGER NOT NULL,
    dimensionsId INTEGER NOT NULL,
    suspensionId INTEGER NOT NULL,
    brakesId INTEGER NOT NULL,
    FOREIGN KEY (engineId) REFERENCES Engine(id),
    FOREIGN KEY (performanceId) REFERENCES Performance(id),
    FOREIGN KEY (dimensionsId) REFERENCES Dimensions(id),
    FOREIGN KEY (suspensionId) REFERENCES Suspension(id),
    FOREIGN KEY (brakesId) REFERENCES Brakes(id)
);

CREATE TABLE Make (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE MotorcycleMake (
    motorcycleId INTEGER,
    makeId INTEGER,
    PRIMARY KEY (motorcycleId, makeId),
    FOREIGN KEY (motorcycleId) REFERENCES Motorcycle(id),
    FOREIGN KEY (makeId) REFERENCES Make(id)
);

CREATE TABLE Engine (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    displacement REAL NOT NULL,
    engineType TEXT NOT NULL,
    compression TEXT,
    boreStroke TEXT,
    valvesPerCylinder INTEGER NOT NULL,
    fuelSystem TEXT,
    fuelControl TEXT,
    lubrication TEXT,
    cooling TEXT,
    gearbox TEXT,
    transmission TEXT,
    clutch TEXT,
    frame TEXT
);

CREATE TABLE Performance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    power REAL,
    torque REAL,
    topSpeed REAL,
    fuelConsumption REAL,
    emission TEXT
);

CREATE TABLE Dimensions (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    seatHeight TEXT,
    groundClearance TEXT,
    wheelbase TEXT,
    fuelCapacity REAL,
    totalWeight REAL,
    totalHeight TEXT,
    totalLength TEXT,
    totalWidth TEXT,
    dryWeight REAL
);

CREATE TABLE Suspension (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    frontSuspension TEXT,
    frontWheelTravel TEXT,
    rearSuspension TEXT,
    rearWheelTravel TEXT,
    frontTire TEXT,
    rearTire TEXT
);

CREATE TABLE Brakes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    frontBrakes TEXT,
    rearBrakes TEXT
);
