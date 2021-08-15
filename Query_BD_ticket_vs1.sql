USE [BD_ticket_vs1]
GO

CREATE TABLE [dbo].[tb_tipo_usuario](
	[idTipo_usuario] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_tipo_usuario] [varchar](50) NOT NULL,
	[nombre_tipo_usuario] [varchar](50) NOT NULL
)
GO
----------------------------TABLA------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tb_usuario](
	[idUsuario] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_usuario] [varchar](50) NULL,
	[user_acceso] [varchar](50) NULL,
	[user_pass] [varbinary](max) NULL,
	[idTipo_usuario] [int] NOT NULL,
	[estado_usuario] [bit] NULL,
	CONSTRAINT fk_usuario_tipo FOREIGN KEY (idTipo_usuario) REFERENCES tb_tipo_usuario (idTipo_usuario)
)
GO

----------------------------TABLA------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tb_cliente](
	[idCliente] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_cliente] [varchar](50) NULL,
	[nombre_cliente] [varchar](50) NULL,
	[apellido_paterno_cliente] [varchar](50) NULL,
	[apellido_materno_cliente] [varchar](50) NULL,
	[correo_cliente] [varchar](50) NULL,
	[cargo_cliente] [varchar](50) NULL,
	[idUsuario] [int] NOT NULL,
	[estado_cliente] [bit] NOT NULL,
	CONSTRAINT fk_cliente_usuario FOREIGN KEY (IdUsuario) REFERENCES tb_usuario (idUsuario)
)
GO

