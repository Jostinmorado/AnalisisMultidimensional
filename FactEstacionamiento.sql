use ExamenAnalisis
set LANGUAGE Spanish
IF OBJECT_ID ('FactEstacionamiento', 'U') is not null
	DROP TABLE FactEstacionamiento;

CREATE TABLE FactEstacionamiento (
	Idparqueo int not null,
    Idvehiculo int not null,
	FechaIngreso datetime not null,
    TarifaBase float,
    Ganancia float,
	Mantenimiento float,
    Impuesto_Ventas float,
    TotalCobro float,
	IndicadorEntrada varchar(50),
	IndicadorSalida varchar(50),
	IndicadorIngFeriado varchar(50),
	IndicadorSalFeriado varchar(50),
	MinutosTotales float,
	IndIngrsoRestriccion varchar(50),
	IndSalidaRestriccion varchar(50),
	IndMinutos varchar(50),
	IndGanancia varchar(50),
	CONSTRAINT PK_FactEstac PRIMARY KEY (Idparqueo,Idvehiculo,FechaIngreso)
);

insert into FactEstacionamiento
select e.IDParqueo, e.IDVehiculo, e.FechaHoraIngreso ,e.TarifaBase, e.Ganancia, e.Mantenimiento, e.ImpVentas, e.TotalACobrar, et.Descripcion,
et2.Descripcion, ISNULL(df.NombreFeriado, 'Día no feriado'), ISNULL(dfS.NombreFeriado,'Día no feriado'), DATEDIFF(MINUTE, e.FechaHoraIngreso,
e.FechaHoraSalida), ISNULL(et3.Descripcion,''), ISNULL(et4.Descripcion,''),
et5.Descripcion, et6.Descripcion
from (((((((((Estacionamiento e
INNER JOIN
Estratificacion et on et.Codigo = 'estacionamiento' and DATEPART(HOUR, e.FechaHoraIngreso) between et.ValorMinimo and et.ValorMaximo)
INNER JOIN
Estratificacion et2 on et2.Codigo = 'estacionamiento' and DATEPART(HOUR, e.FechaHoraSalida) between et2.ValorMinimo and et2.ValorMaximo)
LEFT JOIN
DiasFeriadosAnuales df on DATEPART(DAY, e.FechaHoraIngreso) = df.DiaFeriado and DATEPART(MONTH, e.FechaHoraIngreso) = df.MesFeriado)
LEFT JOIN
DiasFeriadosAnuales dfS on DATEPART(DAY, e.FechaHoraSalida) = dfS.DiaFeriado and DATEPART(MONTH, e.FechaHoraSalida) = dfS.MesFeriado)
INNER JOIN
Vehiculo v on e.IDVehiculo = v.IDVehiculo)
LEFT JOIN
Estratificacion et3 on et3.Codigo = 'placas' and RIGHT(v.Placa,1) between et3.ValorMinimo and et3.ValorMaximo and 
et3.Descripcion like '%' + DATENAME(dw,e.FechaHoraIngreso) + '%')
LEFT JOIN
Estratificacion et4 on et4.Codigo = 'placas' and RIGHT(v.Placa,1) between et4.ValorMinimo and et4.ValorMaximo and 
et4.Descripcion like '%' + DATENAME(dw,e.FechaHoraSalida) + '%')
INNER JOIN
Estratificacion et5 on et5.Codigo = 'minutos' and DATEDIFF(MINUTE, e.FechaHoraIngreso, e.FechaHoraSalida) between et5.ValorMinimo and et5.ValorMaximo)
INNER JOIN
Estratificacion et6 on et6.Codigo = 'ganancia' and CEILING(e.Ganancia) between et6.ValorMinimo and et6.ValorMaximo
);

select * from FactEstacionamiento