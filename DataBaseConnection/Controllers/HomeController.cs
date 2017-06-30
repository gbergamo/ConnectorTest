using DataBaseConnection.Business;
using DataBaseConnection.Models;
using System.Web.Mvc;

namespace DataBaseConnection.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            var dbModel = new DataBaseModel();
            var checker = new Checker();
            dbModel.isConnected = checker.Check();

            return View(dbModel);
        }
    }
}