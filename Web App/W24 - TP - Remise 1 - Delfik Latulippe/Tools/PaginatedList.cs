
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace W24___TP___Remise_1___Delfik_Latulippe.Tools
{
    public class PaginatedList<T> : List<T> // PaginatedList<T> hérite de List<T> ou <T> est un type (model) générique
    {
        public int PageIndex { get; private set; } // Représente l'index de la page
        public int TotalPages { get; private set; } // Représente le total de pages

        public PaginatedList(List<T> items, int count, int pageIndex, int pageSize)
        {
            PageIndex = pageIndex;
            TotalPages = (int)Math.Ceiling(count / (double)pageSize);

            AddRange(items);
        }

        public bool HasPreviousPage => PageIndex > 1; // Page précédente ?

        public bool HasNextPage => PageIndex < TotalPages;// Page suivante ?

        public static async Task<PaginatedList<T>> CreateAsync(IQueryable<T> source, int pageIndex, int pageSize)
        {
            var count = await source.CountAsync();
            var items = await source.Skip((pageIndex - 1) * pageSize).Take(pageSize).ToListAsync();
            return new PaginatedList<T>(items, count, pageIndex, pageSize);
        }
    }
}
