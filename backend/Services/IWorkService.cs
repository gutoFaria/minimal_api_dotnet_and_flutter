using backend.Models;

namespace backend.Services
{
    public interface IWorkService
    {
        Task<List<Work>> GetDataAsync();
        Task<Work> GetDataById(int id);
        Task<Work> InsertData(Work work);
        Task<Work> UpdateData(Work work);
        Task<bool> DeleteData(int id);
    }
}