using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using W24___TP___Remise_1___Delfik_Latulippe.Models;
using W24___TP___Remise_1___Delfik_Latulippe.Tools;

namespace W24___TP___Remise_1___Delfik_Latulippe.Controllers
{
    public class dashboardController : Controller
    {
        private readonly GamesForumContext _context;

        public dashboardController(GamesForumContext context)
        {
            _context = context;
        }


        // DASH BOARD - ADMIN 

        // GET: dashboard
        public async Task<IActionResult> Index()
        {
            // var customRequest = _context.Posts.Include(p => p.Discussions).Include(p => p.User).Select(p =>
            // new dashboard
            // {
            //
            // });

            // NEW MODEL
            var newModel = _context.AspNetUsers.Include(d=>d.Discussions).Include(d=>d.Posts).Select(d => new
            Dashboard(d.Posts.OrderByDescending(p => p.Date).First().Date, d.Discussions.OrderByDescending(p => p.Date).First().Date)
            {
                UserName = d.UserName,
                UserPosts = d.Posts.Count(),
                UserReplies = d.Discussions.Count()
                //UserLastActivityPost = d.Posts.OrderByDescending(p=>p.Date).First().Date,
                //UserLastActivityReply = d.Discussions.OrderByDescending(p => p.Date).First().Date
            });

            // NEW MODEL 2 
            //var newModel2 = from p in _context.Posts
            //                .Include(p => p.Discussions)
            //                .Include(p => p.User)
            //                select new Dashboard
            //                {
            //                    UserName = p.User.UserName,
            //                    UserPost = p.User.Posts.Count(),
            //                    UserReplies = p.User.Discussions.Count()
            //                };
            
            var gamesForumContext = _context.Posts.Include(p => p.Topic).Include(p => p.User);
            return View(await newModel.ToListAsync());
        }

        // GET: dashboard/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Posts == null)
            {
                return NotFound();
            }

            var post = await _context.Posts
                .Include(p => p.Topic)
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PostId == id);
            if (post == null)
            {
                return NotFound();
            }

            return View(post);
        }

        // GET: dashboard/Create
        public IActionResult Create()
        {
            ViewData["TopicId"] = new SelectList(_context.Topics, "TopicId", "TopicId");
            ViewData["UserId"] = new SelectList(_context.AspNetUsers, "Id", "Id");
            return View();
        }

        // POST: dashboard/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PostId,TopicId,UserId,Title,Text,Date,Views,Active")] Post post)
        {
            if (ModelState.IsValid)
            {
                _context.Add(post);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["TopicId"] = new SelectList(_context.Topics, "TopicId", "TopicId", post.TopicId);
            ViewData["UserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", post.UserId);
            return View(post);
        }

        // GET: dashboard/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Posts == null)
            {
                return NotFound();
            }

            var post = await _context.Posts.FindAsync(id);
            if (post == null)
            {
                return NotFound();
            }
            ViewData["TopicId"] = new SelectList(_context.Topics, "TopicId", "TopicId", post.TopicId);
            ViewData["UserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", post.UserId);
            return View(post);
        }

        // POST: dashboard/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PostId,TopicId,UserId,Title,Text,Date,Views,Active")] Post post)
        {
            if (id != post.PostId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(post);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PostExists(post.PostId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["TopicId"] = new SelectList(_context.Topics, "TopicId", "TopicId", post.TopicId);
            ViewData["UserId"] = new SelectList(_context.AspNetUsers, "Id", "Id", post.UserId);
            return View(post);
        }

        // GET: dashboard/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Posts == null)
            {
                return NotFound();
            }

            var post = await _context.Posts
                .Include(p => p.Topic)
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PostId == id);
            if (post == null)
            {
                return NotFound();
            }

            return View(post);
        }

        // POST: dashboard/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Posts == null)
            {
                return Problem("Entity set 'GamesForumContext.Posts'  is null.");
            }
            var post = await _context.Posts.FindAsync(id);
            if (post != null)
            {
                _context.Posts.Remove(post);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PostExists(int id)
        {
          return _context.Posts.Any(e => e.PostId == id);
        }
    }
}