----------------------------TABLAS utilizada para tb_ticket----------------------------------------------------------
CREATE TABLE [dbo].[tb_estado_ticket](
	[idEstado_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_estado_ticket] [varchar](50) NULL,
	[estado_ticket] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[tb_modo_ticket](
	[idModo_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_modo_ticket] [varchar](50) NULL,
	[modo_ticket] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[tb_nivel_ticket](
	[idNivel_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_nivel_ticket] [varchar](50) NULL,
	[nivel_ticket] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[tb_prioridad_ticket](
	[idPrioridad_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_prioridad_ticket] [varchar](50) NULL,
	[prioridad_ticket] [varchar](100) NULL
)
GO

CREATE TABLE [dbo].[tb_categoria_ticket](
	[idCategoria_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[codigo_categoria_ticket] [varchar](50) NULL,
	[nombre_categoria_ticket] [varchar](50) NULL,
	[nombre_subcategoria_ticket] [varchar](50) NULL,
	[nombre_elemento_ticket] [varchar](50) NULL
)
GO

CREATE TABLE [dbo].[tb_asunto_ticket](
	[idAsunto_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[codigo_asunto] [varchar](50) NULL,
	[asunto_descripcion_ticket] [varchar](50) NULL
)
GO
---------------------------------------------------------------------------------------------------------------------

----------------------------TABLA------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tb_ticket](
	[idTicket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[codticket] [varchar](50) NOT NULL,
	[detalle_ticket] [varchar](1000) NULL,
	[idCliente] [int] NOT NULL,
	[idEstado_ticket] [int] NOT NULL,
	[idModo_ticket] [int] NOT NULL,
	[idNivel_ticket] [int] NOT NULL,
	[idPrioridad_ticket] [int] NOT NULL,
	[idCategoria_ticket] [int] NOT NULL,
	[idAsunto_ticket] [int] NOT NULL,
	CONSTRAINT fk_ticket_cliente FOREIGN KEY (idCliente) REFERENCES tb_cliente (idCliente),
	CONSTRAINT fk_ticket_estado_ticket FOREIGN KEY (idEstado_ticket) REFERENCES tb_estado_ticket (idEstado_ticket),
	CONSTRAINT fk_ticket_modo_ticket FOREIGN KEY (idModo_ticket) REFERENCES tb_modo_ticket (idModo_ticket),
	CONSTRAINT fk_ticket_nivel_ticket FOREIGN KEY (idNivel_ticket) REFERENCES tb_nivel_ticket (idNivel_ticket),
	CONSTRAINT fk_ticket_prioridad_ticket FOREIGN KEY (idPrioridad_ticket) REFERENCES tb_prioridad_ticket (idPrioridad_ticket),
	CONSTRAINT fk_ticket_categoria_ticket FOREIGN KEY (idCategoria_ticket) REFERENCES tb_categoria_ticket (idCategoria_ticket),
	CONSTRAINT fk_ticket_detalle_ticket FOREIGN KEY (idAsunto_ticket) REFERENCES tb_asunto_ticket (idAsunto_ticket)
)
GO

CREATE TABLE [dbo].[tb_ubicacion_area](
	[idUbicacion_area] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_ubicacion_area] [varchar](50) NULL,
	[nombre_edificio] [varchar](50) NULL,
	[numero_piso] [varchar](50) NULL

)

CREATE TABLE [dbo].[tb_area_atencion](
	[idArea_atencion] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_area_atencion] [varchar](50) NULL,
	[nombre_area_atencion] [varchar](50) NULL,
	[idUbicacion_area] [int] NOT NULL,
	CONSTRAINT fk_area_atencion_ubicacion_area FOREIGN KEY (idUbicacion_area) REFERENCES tb_ubicacion_area (idUbicacion_area)
)

CREATE TABLE [dbo].[tb_puesto](
	[idPuesto] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[cod_puesto] [varchar](50) NULL,
	[nombre_puesto] [varchar](50) NULL,
	[idArea_atencion] [int] NOT NULL,
	CONSTRAINT fk_puesto_area_atencion FOREIGN KEY (idArea_atencion) REFERENCES tb_area_atencion (idArea_atencion)
)


----------------------------TABLA------------------------------------------------------------------------------------
CREATE TABLE [dbo].[tb_responsable](
	[idResponsable] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[codresponsable] [varchar](50) NULL,
	[nombre_responsable] [varchar](50) NULL,
	[apellido_paterno_responsable] [varchar](50) NULL,
	[apellido_materno_responsable] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[idUsuario] [int] NOT NULL,
	[idArea_atencion] [int] NOT NULL,
	[idPuesto] [int] NOT NULL,
	[estado_responsable] [bit] NOT NULL,
	CONSTRAINT fk_responsable_usuario FOREIGN KEY (IdUsuario) REFERENCES tb_usuario (idUsuario),
	CONSTRAINT fk_responsable_area_atencion FOREIGN KEY (idArea_atencion) REFERENCES tb_area_atencion (idArea_atencion),
	CONSTRAINT fk_responsable_puesto FOREIGN KEY (idPuesto) REFERENCES tb_puesto (idPuesto)
)
GO

CREATE TABLE [dbo].[tb_responsable_ticket](
	[idResponsable_ticket] [int] IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[idTicket] [int] NOT NULL,
	[idResponsable] [int] NOT NULL,
	CONSTRAINT fk_responsable_ticket FOREIGN KEY (idTicket) REFERENCES tb_ticket (idTicket),
	CONSTRAINT fk_ticket_responsable FOREIGN KEY (idResponsable) REFERENCES tb_responsable (idResponsable)
)
GO

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------INSERTAR DATA------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
USE [BD_ticket_vs1]
GO
INSERT [dbo].[tb_tipo_usuario] ([cod_tipo_usuario], [nombre_tipo_usuario]) VALUES ('T1','Administrador')
GO
INSERT [dbo].[tb_tipo_usuario] ([cod_tipo_usuario], [nombre_tipo_usuario]) VALUES ('T2','Tecnico')
GO
INSERT [dbo].[tb_tipo_usuario] ([cod_tipo_usuario], [nombre_tipo_usuario]) VALUES ('T3','Cliente')
GO
/*
select * from tb_tipo_usuario;
*/

INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U01','amorales',PWDENCRYPT('12345678'),3,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U02','mmorales',PWDENCRYPT('12345678'),3,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U03','ppalma',PWDENCRYPT('12345678'),1,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U04','palbino',PWDENCRYPT('12345678'),2,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U05','orodriguez',PWDENCRYPT('12345678'),2,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U06','mcalixto',PWDENCRYPT('12345678'),3,1)
GO
INSERT [dbo].[tb_usuario] ([cod_usuario], [user_acceso], [user_pass], [idTipo_usuario], [estado_usuario]) VALUES ('U07','cperez',PWDENCRYPT('12345678'),3,1)
GO
/*
select * from tb_usuario;
select u.user_acceso, tu.cod_tipo_usuario, tu.nombre_tipo_usuario
from tb_usuario u, tb_tipo_usuario tu
where u.idTipo_usuario = tu.idTipo_usuario;
*/

INSERT [dbo].[tb_cliente] ([cod_cliente], [nombre_cliente], [apellido_paterno_cliente], [apellido_materno_cliente], [correo_cliente], [cargo_cliente], [idUsuario], [estado_cliente]) VALUES ('C01','Antony','Morales','Albino','amorales@gmail.com','Analista',1,1)
GO
INSERT [dbo].[tb_cliente] ([cod_cliente], [nombre_cliente], [apellido_paterno_cliente], [apellido_materno_cliente], [correo_cliente], [cargo_cliente], [idUsuario], [estado_cliente]) VALUES ('C02','Marino','Morales','Ollero','mmorales@gmail.com','Contador',2,1)
GO
INSERT [dbo].[tb_cliente] ([cod_cliente], [nombre_cliente], [apellido_paterno_cliente], [apellido_materno_cliente], [correo_cliente], [cargo_cliente], [idUsuario], [estado_cliente]) VALUES ('C03','Marco','Calixto','Calixto','mcalixto@gmail.com','Operador',6,1)
GO
INSERT [dbo].[tb_cliente] ([cod_cliente], [nombre_cliente], [apellido_paterno_cliente], [apellido_materno_cliente], [correo_cliente], [cargo_cliente], [idUsuario], [estado_cliente]) VALUES ('C04','Carlos','Perez','Perez','cperez@gmail.com','Secretaria',7,1)
GO
/*
UPDATE tb_cliente SET nombre_cliente = 'Marco'
WHERE cod_cliente = 'C03';
UPDATE tb_cliente SET nombre_cliente = 'Carlos'
WHERE cod_cliente = 'C04';
*/
/*
select * from tb_cliente;
select c.cod_cliente, c.nombre_cliente, c.apellido_paterno_cliente, c.apellido_materno_cliente, u.user_acceso, tu.nombre_tipo_usuario
from tb_cliente c, tb_usuario u, tb_tipo_usuario tu
where c.idUsuario = u.idUsuario
and u.idTipo_usuario = tu.idTipo_usuario;
*/

INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU01','Edificio Principal','Piso 1')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU02','Edificio Principal','Piso 2')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU03','Edificio Principal','Piso 3')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU04','Edificio Principal','Piso 4')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU05','Edificio Universal','Piso 1')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU06','Edificio Universal','Piso 2')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU07','Edificio Universal','Piso 3')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU08','Edificio Universal','Piso 4')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU09','Edificio Grace','Piso 1')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU10','Edificio Grace','Piso 2')
GO
INSERT [dbo].[tb_ubicacion_area] ([cod_ubicacion_area], [nombre_edificio], [numero_piso]) VALUES ('CU11','Edificio Santa Anita','Piso 1')
GO
/*
select * from tb_ubicacion_area;
*/

INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA01','N1 Mesa de Ayuda',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA02','N2 Soporte en Sitio',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA03','N3 Computo',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA04','N3 Redes',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA05','N3 Seguridad Informática',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA06','N3 Telefonia',8)
GO
INSERT [dbo].[tb_area_atencion] ([cod_area_atencion], [nombre_area_atencion], [idUbicacion_area]) VALUES ('CA07','TF',11)
GO
/*
select * from tb_area_atencion;
select taa.nombre_area_atencion, tua.nombre_edificio, tua.numero_piso
from tb_area_atencion taa, tb_ubicacion_area tua
where taa.idUbicacion_area = tua.idUbicacion_area;
*/

INSERT [dbo].[tb_puesto] ([cod_puesto], [nombre_puesto], [idArea_atencion]) VALUES ('P01','Analista de Sistemas',1)
GO
INSERT [dbo].[tb_puesto] ([cod_puesto], [nombre_puesto], [idArea_atencion]) VALUES ('P02','Analista de BD',2)
GO
INSERT [dbo].[tb_puesto] ([cod_puesto], [nombre_puesto], [idArea_atencion]) VALUES ('P03','Analista de Ciberseguridad',3)
GO
/*
select * from tb_puesto;
select p.nombre_puesto, taa.nombre_area_atencion, tua.idUbicacion_area
from tb_puesto p, tb_area_atencion taa, tb_ubicacion_area tua
where p.idArea_atencion = taa.idArea_atencion
and taa.idUbicacion_area = tua.idUbicacion_area;
*/

