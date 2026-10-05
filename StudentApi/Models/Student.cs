using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace StudentApi.Models
{
    public class Student
    {
        [BsonId]
        [BsonRepresentation(BsonType.ObjectId)]
        public string? Id { get; set; }

        [BsonElement("mssv")]
        public string MSSV { get; set; } = string.Empty;

        [BsonElement("hoTen")]
        public string HoTen { get; set; } = string.Empty;

        [BsonElement("ngaySinh")]
        public DateTime NgaySinh { get; set; }

        [BsonElement("gioiTinh")]
        public string GioiTinh { get; set; } = string.Empty;

        [BsonElement("email")]
        public string Email { get; set; } = string.Empty;

        [BsonElement("soDienThoai")]
        public string SoDienThoai { get; set; } = string.Empty;

        [BsonElement("lop")]
        public string Lop { get; set; } = string.Empty;

        [BsonElement("nganh")]
        public string Nganh { get; set; } = string.Empty;

        [BsonElement("diemTrungBinh")]
        public double DiemTrungBinh { get; set; }

        [BsonElement("trangThai")]
        public string TrangThai { get; set; } = string.Empty;
    }
}
