IF EXISTS (SELECT * FROM DimParqueo)
	TRUNCATE TABLE DimParqueo

insert into DimParqueo (IdParqueo, Provincia, Canton, Distrito)
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