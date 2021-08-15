using DAO.Modelo;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaWEB.Controllers
{
    public class AsuntoTicketController : Controller
    {
        private BD_ticket_vs1Entities conn = new BD_ticket_vs1Entities();
        // GET: AsuntoTicket
        [HttpGet]
        public ActionResult Index()
        {
            string user = Convert.ToString(Session["usuario"]);
            if (user == "")
            {
                return RedirectToAction("Login", "Login");
            }
            return View(conn.tb_asunto_ticket.ToList());
        }
        [HttpGet]
        public ActionResult New()
        {
            return View();
        }
        [HttpPost]
        public ActionResult New(tb_asunto_ticket asuntoticket)
        {
            conn.tb_asunto_ticket.Add(asuntoticket);
            conn.SaveChanges();
            //return RedirectToAction("Index");
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            tb_asunto_ticket asunto = new tb_asunto_ticket();
            asunto = conn.tb_asunto_ticket.Find(id);
            return View(asunto);
        }
        [HttpPost]
        public ActionResult Edit(tb_asunto_ticket asuntoedit)
        {
            tb_asunto_ticket usua = new tb_asunto_ticket();
            usua = conn.tb_asunto_ticket.Find(asuntoedit.idAsunto_ticket);
            usua.asunto_descripcion_ticket = asuntoedit.asunto_descripcion_ticket;
            conn.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            conn.tb_asunto_ticket.Remove(conn.tb_asunto_ticket.Find(id));
            conn.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}