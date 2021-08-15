using BEAN;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaWEB.Controllers
{
    public class LoginController : Controller
    {
        string _stringConnection = ConfigurationManager.ConnectionStrings["connBD_ADO"].ConnectionString;
        // GET: Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginBEAN login)
        {
            LoginBEAN login_acceso = new LoginBEAN();
            using (var conexion = new SqlConnection(_stringConnection))
            {
                using (var comando = new SqlCommand("SP_BUSCAR_USUARIO", conexion))
                {
                    comando.CommandType = CommandType.StoredProcedure;
                    comando.Parameters.AddWithValue("@user_acceso", login.User);
                    conexion.Open();
                    using (var datos = comando.ExecuteReader())
                    {
                        while (datos.Read())
                        {
                            login_acceso.User = datos[0].ToString();
                            login_acceso.nombre_tipo_usuario = datos[1].ToString();
                        }
                    }
                }
            }
            //Validar
            if (login_acceso.User != null && login_acceso.nombre_tipo_usuario == "Administrador")
            {
                Session["usuario"] = login_acceso.User;
                Session["tipo_usuario"] = login_acceso.nombre_tipo_usuario;
                //Redireccionar a la pagina Administrador con todas las opciones
                return RedirectToAction("Index", "Home");
            }
            else if (login_acceso.User != null && login_acceso.nombre_tipo_usuario == "Cliente")
            {
                Session["usuario"] = login_acceso.User;
                Session["tipo_usuario"] = login_acceso.nombre_tipo_usuario;
                //Redireccionar a la pagina Cliente con sus opciones
                return RedirectToAction("Index", "Cliente");
            }
            else {
                return View();
            }
        }
        public ActionResult CerrarSesion()
        {
            Session.Contents.RemoveAll();
            return RedirectToAction("Login", "Login");
        }
    }
}