INSERT [dbo].[tb_responsable] ([codresponsable], [nombre_responsable], [apellido_paterno_responsable], [apellido_materno_responsable], [telefono], [correo], [idUsuario], [idArea_atencion], [idPuesto], [estado_responsable])
VALUES ('R001','Pedro','Palma','Rodriguez','971614162', 'ppalma@gmail.com',3,1,1,1)
GO
INSERT [dbo].[tb_responsable] ([codresponsable], [nombre_responsable], [apellido_paterno_responsable], [apellido_materno_responsable], [telefono], [correo], [idUsuario], [idArea_atencion], [idPuesto], [estado_responsable])
VALUES ('R002','Paco','Albino','Principe','971666562', 'palbino@gmail.com',4,2,1,1)
GO
INSERT [dbo].[tb_responsable] ([codresponsable], [nombre_responsable], [apellido_paterno_responsable], [apellido_materno_responsable], [telefono], [correo], [idUsuario], [idArea_atencion], [idPuesto], [estado_responsable])
VALUES ('R003','Oscar','Rodriguez','Rodriguez','945680062', 'orodriguez@gmail.com',5,3,2,1)
GO
/*
select * from tb_responsable;
select r.codresponsable,r.nombre_responsable,r.apellido_paterno_responsable,r.apellido_materno_responsable,r.telefono,r.correo,u.user_acceso,taa.nombre_area_atencion,p.nombre_puesto
from tb_responsable r, tb_usuario u, tb_area_atencion taa, tb_puesto p
where r.IdUsuario = u.IdUsuario
and r.idArea_atencion = taa.idArea_atencion
and r.idPuesto = p.idPuesto;
*/

INSERT [dbo].[tb_estado_ticket] ([cod_estado_ticket], [estado_ticket]) VALUES ('E01','PENDIENTE')
GO
INSERT [dbo].[tb_estado_ticket] ([cod_estado_ticket], [estado_ticket]) VALUES ('E02','EN ESPERA')
GO
INSERT [dbo].[tb_estado_ticket] ([cod_estado_ticket], [estado_ticket]) VALUES ('E03','SOLUCIONADO')
GO
/*
select * from tb_estado_ticket;
*/

INSERT [dbo].[tb_modo_ticket] ([cod_modo_ticket], [modo_ticket]) VALUES ('M01','correo electronico')
GO
INSERT [dbo].[tb_modo_ticket] ([cod_modo_ticket], [modo_ticket]) VALUES ('M02','directo')
GO
INSERT [dbo].[tb_modo_ticket] ([cod_modo_ticket], [modo_ticket]) VALUES ('M03','llamada telefonica')
GO
INSERT [dbo].[tb_modo_ticket] ([cod_modo_ticket], [modo_ticket]) VALUES ('M04','documento')
GO
/*
select * from tb_modo_ticket;
*/

INSERT [dbo].[tb_nivel_ticket] ([cod_nivel_ticket], [nivel_ticket]) VALUES ('N01','incidente')
GO
INSERT [dbo].[tb_nivel_ticket] ([cod_nivel_ticket], [nivel_ticket]) VALUES ('N02','problema')
GO
INSERT [dbo].[tb_nivel_ticket] ([cod_nivel_ticket], [nivel_ticket]) VALUES ('N03','requerimiento')
GO
/*
select * from tb_nivel_ticket;
*/

