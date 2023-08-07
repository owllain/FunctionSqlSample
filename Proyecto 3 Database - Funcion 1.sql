--PARTE 1: FUNCIÓN QUE CALCULA EL NÚMERO DE HIJOS DE CADA TABLA--

CREATE FUNCTION Proyecto2.fnc_get_hijos (@NomPais varchar(100), @NomProvincia varchar(100), @NomCanton varchar(100))
returns int
begin

	declare @cant int
	declare @idPais int
	declare @idProvincia int
	declare @idCanton int
	
	set @idPais =  (Select x.COD_PAIS
					from Proyecto2.GEO_PAIS x
					where x.NOMBRE_PAIS=@NomPais);

	set @idProvincia =  (Select p.COD_PROVINCIA
					from Proyecto2.GEO_PROVINCIA p
					where p.NOMBRE_PRO=@NomProvincia);

	set @idCanton =  (Select c.COD_CANTON
					from Proyecto2.GEO_CANTON c
					where c.NOMBRE_CAN=@NomCanton);

	if (@NomProvincia is NOT NULL and @NomCanton IS NOT NULL)
	set @cant = (Select count(*)
				from Proyecto2.GEO_DISTRITO d
				where d.COD_PAIS = @idPais
				and d.COD_PROVINCIA = @idProvincia
				and d.COD_CANTON = @idCanton)

	if (@NomProvincia is NOT NULL and @NomCanton is null)
	set @cant = (Select count(*)
				from Proyecto2.GEO_CANTON c
				where  c.COD_PROVINCIA = @idProvincia
				and c.COD_PAIS = @idPais)

	if (@NomProvincia is null and @NomCanton is null)
	set @cant = (Select count(*)
				from Proyecto2.GEO_PROVINCIA x
				where x.COD_PAIS=@idPais)	

	return @cant
end

--CONSULTA PARA PRUEBA--
SELECT ProyectoII.Proyecto2.fnc_get_hijos ('COSTA RICA' ,  null, null) as FUNCION_HIJOS
SELECT ProyectoII.Proyecto2.fnc_get_hijos ('COSTA RICA' , 'San Jose', null) as FUNCION_HIJOS
SELECT ProyectoII.Proyecto2.fnc_get_hijos ('COSTA RICA' , 'San Jose', 'Pérez Zeledón') as FUNCION_HIJOS











SELECT *
FROM [Proyecto2].[GEO_PAIS]
SELECT *
FROM [Proyecto2].[GEO_PROVINCIA]
SELECT *
FROM [Proyecto2].[GEO_CANTON]
SELECT *
FROM  [Proyecto2].[GEO_DISTRITO]