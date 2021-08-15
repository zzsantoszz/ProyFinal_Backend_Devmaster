using DAO.Modelo;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaWEB.Controllers
{
    public class TicketController : Controller
    {
        string _stringConnection = ConfigurationManager.ConnectionStrings["connBD_ADO"].ConnectionString;
        private BD_ticket_vs1Entities conn = new BD_ticket_vs1Entities();
        // GET: Ticket
        [HttpGet]
        public ActionResult Index()
        {
            string user = Convert.ToString(Session["usuario"]);
            if (user == "")
            {
                return RedirectToAction("Login", "Login");
            }
            return View();
        }
    }
}