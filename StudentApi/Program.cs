using StudentApi.Services;
using StudentApi.Settings;

var builder = WebApplication.CreateBuilder(args);

// Cấu hình MongoDB
builder.Services.Configure<MongoDBSettings>(
    builder.Configuration.GetSection("MongoDBSettings"));

// Đăng ký StudentService
builder.Services.AddSingleton<StudentService>();

// Thêm Controllers
builder.Services.AddControllers()
    .AddJsonOptions(options =>
    {
        // Giữ nguyên tên property (không camelCase)
        options.JsonSerializerOptions.PropertyNamingPolicy = null;
    });

// Cấu hình CORS cho phép Flutter/frontend kết nối
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
    {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

var app = builder.Build();

// Seed dữ liệu mẫu khi khởi động
using (var scope = app.Services.CreateScope())
{
    var studentService = scope.ServiceProvider.GetRequiredService<StudentService>();
    await studentService.SeedDataAsync();
}

app.UseCors("AllowAll");
app.UseAuthorization();
app.MapControllers();

app.Run();
