using System.Security.Cryptography.X509Certificates;

namespace W24___TP___Remise_1___Delfik_Latulippe.Tools
{
    internal class Dashboard
    {
        public string? UserName { get; set; }
        public int UserPosts { get; set; }
        public int UserReplies { get; set; }

        public DateTime? UserLastActivity { get; set; }

        public Dashboard(DateTime? lastActivityPosts, DateTime? lastActivityDiscussions)
        {
            // UserLastActivity = lastActivityPosts ifNull -> lastActivityDiscussions ifNull -> default
            UserLastActivity = lastActivityPosts ?? lastActivityDiscussions ?? default;
            if (UserLastActivity != default)
            {
                if (lastActivityPosts > lastActivityDiscussions)
                {
                    UserLastActivity = lastActivityPosts;
                }
            }
        }




    }


}