using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SistemaWEB.Controllers
{
    public class TicketController : Controller
    {
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