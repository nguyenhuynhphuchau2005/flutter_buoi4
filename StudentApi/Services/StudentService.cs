using MongoDB.Driver;
using StudentApi.Models;
using StudentApi.Settings;
using Microsoft.Extensions.Options;

namespace StudentApi.Services
{
    public class StudentService
    {
        private readonly IMongoCollection<Student> _students;

        public StudentService(IOptions<MongoDBSettings> settings)
        {
            var client = new MongoClient(settings.Value.ConnectionString);
            var database = client.GetDatabase(settings.Value.DatabaseName);
            _students = database.GetCollection<Student>(settings.Value.CollectionName);
        }

        // Lấy tất cả sinh viên
        public async Task<List<Student>> GetAllAsync() =>
            await _students.Find(_ => true).ToListAsync();

        // Lấy sinh viên theo ID
        public async Task<Student?> GetByIdAsync(string id) =>
            await _students.Find(s => s.Id == id).FirstOrDefaultAsync();

        // Tạo sinh viên mới
        public async Task CreateAsync(Student student) =>
            await _students.InsertOneAsync(student);

        // Cập nhật sinh viên
        public async Task UpdateAsync(string id, Student student) =>
            await _students.ReplaceOneAsync(s => s.Id == id, student);

        // Xóa sinh viên
        public async Task DeleteAsync(string id) =>
            await _students.DeleteOneAsync(s => s.Id == id);

        // Seed dữ liệu mẫu nếu collection trống
        public async Task SeedDataAsync()
        {
            var count = await _students.CountDocumentsAsync(_ => true);
            if (count == 0)
            {
                var students = new List<Student>
                {
                    new Student
                    {
                        MSSV = "SV001",
                        HoTen = "Nguyễn Văn An",
                        NgaySinh = new DateTime(2003, 5, 15),
                        GioiTinh = "Nam",
                        Email = "an.nguyen@student.edu.vn",
                        SoDienThoai = "0901234567",
                        Lop = "CNTT01",
                        Nganh = "Công nghệ thông tin",
                        DiemTrungBinh = 8.5,
                        TrangThai = "Đang học"
                    },
                    new Student
                    {
                        MSSV = "SV002",
                        HoTen = "Trần Thị Bình",
                        NgaySinh = new DateTime(2003, 8, 22),
                        GioiTinh = "Nữ",
                        Email = "binh.tran@student.edu.vn",
                        SoDienThoai = "0912345678",
                        Lop = "CNTT01",
                        Nganh = "Công nghệ thông tin",
                        DiemTrungBinh = 9.0,
                        TrangThai = "Đang học"
                    },
                    new Student
                    {
                        MSSV = "SV003",
                        HoTen = "Lê Minh Cường",
                        NgaySinh = new DateTime(2002, 12, 10),
                        GioiTinh = "Nam",
                        Email = "cuong.le@student.edu.vn",
                        SoDienThoai = "0923456789",
                        Lop = "CNTT02",
                        Nganh = "Công nghệ thông tin",
                        DiemTrungBinh = 7.8,
                        TrangThai = "Đang học"
                    },
                    new Student
                    {
                        MSSV = "SV004",
                        HoTen = "Phạm Thị Dung",
                        NgaySinh = new DateTime(2003, 3, 18),
                        GioiTinh = "Nữ",
                        Email = "dung.pham@student.edu.vn",
                        SoDienThoai = "0934567890",
                        Lop = "CNTT02",
                        Nganh = "Công nghệ thông tin",
                        DiemTrungBinh = 8.2,
                        TrangThai = "Đang học"
                    },
                    new Student
                    {
                        MSSV = "SV005",
                        HoTen = "Hoàng Văn Em",
                        NgaySinh = new DateTime(2002, 7, 5),
                        GioiTinh = "Nam",
                        Email = "em.hoang@student.edu.vn",
                        SoDienThoai = "0945678901",
                        Lop = "CNTT03",
                        Nganh = "Hệ thống thông tin",
                        DiemTrungBinh = 6.9,
                        TrangThai = "Đang học"
                    }
                };

                await _students.InsertManyAsync(students);
            }
        }
    }
}
