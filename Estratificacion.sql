use ExamenAnalisis
IF OBJECT_ID ('Estratificacion', 'U') is not null
	DROP TABLE Estratificacion;
CREATE TABLE Estratificacion (
    Id int not null primary key,
	Codigo varchar(20),
    ValorMinimo float,
    ValorMaximo float,
    Descripcion varchar(255)
);
INSERT INTO Estratificacion
VALUES (0, 'vehiculo', -99999999, 1985, 'Clasico'),
(50, 'vehiculo', 1986, 1994, 'Antiguo'),
(100, 'vehiculo', 1995, 2003, 'Reciente'),
(150, 'vehiculo', 2004, 2010, 'Nuevo'),
(200, 'vehiculo', 2011, 9999999, 'Moderno'),
(250, 'estacionamiento', 00, 5, 'Madrugada'),
(300, 'estacionamiento', 6, 12, 'Mañana'),
(350, 'estacionamiento', 13, 14, 'Mediodía '),
(400, 'estacionamiento', 15, 19, 'Tarde'),
(450, 'estacionamiento', 20, 24, 'Noche'),
(500, 'placas', 0, 3, 'Restricción Lunes'),
(550, 'placas', 4, 7, 'Restricción Martes'),
(600, 'placas', 8, 9, 'Restricción Miércoles'),
(650, 'placas', 2, 5, 'Restricción Jueves'),
(700, 'placas', 6, 9, 'Restricción Viernes'),
(750, 'minutos', -9999999, -1, 'Inválido'),
(800, 'minutos', 0, 30, 'Poco'),
(850, 'minutos', 31, 90, 'Tiempo corto'),
(900, 'minutos', 91, 245, 'Moderado'),
(950, 'minutos', 246, 600, 'Tiempo largo'),
(1000, 'minutos', 601, 9999999, 'Excelente tiempo'),
(1050, 'ganancia', -9999999, -1, 'Inválido'),
(1100, 'ganancia', 0, 1000, 'Poca'),
(1150, 'ganancia', 1001, 3000, 'Moderada'),
(1200, 'ganancia', 3001, 7500, 'Considerable'),
(1250, 'ganancia', 7501, 10000, 'Buena ganancia'),
(1300, 'ganancia', 10001, 9999999, 'Excelente ganancia')

select * from Estratificacion