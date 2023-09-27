using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using W24___TP___Remise_1___Delfik_Latulippe.Models;
using W24___TP___Remise_1___Delfik_Latulippe.Tools;

namespace W24___TP___Remise_1___Delfik_Latulippe.Controllers
{
    public class PostsController : Controller
    {
        private readonly GamesForumContext _context;

        public PostsController(GamesForumContext context)
        {
            _context = context;
        }

        // GET: Posts
        public async Task<IActionResult> Index(int? topicId, string? topicName, int? pageNumber, int? customPageSize) // Represente le PK d'un Topic
        {
            var pageIndex = pageNumber ?? 1; // pageIndex = pageNumber, ou 1 si nul
            var pageSize = 0;
            if (customPageSize == 0){
                pageSize = _context.Posts.Where(p => p.TopicId == topicId).Count();
            }else{
                pageSize = customPageSize ?? 5; // pageSize = customPageSize, ou 5 si nul
            }
            if (pageSize != 5)
            {
                ViewData["CustomPageSize"] = pageSize;
            }

            // Ici, on dit que l'on veut 
            var posts = _context.Posts.Where(p=> p.TopicId == topicId)
                .Where(p=>p.Active == true)
                .OrderByDescending(p=>p.Date)
                .Include(p => p.Topic)
                .Include(p=>p.Discussions)
                .Include(p=>p.User);

            ViewData["TopicId"] = topicId;
            ViewData["TopicName"] = topicName;

            return View(await PaginatedList<Post>.CreateAsync(posts, pageIndex, pageSize));
        }

        // GET: Posts/Details/5
        public async Task<IActionResult> Details(int? postId, string? topicName) // Représdente le PK d'un Post
        {
            if (postId == null || _context.Posts == null)
            {
                return NotFound();
            }
            
            // Ce qu'on retourne 
            var post = await _context.Posts
                .Include(p => p.Topic)// For topicName
                .Include(p => p.User) // For UserName reference
                .Include(p => p.Discussions).OrderBy(d=>d.Date) // For replies 
                .FirstOrDefaultAsync(m => m.PostId == postId);

            // Replies
            var replies = _context.Discussions
                .Where(d => d.PostId == postId)
                .Count();

            // On rajoute une vue au Post
            post.Views += 1;

            //_context.Update(views);
            try
            {
                _context.Update(post);
                await _context.SaveChangesAsync();
            }
            catch (Exception ex) { }
            
            ViewData["Replies"] = replies;
            ViewData["PostId"] = postId;
            ViewData["TopicName"] = topicName;

            if (post == null)
            {
                return NotFound();
            }

            return View(post);
        }

        // GET: Posts/Create
        [Authorize]
        public IActionResult Create(int? topicId)
        {
            ViewData["TopicName"] = _context.Topics.Where(p => p.TopicId == topicId).First().Name;
            ViewData["TopicId"] = topicId;

            return View();
        }

        // POST: Posts/Create
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PostId,TopicId,UserId,Title,Text,Date,Views,Active")] Post post)
        {
            if (ModelState.IsValid)
            {
                post.UserId = User.FindFirstValue(ClaimTypes.NameIdentifier); // Représente l'ID de l'utilisateur 
                post.Date = DateTime.Now; // Représnte la date maintenant ( à la création du POST )

                _context.Add(post);
                await _context.SaveChangesAsync();
                // Paramètre pour retourner à l'index
                return RedirectToAction("Index","Posts", new {topicId=post.TopicId});
            }
            ViewData["TopicId"] = new SelectList(_context.Topics, "TopicId", "TopicId", post.TopicId);
            return View(post);
        }

        // GET: Posts/Edit/5
        public async Task<IActionResult> Edit(int? postId) // Représente le PK d'un post
        {
            if (postId == null || _context.Posts == null)
            {
                return NotFound();
            }

            var post = await _context.Posts.FindAsync(postId);
            if (post == null)
            {
                return NotFound();
            }
        
            return View(post);
        }

        // POST: Posts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int postId, [Bind("PostId,TopicId,UserId,Title,Text,Date,Views,Active")] Post post)
        {
            if (postId != post.PostId)
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
                if(_context.Discussions.Where(d=>d.PostId == postId).Where(d=>d.Active == true).Count() == 0) {
                    // No discussions, redirect to post details
                    return RedirectToAction("Details", new { postId = post.PostId });
                }
                else{
                    // Discussions, redirect to post with discussions
                    return RedirectToAction("Index", "Discussions", new { postId = post.PostId });
                }
                
            }
            return View(post);
        }

        // GET: Posts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Posts == null)
            {
                return NotFound();
            }

            var post = await _context.Posts
                .Include(p => p.Topic)
                .Include(p=>p.User)
                .FirstOrDefaultAsync(p => p.PostId == id);
            if (post == null)
            {
                return NotFound();
            }
            return View(post);
        }

        // POST: Posts/Delete/5
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
                // On rend le post inactif...
                post.Active = false;
                // On update des changements vers la BD
                _context.Posts.Update(post);
            }
            // On sauvegarde les changements 
            await _context.SaveChangesAsync();
            // On retourne à l'action index, avec paramètre
            return RedirectToAction("index", new { topicId = post.TopicId });
        }

        private bool PostExists(int id)
        {
          return _context.Posts.Any(e => e.PostId == id);
        }
    }
}
