using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using W24___TP___Remise_1___Delfik_Latulippe.Models;

namespace W24___TP___Remise_1___Delfik_Latulippe.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly GamesForumContext _context;

        public HomeController(ILogger<HomeController> logger, GamesForumContext context)
        {
            _logger = logger;
            _context = context;
        }

        public IActionResult Index()
        {
            var topics = _context.Topics.Include(t=>t.Posts);

            return View(topics);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}