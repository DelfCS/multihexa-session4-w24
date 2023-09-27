using System;
using System.Collections.Generic;

namespace W24___TP___Remise_1___Delfik_Latulippe.Models
{
    public partial class Topic
    {
        public Topic()
        {
            Posts = new HashSet<Post>();
        }

        public int TopicId { get; set; }
        public string Name { get; set; } = null!;
        public string? Description { get; set; }
        public string? Image { get; set; }
        public bool? Active { get; set; }

        public virtual ICollection<Post> Posts { get; set; }
    }
}