INSERT [dbo].[tb_prioridad_ticket] ([cod_prioridad_ticket], [prioridad_ticket]) VALUES ('PT01','alta (alta dificultad, demanda tiempo, alta direccion)')
GO
INSERT [dbo].[tb_prioridad_ticket] ([cod_prioridad_ticket], [prioridad_ticket]) VALUES ('PT02','baja (acciones repetitivas o rápidas)')
GO
INSERT [dbo].[tb_prioridad_ticket] ([cod_prioridad_ticket], [prioridad_ticket]) VALUES ('PT03','media (frecuentes)')
GO
/*
select * from tb_prioridad_ticket;
*/

INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG01','Ciberseguridad','Antispam','Bloqueo')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG02','Computo - Active Directory','Correo','Ampliación de Buzon')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG03','Computo - Aplicaciones','Cuentas','Bajas')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG04','Computo - Base de datos','Mantenimiento','Migración')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG05','Redes','Red LAN','Instalación y/o reparación de cable coaxial')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG06','Soporte Tecnológico','Aplicaciones Institucionales','Instalación y/o configuración SIAF')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG07','Telefonia','telefono analogico','Instalación de anexo')
GO
INSERT [dbo].[tb_categoria_ticket] ([codigo_categoria_ticket], [nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket]) VALUES ('CG08','Soporte Tecnológico','Gestión de Hardware','Instalación/Configuración de Impresora')
GO
/*
select * from tb_categoria_ticket;
*/


INSERT [dbo].[tb_asunto_ticket] ([codigo_asunto], [asunto_descripcion_ticket]) VALUES ('CA01','Instalacion y Configuracion de Impresora')
GO
INSERT [dbo].[tb_asunto_ticket] ([codigo_asunto], [asunto_descripcion_ticket]) VALUES ('CA02','Instalacion y Configuracion de PC')
GO
INSERT [dbo].[tb_asunto_ticket] ([codigo_asunto], [asunto_descripcion_ticket]) VALUES ('CA03','Instalacion y Configuracion de Laptop')
GO
INSERT [dbo].[tb_asunto_ticket] ([codigo_asunto], [asunto_descripcion_ticket]) VALUES ('CA04','No tengo acceso a internet')
GO
INSERT [dbo].[tb_asunto_ticket] ([codigo_asunto], [asunto_descripcion_ticket]) VALUES ('CA05','Mi cuenta de dominio del MEF esta bloqueada')
GO
/*
select * from tb_asunto_ticket;
*/


INSERT [dbo].[tb_ticket] ([codticket], [detalle_ticket],[idCliente],[idEstado_ticket],[idModo_ticket],[idNivel_ticket],[idPrioridad_ticket],[idCategoria_ticket],[idAsunto_ticket])
VALUES ('TK01','Necesito que configuren mi impresora porfavor ayuda.',1,1,1,3,3,8,1)
GO

INSERT [dbo].[tb_responsable_ticket] ([idTicket], [idResponsable])
VALUES (1,1)
GO

select * from tb_ticket;
select * from tb_responsable_ticket;
select * from tb_responsable;
select tk.codticket, tk.detalle_ticket, cl.nombre_cliente, est.estado_ticket, mt.modo_ticket, nt.nivel_ticket, pt.prioridad_ticket,tr.nombre_responsable, taa.nombre_area_atencion, ct.nombre_categoria_ticket, ct.nombre_subcategoria_ticket,ct.nombre_elemento_ticket, ast.asunto_descripcion_ticket
from tb_ticket tk, tb_asunto_ticket ast, tb_categoria_ticket ct, tb_cliente cl, tb_estado_ticket est, tb_modo_ticket mt, tb_nivel_ticket nt, tb_prioridad_ticket pt, tb_responsable_ticket trt, tb_responsable tr, tb_area_atencion taa
where tk.idAsunto_ticket = ast.idAsunto_ticket
and tk.idCategoria_ticket = ct.idCategoria_ticket
and tk.idCliente = cl.idCliente
and tk.idEstado_ticket = est.idEstado_ticket
and tk.idModo_ticket = mt.idModo_ticket
and tk.idNivel_ticket = nt.idNivel_ticket
and tk.idPrioridad_ticket = pt.idPrioridad_ticket
and trt.idResponsable_ticket = tk.idTicket
and trt.idResponsable = tr.idResponsable
and tr.idArea_atencion = taa.idArea_atencion;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------PROCEDIMIENTOS-----------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
-----REGISTRAR USUARIO--------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE FUNCTION SF_BUSCAR_TIPO_USUARIO
(@nombre_tipo_usuario varchar(50))
returns int
 as
 begin 
   declare @idTipousuario int;
   SET @idTipousuario = (
    select tu.idTipo_usuario
	from tb_tipo_usuario tu
	where tu.nombre_tipo_usuario = @nombre_tipo_usuario
   )
   return @idTipousuario
 end;
