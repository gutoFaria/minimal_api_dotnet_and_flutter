namespace backend.Models
{
    public class Work
    {
        public int WorkId { get; set; }
        public string WorkName { get; set; } = String.Empty;
        public string Description { get; set; } = String.Empty;
        public string Category { get; set; } = String.Empty;
        public int InitialPrice { get; set; }
        public int IntermediatePrice { get; set; }
        public int AdvancedPrice { get; set; }
        public DateTime AddedTime { get; set; }
    }
}