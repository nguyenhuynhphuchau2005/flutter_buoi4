using Microsoft.AspNetCore.Mvc;
using StudentApi.Models;
using StudentApi.Services;

namespace StudentApi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StudentsController : ControllerBase
    {
        private readonly StudentService _studentService;

        public StudentsController(StudentService studentService)
        {
            _studentService = studentService;
        }

        // GET: api/students
        [HttpGet]
        public async Task<ActionResult<List<Student>>> GetAll()
        {
            var students = await _studentService.GetAllAsync();
            return Ok(students);
        }

        // GET: api/students/{id}
        [HttpGet("{id}")]
        public async Task<ActionResult<Student>> GetById(string id)
        {
            var student = await _studentService.GetByIdAsync(id);
            if (student is null)
                return NotFound(new { message = $"Không tìm thấy sinh viên với id: {id}" });

            return Ok(student);
        }

        // POST: api/students
        [HttpPost]
        public async Task<ActionResult<Student>> Create([FromBody] Student student)
        {
            await _studentService.CreateAsync(student);
            return CreatedAtAction(nameof(GetById), new { id = student.Id }, student);
        }

        // PUT: api/students/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> Update(string id, [FromBody] Student student)
        {
            var existing = await _studentService.GetByIdAsync(id);
            if (existing is null)
                return NotFound(new { message = $"Không tìm thấy sinh viên với id: {id}" });

            student.Id = existing.Id;
            await _studentService.UpdateAsync(id, student);
            return NoContent();
        }

        // DELETE: api/students/{id}
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(string id)
        {
            var existing = await _studentService.GetByIdAsync(id);
            if (existing is null)
                return NotFound(new { message = $"Không tìm thấy sinh viên với id: {id}" });

            await _studentService.DeleteAsync(id);
            return NoContent();
        }
    }
}