--select dbo.SF_BUSCAR_TIPO_USUARIO('Cliente');

CREATE PROCEDURE SP_REGISTRAR_USUARIO
(@user_acceso varchar(50), @pass varchar(50), @nombre_tipo_usuario varchar(50))
AS
DECLARE @idTipousuario int;
SET @idTipousuario = (select dbo.SF_BUSCAR_TIPO_USUARIO(@nombre_tipo_usuario));
INSERT INTO [dbo].[tb_usuario]([user_acceso], [user_pass], [idTipo_usuario], [estado_usuario])
values (@user_acceso,PWDENCRYPT(@pass),@idTipousuario,1);
--exec DBO.SP_REGISTRAR_USUARIO 'jmoreno','123456','Cliente';

/*
select * from tb_usuario;
select * from tb_tipo_usuario;
select u.user_acceso, tu.cod_tipo_usuario, tu.nombre_tipo_usuario
from tb_usuario u, tb_tipo_usuario tu
where u.idTipo_usuario = tu.idTipo_usuario;
*/
--BUSCAR EL PASSWORD
/*
select u.user_acceso, tu.cod_tipo_usuario, tu.nombre_tipo_usuario
from tb_usuario u, tb_tipo_usuario tu
where PWDCOMPARE('12345678', user_pass)= 1
and u.idTipo_usuario = tu.idTipo_usuario;*/

CREATE PROCEDURE SP_REGISTRAR_LISTAR_USUARIO
(@user_acceso varchar(50), @pass varchar(50), @nombre_tipo_usuario varchar(50))
AS
DECLARE @idTipousuario int;
SET @idTipousuario = (select dbo.SF_BUSCAR_TIPO_USUARIO(@nombre_tipo_usuario));
INSERT INTO [dbo].[tb_usuario]([user_acceso], [user_pass], [idTipo_usuario], [estado_usuario])
values (@user_acceso,PWDENCRYPT(@pass),@idTipousuario,1);
exec SP_LISTAR_USUARIO;

--exec DBO.SP_REGISTRAR_LISTAR_USUARIO 'jhomero','123456','Cliente';


------------------------------------------------------------------------------------------------------
-----EDITAR USUARIO-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_EDITAR_USUARIO
(@user_acceso_old varchar(50), @user_acceso_new varchar(50), @pass varchar(50))
AS
declare @user_pass [varbinary](max);
set @user_pass=PWDENCRYPT(@pass);
update [dbo].[tb_usuario]
set user_acceso=@user_acceso_new, user_pass=@user_pass
where @user_acceso_old=user_acceso;
--exec SP_EDITAR_USUARIO 'jalvarez','jalvarez','12345678';
select * from tb_usuario;
--select * from tb_tipo_usuario;

CREATE PROCEDURE SP_EDITAR_LISTAR_USUARIO
(@user_acceso_old varchar(50), @user_acceso_new varchar(50), @pass varchar(50))
AS
declare @user_pass [varbinary](max);
set @user_pass=PWDENCRYPT(@pass);
update [dbo].[tb_usuario]
set user_acceso=@user_acceso_new, user_pass=@user_pass
where @user_acceso_old=user_acceso;
exec SP_LISTAR_USUARIO;

