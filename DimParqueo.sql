IF OBJECT_ID ('DimParqueo', 'U') is not null
	DROP TABLE DimParqueo;

CREATE TABLE DimParqueo (
    IdParqueo int not null primary key,
    Provincia varchar(50),
    Canton varchar(50),
    Distrito varchar(50)
);

insert into DimParqueo
select p.IDParqueo, pc.Descripcion, c.Descripcion, d.Descripcion
from (((Parqueo p
INNER JOIN
Distrito d on p.ConsecutivoDistrito = d.ConsecutivoDistrito)
INNER JOIN
Canton c on d.IDCanton = c.IDCanton and d.IDProvincia = c.IDProvincia)
INNER JOIN
Provincia pc on d.IDProvincia = pc.IDProvincia
);

select * from DimParqueo