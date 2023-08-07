--PARTE 2: FUNCION QUE SUMA EL AREA SEGUN PARAMETROS--

CREATE FUNCTION Proyecto2.fnc_get_area (@NomPais varchar(100), @NomProvincia varchar(100), @NomCanton varchar(100), @NomDistrito varchar(100))
returns decimal(18,2)
begin

	declare @area decimal(18,2)
	declare @idPais int
	declare @idProvincia int
	declare @idCanton int
	declare @idDistrito int
	
	set @idPais =  (Select x.COD_PAIS
					from Proyecto2.GEO_PAIS x
					where x.NOMBRE_PAIS=@NomPais);

	set @idProvincia =  (Select p.COD_PROVINCIA
					from Proyecto2.GEO_PROVINCIA p
					where p.NOMBRE_PRO=@NomProvincia);

	set @idCanton =  (Select c.COD_CANTON
					from Proyecto2.GEO_CANTON c
					where c.NOMBRE_CAN=@NomCanton);

	set @idDistrito =  (Select d.COD_DISTRITO
					from Proyecto2.GEO_DISTRITO d
					where d.NOMBRE_DIST=@NomDistrito);

	if (@NomProvincia is null and @NomCanton is null and @NomDistrito is null)
	set @area = (Select SUM (d.AREA)
				from Proyecto2.GEO_DISTRITO d
				where d.COD_PAIS = @idPais)

	if (@NomProvincia is not null and @NomCanton is null and @NomDistrito is null)
	set @area = (Select SUM (d.AREA)
				from Proyecto2.GEO_DISTRITO d
				where d.COD_PAIS = @idPais
				and d.COD_PROVINCIA = @idProvincia)

	if (@NomProvincia is not null and @NomCanton is not null and @NomDistrito is null)
	set @area = (Select SUM (d.AREA)
				from Proyecto2.GEO_DISTRITO d
				where d.COD_PAIS = @idPais
				and d.COD_PROVINCIA = @idProvincia
				and d.COD_CANTON = @idCanton)

	if (@NomProvincia is not null and @NomCanton is not null and @NomDistrito is not null)
	set @area = (Select SUM (d.AREA)
				from Proyecto2.GEO_DISTRITO d
				where d.COD_PAIS = @idPais
				and d.COD_PROVINCIA = @idProvincia
				and d.COD_CANTON = @idCanton
				and d.COD_DISTRITO = @idDistrito)

return @area
end


--CONSULTA PARA PRUEBA--
SELECT ProyectoII.Proyecto2.fnc_get_area ('COSTA RICA' ,  null, null, null) as FUNCION_AREA
SELECT ProyectoII.Proyecto2.fnc_get_area ('COSTA RICA' , 'San Jose', null, null) as FUNCION_AREA
SELECT ProyectoII.Proyecto2.fnc_get_area ('COSTA RICA' , 'San Jose', 'Pérez Zeledón', null) as FUNCION_AREA
SELECT ProyectoII.Proyecto2.fnc_get_area ('COSTA RICA' , 'San Jose', 'Pérez Zeledón', 'El General') as FUNCION_AREA