------------------------------------------------------------------------------------------------------
-----BUSCAR USUARIO-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_BUSCAR_USUARIO
(@user_acceso varchar(50))
AS
select u.user_acceso,tu.nombre_tipo_usuario
from tb_usuario u, tb_tipo_usuario tu
where @user_acceso = u.user_acceso
and u.idTipo_usuario = tu.idTipo_usuario;
--exec SP_BUSCAR_USUARIO 'amoral';

CREATE FUNCTION SF_BUSCAR_USUARIO
(@user_acceso varchar(50))
returns int
 as
 begin 
   declare @acceso varchar(50);
   declare @validacion int;
	if exists (	select u.user_acceso
				from tb_usuario u
				where @user_acceso = u.user_acceso )
		set @validacion = 1;
	else
		set @validacion = 0;
   return @validacion
 end;
--select DBO.SF_BUSCAR_USUARIO('amorales');
--select * from tb_usuario;
--select * from tb_tipo_usuario;

------------------------------------------------------------------------------------------------------
-----LISTAR USUARIO-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_LISTAR_USUARIO
as
select u.user_acceso,tu.nombre_tipo_usuario
from tb_usuario u, tb_tipo_usuario tu
where u.idTipo_usuario = tu.idTipo_usuario;
--exec SP_LISTAR_USUARIO;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

--[tb_categoria_ticket]
------------------------------------------------------------------------------------------------------
-----REGISTRAR CATEGORIA------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_REGISTRAR_CATEGORIA
(@nombre_categoria_ticket varchar(50), @nombre_subcategoria_ticket varchar(50), @nombre_elemento_ticket varchar(50))
AS
INSERT INTO [dbo].[tb_categoria_ticket]([nombre_categoria_ticket], [nombre_subcategoria_ticket], [nombre_elemento_ticket])
values (@nombre_categoria_ticket,@nombre_subcategoria_ticket,@nombre_elemento_ticket);

--exec SP_REGISTRAR_CATEGORIA 'Soporte Tecnológico','Aplicaciones Institucionales','Acceso denegado a Aplicación Institucional';
--exec SP_REGISTRAR_CATEGORIA 'Soporte Tecnológico','Aplicaciones Institucionales','Falla del Aplicativo COGNOS';
--exec SP_REGISTRAR_CATEGORIA 'Soporte Tecnológico','Aplicaciones Institucionales','Falla del Aplicativo EXTRA BN';
--exec SP_REGISTRAR_CATEGORIA 'Soporte Tecnológico','Aplicaciones Institucionales','Falla del Aplicativo IMAGING';
--exec SP_REGISTRAR_CATEGORIA 'Soporte Tecnológico','Aplicaciones Institucionales','Falla del Aplicativo LOTUS';
/*
select * from tb_categoria_ticket;
*/

------------------------------------------------------------------------------------------------------
-----EDITAR CATEGORIA---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_EDITAR_CATEGORIA_ELEMENTO
(@cod_categoria varchar(50),@nombre_categoria_ticket varchar(50), @nombre_subcategoria_ticket varchar(50), @nombre_elemento_ticket varchar(50))
AS
update [dbo].[tb_categoria_ticket]
set nombre_categoria_ticket = @nombre_categoria_ticket, nombre_subcategoria_ticket = @nombre_subcategoria_ticket, nombre_elemento_ticket = @nombre_elemento_ticket
where @cod_categoria = codigo_categoria_ticket;

--exec SP_EDITAR_CATEGORIA_ELEMENTO 'CG08','Soporte Tecnológico','Gestión de Hardware','Instalación/Configuración de Impresora';
--select * from tb_categoria_ticket;

------------------------------------------------------------------------------------------------------
-----BUSCAR CATEGORIA---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_BUSCAR_CATEGORIA
(@nombre_categoria_ticket varchar(50))
AS
select nombre_categoria_ticket, nombre_subcategoria_ticket, nombre_elemento_ticket
from tb_categoria_ticket
where nombre_categoria_ticket = @nombre_categoria_ticket;
--exec SP_BUSCAR_CATEGORIA 'Ciberseguridad';

