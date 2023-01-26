using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Data
{
    public class WorkDbContext : DbContext
    {
        public WorkDbContext(DbContextOptions<WorkDbContext> options) : base(options)
        {
            
        }

        public DbSet<Work> Works => Set<Work>();
    }
}