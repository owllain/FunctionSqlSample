/*
1.-Crear Script Insert para los datos Cantón y distrito
2.-Crear comando que devuelva cod provincia y cod canton
	cuando se le de el nombre del cantón y el nombre de la provincia
3.-Crear comando que devuelva el tamaño del área de un cantón
	cuando se le de nombre de provincia y cantón
4.-Crear comando que elimite de la base de datos todos los cantones
	cantón indicado por el usuario mediante nombre_canton
5.-Crear comando que redondee a dos digitos el área de los distritos
	cuando se le indice provincia y cantón
*/


/*Consulta #1*/
Insert into [Proyecto2].[GEO_CANTON]
Values (1, 1, 118, 'Curridabat'),
(1, 1, 119, 'Pérez Zeledón'),
(1, 1, 120, 'León Cortés Castro'),
(1, 2, 201, 'Alajuela'),
(1, 2, 202, 'San Ramón')

Insert into [Proyecto2].[GEO_DISTRITO]
Values (1, 1, 118, 11802, 'Granadilla', 3.51),
(1, 1, 118, 11803, 'Sánchez', 4.51),
(1, 1, 118, 11804, 'Tirrases', 1.88),
(1, 1, 119, 11901, 'San Isidro de El General', 191.82),
(1, 1, 119, 11902, 'El General', 76.88),
(1, 1, 119, 11903, 'Daniel Flores', 64.06),
(1, 1, 119, 11904, 'Rivas', 310.0),
(1, 1, 119, 11905, 'San Pedro', 206.12),
(1, 1, 119, 11906, 'Platanares', 80.92),
(1, 1, 119, 11907, 'Pejibaye', 141.18),
(1, 1, 119, 11908, 'Cajón', 118.63),
(1, 1, 119, 11909, 'Barú', 189.66),
(1, 1, 119, 11910, 'Río Nuevo', 242.19),
(1, 1, 119, 11911, 'Paramo', 203.33),
(1, 1, 119, 11912, 'La Amistad', 76.29),
(1, 1, 120, 12001, 'San Pablo', 20.76),
(1, 1, 120, 12002, 'San Andrés', 16.1),
(1, 1, 120, 12003, 'Llano Bonito', 34.1),
(1, 1, 120, 12004, 'San Isidro', 19.02),
(1, 1, 120, 12005, 'Santa Cruz', 21.78),
(1, 1, 120, 12006, 'San Antonio', 10.14),
(1, 2, 201, 20101, 'Alajuela', 10.61),
(1, 2, 201, 20102, 'San José', 14.87),
(1, 2, 201, 20103, 'Carrizal', 16.22),
(1, 2, 201, 20104, 'San Antonio', 8.76),
(1, 2, 201, 20105, 'Guácima', 28.07),
(1, 2, 201, 20106, 'San Isidro', 34.69),
(1, 2, 201, 20107, 'Sabanilla', 43.18),
(1, 2, 201, 20108, 'San Rafael', 19.33),
(1, 2, 201, 20109, 'Río Segundo', 5.46),
(1, 2, 201, 20110, 'Desamparados', 12.95),
(1, 2, 201, 20111, 'Turrucares', 35.89),
(1, 2, 201, 20112, 'Tambor', 13.89),
(1, 2, 201, 20113, 'Garita', 33.9),
(1, 2, 201, 20114, 'Sarapiquí', 113.79),
(1, 2, 202, 20201, 'San Ramón', 1.28)


/*Consulta #2*/
Select p.COD_PROVINCIA, c.COD_CANTON
From [Proyecto2].[GEO_CANTON] c, [Proyecto2].[GEO_PROVINCIA] p
Where c.NOMBRE_CAN = 'Curridabat' 
and p.NOMBRE_PRO = 'San Jose'

/*Consulta #3*/
Select sum(d.AREA) as AREA_CANTON
From [Proyecto2].[GEO_DISTRITO] d, [Proyecto2].[GEO_CANTON] c,
[Proyecto2].[GEO_PROVINCIA] p
Where d.COD_PROVINCIA = p.COD_PROVINCIA 
and d.COD_CANTON = c.COD_CANTON 
and p.NOMBRE_PRO = 'San Jose'
and c.NOMBRE_CAN = 'Curridabat'

/*Consulta #4*/
DELETE [Proyecto2].[GEO_DISTRITO] 
FROM [Proyecto2].[GEO_CANTON] c Inner Join [Proyecto2].[GEO_DISTRITO] d
ON c.NOMBRE_CAN = 'Curridabat' and c.COD_CANTON = d.COD_CANTON

/*Consulta #5*/
SELECT d.NOMBRE_DIST, d.AREA as AREA_ORIGINAL,  round(d.AREA, 2) as AREA_REDONDEADO
FROM  ProyectoII.Proyecto2.GEO_DISTRITO d
 
SELECT d.NOMBRE_DIST, d.AREA as AREA_ORIGINAL,  cast(d.AREA AS DECIMAL(18,2)) as AREA_REDONDEADO
FROM  ProyectoII.Proyecto2.GEO_DISTRITO d

SELECT d.NOMBRE_DIST, CONVERT(DECIMAL (18,2), d.AREA) as AREA_ORIGINAL,  FORMAT(d.AREA, '00.00' ) as AREA_REDONDEADO
FROM  ProyectoII.Proyecto2.GEO_DISTRITO d

SELECT d.NOMBRE_DIST, FORMAT(d.AREA, '000.00' ) as AREA_ORIGINAL,  FORMAT(d.AREA, '00.00' ) as AREA_REDONDEADO
FROM  ProyectoII.Proyecto2.GEO_DISTRITO d


Select *
From  [Proyecto2].[GEO_PROVINCIA]
Select *
From  [Proyecto2].[GEO_PAIS]
Select *
From   [Proyecto2].[GEO_CANTON]
Select *
From[Proyecto2].[GEO_DISTRITO]