using BEAN;
using DAO.Modelo;
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
    public class UsuarioController : Controller
    {
        string _stringConnection = ConfigurationManager.ConnectionStrings["connBD_ADO"].ConnectionString;
        private BD_ticket_vs1Entities conn = new BD_ticket_vs1Entities();

        // GET: Usuario
        [HttpGet]
        public ActionResult Index()
        {
            string user = Convert.ToString(Session["usuario"]);
            if (user == "")
            {
                return RedirectToAction("Login", "Login");
            }
            //Listar usuario por ADO.NET
            List<LoginBEAN> lista = new List<LoginBEAN>();
            LoginBEAN usuario_list;
            try
            {
                using (var conexion = new SqlConnection(_stringConnection))
                {
                    using (var comando = new SqlCommand("SP_LISTAR_USUARIO", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        conexion.Open();
                        using (var datos = comando.ExecuteReader())
                        {
                            while (datos.Read())
                            {
                                usuario_list = new LoginBEAN();
                                usuario_list.idUsuario = Convert.ToInt32(datos[0]);
                                usuario_list.User = Convert.ToString(datos[1]);
                                usuario_list.nombre_tipo_usuario = Convert.ToString(datos[2]);
                                usuario_list.estado_usuario = Convert.ToBoolean(datos[3]);
                                lista.Add(usuario_list);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
            return View(lista);
        }
        [HttpGet]
        public ActionResult New()
        {
            ViewBag.ListaTipoUsuario = conn.tb_tipo_usuario.ToList();
            return View();
        }
        [HttpPost]
        public ActionResult New(LoginBEAN userregistro)
        {
            bool rpta = false;
            try
            {
                using (var conexion = new SqlConnection(_stringConnection))
                {
                    using (var comando = new SqlCommand("SP_REGISTRAR_USUARIO", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@user_acceso", userregistro.User);
                        comando.Parameters.AddWithValue("@pass", userregistro.Pass);
                        comando.Parameters.AddWithValue("@nombre_tipo_usuario", userregistro.nombre_tipo_usuario);
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        rpta = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id){
            tb_usuario prodc = new tb_usuario();
            prodc = conn.tb_usuario.Find(id);
            return View(prodc);
        }
        public ActionResult Edit(LoginBEAN usuario_edicion)
        {
            bool rpta = false;
            try
            {
                using (var conexion = new SqlConnection(_stringConnection))
                {
                    using (var comando = new SqlCommand("SP_EDITAR_USUARIO", conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;
                        comando.Parameters.AddWithValue("@user_acceso_old", usuario_edicion.User);
                        comando.Parameters.AddWithValue("@user_acceso_new", usuario_edicion.user_name_new);
                        comando.Parameters.AddWithValue("@pass", usuario_edicion.Pass);
                        conexion.Open();
                        comando.ExecuteNonQuery();
                        rpta = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }
            return RedirectToAction("Index");
        }
    }
}