using DAO.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaWEB.Controllers
{
    public class CategoriaTicketController : Controller
    {
        private BD_ticket_vs1Entities conn = new BD_ticket_vs1Entities();
        // GET: CategoriaTicket
        [HttpGet]
        public ActionResult Index()
        {
            string user = Convert.ToString(Session["usuario"]);
            if (user == "")
            {
                return RedirectToAction("Login", "Login");
            }
            return View(conn.tb_categoria_ticket.ToList());
        }
        [HttpGet]
        public ActionResult New()
        {
            return View();
        }
        [HttpPost]
        public ActionResult New(tb_categoria_ticket categoria_Ticket)
        {
            conn.tb_categoria_ticket.Add(categoria_Ticket);
            conn.SaveChanges();
            //return RedirectToAction("Index");
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            tb_categoria_ticket categoriatickets = new tb_categoria_ticket();
            categoriatickets = conn.tb_categoria_ticket.Find(id);
            return View(categoriatickets);
        }
        [HttpPost]
        public ActionResult Edit(tb_categoria_ticket categoria_Ticket)
        {
            tb_categoria_ticket usua = new tb_categoria_ticket();
            usua = conn.tb_categoria_ticket.Find(categoria_Ticket.idCategoria_ticket);
            usua.nombre_categoria_ticket = categoria_Ticket.nombre_categoria_ticket;
            usua.nombre_subcategoria_ticket = categoria_Ticket.nombre_subcategoria_ticket;
            usua.nombre_elemento_ticket = categoria_Ticket.nombre_elemento_ticket;
            conn.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}