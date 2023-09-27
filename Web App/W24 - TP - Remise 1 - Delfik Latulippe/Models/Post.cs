using System;
using System.Collections.Generic;

namespace W24___TP___Remise_1___Delfik_Latulippe.Models
{
    public partial class Post
    {
        public Post()
        {
            Discussions = new HashSet<Discussion>();
        }

        public int PostId { get; set; }
        public int? TopicId { get; set; }
        public string? UserId { get; set; }
        public string Title { get; set; } = null!;
        public string Text { get; set; } = null!;
        public DateTime Date { get; set; }
        public int? Views { get; set; }
        public bool? Active { get; set; }

        public virtual Topic? Topic { get; set; }
        public virtual AspNetUser? User { get; set; }
        public virtual ICollection<Discussion> Discussions { get; set; }
    }
}
