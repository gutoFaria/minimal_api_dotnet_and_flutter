using backend.Data;
using backend.Models;
using Microsoft.EntityFrameworkCore;

namespace backend.Services
{
    public class WorkService : IWorkService
    {
        private readonly WorkDbContext _db;

        public WorkService(WorkDbContext db)
        {
            _db = db;
        }

        public async Task<bool> DeleteData(int id)
        {
            var work = await _db.Works.FindAsync(id);
            if(work != null)
            {
                _db.Works.Remove(work);
                await _db.SaveChangesAsync();
                return true;
            }
            return false;
        }

        public async Task<List<Work>> GetDataAsync()
        {
            return await _db.Works.ToListAsync();
        }

        public async Task<Work> GetDataById(int id)
        {
            var work = await _db.Works.FindAsync(id);
            if(work != null)
                return work;
            
            return null!;
        }

        public async Task<Work> InsertData(Work work)
        {
            await _db.Works.AddAsync(work);
            await _db.SaveChangesAsync();
            return work;
        }

        public async Task<Work> UpdateData(Work work)
        {
            if(work.WorkId != 0)
            {
                var w = await _db.Works.FindAsync(work.WorkId);
                if(w != null)
                {
                    w.WorkName = work.WorkName;
                    w.Description = work.Description;
                    w.Category = work.Category;
                    w.InitialPrice = work.InitialPrice;
                    w.IntermediatePrice=work.IntermediatePrice;
                    w.AdvancedPrice = work.AdvancedPrice;
                    w.AddedTime = work.AddedTime;
                    await _db.SaveChangesAsync();
                    return work;
                }
            }
            return null!;
        }
    }
}