/**/
/*MODIFICACIONES EN LA BD*/
/**/
------------------------------------------------------------------------------------------------------
-----LISTAR USUARIO-----------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
ALTER PROCEDURE SP_LISTAR_USUARIO
as
set @user_pass=PWDENCRYPT(@pass);
select u.idUsuario, u.user_acceso,tu.nombre_tipo_usuario, u.estado_usuario
from tb_usuario u, tb_tipo_usuario tu
where u.idTipo_usuario = tu.idTipo_usuario;
--exec SP_LISTAR_USUARIO;
