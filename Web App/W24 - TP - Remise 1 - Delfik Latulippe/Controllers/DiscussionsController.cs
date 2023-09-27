using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Hosting;
using W24___TP___Remise_1___Delfik_Latulippe.Models;
using W24___TP___Remise_1___Delfik_Latulippe.Tools;

namespace W24___TP___Remise_1___Delfik_Latulippe.Controllers
{
    public class DiscussionsController : Controller
    {
        private readonly GamesForumContext _context;

        public DiscussionsController(GamesForumContext context)
        {
            _context = context;
        }

        // GET: Discussions
        public async Task<IActionResult> Index(int postId, int? pageNumber, int? customPageSize) // PK 
        {
            var pageIndex = pageNumber ?? 1; // pageIndex = pageNumber, ou 1 si nul
            var pageSize = 0;
            if (customPageSize == 0){
                pageSize = _context.Discussions.Where(d => d.PostId == postId).Count();
            }else{
                pageSize = customPageSize ?? 5; // pageSize = customPageSize, ou 5 si nul
            }

            if (pageSize != 5) {
                ViewData["CustomPageSize"] = pageSize;
            }

            // On rajoute le vue au post
            var post = _context.Posts.Where(p => p.PostId == postId).First();
            // On rajoute une vue au Post
            post.Views += 1;

            //_context.Update(views);
            try
            {
                _context.Update(post);
                await _context.SaveChangesAsync();
            }catch (Exception ex) { }

            ViewData["PostId"] = postId;
            ViewData["Replies"] = _context.Discussions.Where(d => d.PostId == postId).Where(d=>d.Active == true).Count();

            var discussions = _context.Discussions.Where(d => d.PostId == postId)
                .Where(d=>d.Active == true)
                .OrderByDescending(d=>d.Date)
                .Include(d => d.Post)
                .Include(d => d.User)
                .Include(d => d.Post.Topic);

            return View(await PaginatedList<Discussion>.CreateAsync(discussions,pageIndex,pageSize));
        }

        // GET: Discussions/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Discussions == null)
            {
                return NotFound();
            }

            var discussion = await _context.Discussions
                .Include(d => d.Post)
                .FirstOrDefaultAsync(m => m.MsgId == id);
            if (discussion == null)
            {
                return NotFound();
            }

            return View(discussion);
        }

        // GET: Discussions/Create
        [Authorize] 
        public IActionResult Create(int? postId, string? topicName)
        {
            ViewData["PostId"] = postId;
            ViewData["PostText"] = _context.Posts.Where(p => p.PostId == postId).First().Text;
            ViewData["PostTitle"] = _context.Posts.Where(p => p.PostId == postId).First().Title;
            // Utilisé pour savoir si le lien de retour mène sur les discussions ou les details du post...
            ViewData["Replies"] = _context.Discussions.Where(d => d.PostId == postId).Count() > 0;
            ViewData["UserId"] = User.FindFirstValue(ClaimTypes.NameIdentifier);
            return View();
        }

        // POST: Discussions/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MsgId,PostId,UserId,Text,Date,Active")] Discussion discussion)
        {
            if (ModelState.IsValid)
            {
                // On assigne l'UTILISATEUR
                discussion.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier);
                // On assigne la DATE
                discussion.Date = DateTime.Now;

                _context.Add(discussion);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index", new { postId = discussion.PostId });
            }

            return View(discussion);
        }

        // GET: Discussions/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Discussions == null)
            {
                return NotFound();
            }

            var discussion = await _context.Discussions.FindAsync(id);
            if (discussion == null)
            {
                return NotFound();
            }
            return View(discussion);
        }

        // POST: Discussions/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MsgId,PostId,UserId,Text,Date,Active")] Discussion discussion)
        {
            if (id != discussion.MsgId)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(discussion);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!DiscussionExists(discussion.MsgId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction("Index", new {postId = discussion.PostId});
            }
            return View(discussion);
        }

        // GET: Discussions/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Discussions == null)
            {
                return NotFound();
            }

            var discussion = await _context.Discussions
                .Include(d => d.Post)
                .FirstOrDefaultAsync(m => m.MsgId == id);
            if (discussion == null)
            {
                return NotFound();
            }

            return View(discussion);
        }

        // POST: Discussions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Discussions == null)
            {
                return Problem("Entity set 'GamesForumContext.Discussions'  is null.");
            }
            var discussion = await _context.Discussions.FindAsync(id);
            if (discussion != null)
            {
                discussion.Active = false;
                _context.Discussions.Update(discussion);
            }
            await _context.SaveChangesAsync();
            if(_context.Discussions.Where(p=>p.PostId == discussion.PostId).Where(p=>p.Active == true).Count() > 0)
            {
                return RedirectToAction("Index", new { postId = discussion.PostId });
            }
            else
            {
                return RedirectToAction("Details", "Posts" ,new { postId = discussion.PostId });
            }
        }

        private bool DiscussionExists(int id)
        {
          return _context.Discussions.Any(e => e.MsgId == id);
        }
    }
}
