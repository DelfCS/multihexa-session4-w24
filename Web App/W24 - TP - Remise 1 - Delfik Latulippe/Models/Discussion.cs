using System;
using System.Collections.Generic;

namespace W24___TP___Remise_1___Delfik_Latulippe.Models
{
    public partial class Discussion
    {
        public int MsgId { get; set; }
        public int? PostId { get; set; }
        public string? UserId { get; set; }
        public string Text { get; set; } = null!;
        public DateTime Date { get; set; }
        public bool? Active { get; set; }

        public virtual Post? Post { get; set; }
        public virtual AspNetUser? User { get; set; }
    }
}
