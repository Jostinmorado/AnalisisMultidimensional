IF OBJECT_ID ('DimVehiculo', 'U') is not null
	DROP TABLE DimVehiculo;

CREATE TABLE DimVehiculo (
    Id int not null primary key,
    Tipo varchar(255),
    Fabricante varchar(255),
    PaisFabricante varchar(255),
    AbrevPaisFabricante varchar(255),
	Region varchar(255),
    Continente varchar(255),
	Indicador varchar(20)
);

insert into DimVehiculo
select v.IDVehiculo, tv.Descripcion, f.NombreFabricante, p.NombrePais, p.AbreviaturaPais, rc.Descripcion, c.Descripcion, e.Descripcion
from ((((((Vehiculo v
INNER JOIN
TipoVehiculo tv on v.IDTipoVehiculo = tv.IDTipoVehiculo)
INNER JOIN
Fabricante f on v.IDFabricante = f.IDFabricante)
INNER JOIN
Pais p on f.IDPais = p.IDPais)
INNER JOIN
RegionContinente rc on p.IDRegionContinente = rc.IDRegionContinente)
INNER JOIN
Continente c on rc.IDContinente = c.IDContinente)
INNER JOIN
Estratificacion e on e.Codigo = 'vehiculo' and v.Ano between e.ValorMinimo and e.ValorMaximo
);

select * from DimVehiculo