CREATE PROCEDURE SP_BUSCAR_SUBCATEGORIA
(@nombre_subcategoria_ticket varchar(50))
AS
select nombre_categoria_ticket, nombre_subcategoria_ticket, nombre_elemento_ticket
from tb_categoria_ticket
where nombre_subcategoria_ticket = @nombre_subcategoria_ticket;
--exec SP_BUSCAR_SUBCATEGORIA 'Aplicaciones Institucionales';

CREATE PROCEDURE SP_BUSCAR_SUBCATEGORIA_ELEMENTO
(@nombre_elemento_ticket varchar(50))
AS
select nombre_categoria_ticket, nombre_subcategoria_ticket, nombre_elemento_ticket
from tb_categoria_ticket
where nombre_elemento_ticket = @nombre_elemento_ticket;
--exec SP_BUSCAR_SUBCATEGORIA_ELEMENTO 'Falla del Aplicativo LOTUS';


CREATE FUNCTION SF_BUSCAR_CATEGORIA_ELEMENTO_VALIDAR
(@nombre_categoria_ticket varchar(50), @nombre_subcategoria_ticket varchar(50), @nombre_elemento_ticket varchar(50))
returns int
 as
 begin 
   declare @validacion int;
	if exists (	select nombre_categoria_ticket, nombre_subcategoria_ticket, nombre_elemento_ticket
				from tb_categoria_ticket
				where nombre_elemento_ticket = @nombre_elemento_ticket
				and nombre_subcategoria_ticket = @nombre_subcategoria_ticket
				and nombre_categoria_ticket = @nombre_categoria_ticket )
		set @validacion = 1;
	else
		set @validacion = 0;
   return @validacion
 end;
--select DBO.SF_BUSCAR_CATEGORIA_ELEMENTO_VALIDAR('Soporte Tecnológico','Gestión de Hardware','Instalación/Configuración de Impresora');
--select * from tb_categoria_ticket;

------------------------------------------------------------------------------------------------------
-----LISTAR CATEGORIA---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_LISTAR_CATEGORIA
AS
select nombre_categoria_ticket, nombre_subcategoria_ticket, nombre_elemento_ticket
from tb_categoria_ticket;

--exec SP_LISTAR_CATEGORIA;


--[tb_asunto_ticket]
------------------------------------------------------------------------------------------------------
-----REGISTRAR ASUNTO TICKET--------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_REGISTRAR_ASUNTO_TICKET
(@asunto_descripcion_ticket varchar(50))
AS
INSERT INTO [dbo].[tb_asunto_ticket]([asunto_descripcion_ticket])
values (@asunto_descripcion_ticket);

--exec SP_REGISTRAR_ASUNTO_TICKET 'No me puedo conectar al acceso remoto';
--select * from tb_asunto_ticket;

------------------------------------------------------------------------------------------------------
-----EDITAR ASUNTO TICKET-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_EDITAR_ASUNTO_TICKET
(@codigo_asunto varchar(50), @asunto_descripcion_ticket varchar(50))
AS
update [dbo].[tb_asunto_ticket]
set asunto_descripcion_ticket = @asunto_descripcion_ticket
where @codigo_asunto = codigo_asunto;

--exec SP_EDITAR_ASUNTO_TICKET 'CA05','Instalación/Configuración de Impresora';
--select * from tb_asunto_ticket;

------------------------------------------------------------------------------------------------------
-----BUSCAR ASUNTO TICKET-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_BUSCAR_ASUNTO_TICKET
(@codigo_asunto varchar(50))
AS
select asunto_descripcion_ticket
from tb_asunto_ticket
where codigo_asunto = @codigo_asunto;

--exec SP_BUSCAR_ASUNTO_TICKET 'CA05';
--select * from tb_asunto_ticket;

------------------------------------------------------------------------------------------------------
-----LISTAR ASUNTO TICKET-----------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
CREATE PROCEDURE SP_LISTAR_ASUNTO_TICKET
AS
select codigo_asunto, asunto_descripcion_ticket
from tb_asunto_ticket;

--exec SP_LISTAR_ASUNTO_TICKET;

