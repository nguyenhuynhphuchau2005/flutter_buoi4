import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ─────────────────────────────────────────────
// YÊU CẦU 3: MODEL - Parse JSON từ API
// ─────────────────────────────────────────────
class Student {
  final String id;
  final String mssv;
  final String hoTen;
  final String ngaySinh;
  final String gioiTinh;
  final String email;
  final String soDienThoai;
  final String lop;
  final String nganh;
  final double diemTrungBinh;
  final String trangThai;

  Student({
    required this.id,
    required this.mssv,
    required this.hoTen,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.email,
    required this.soDienThoai,
    required this.lop,
    required this.nganh,
    required this.diemTrungBinh,
    required this.trangThai,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['Id'] ?? '',
      mssv: json['MSSV'] ?? '',
      hoTen: json['HoTen'] ?? '',
      ngaySinh: json['NgaySinh'] != null
          ? json['NgaySinh'].toString().substring(0, 10)
          : '',
      gioiTinh: json['GioiTinh'] ?? '',
      email: json['Email'] ?? '',
      soDienThoai: json['SoDienThoai'] ?? '',
      lop: json['Lop'] ?? '',
      nganh: json['Nganh'] ?? '',
      diemTrungBinh: (json['DiemTrungBinh'] ?? 0).toDouble(),
      trangThai: json['TrangThai'] ?? '',
    );
  }
}

// ─────────────────────────────────────────────
// YÊU CẦU 3: GỌI API lấy danh sách sinh viên
// ─────────────────────────────────────────────
class StudentApiService {
  // Android Emulator dùng 10.0.2.2, Windows/Web dùng localhost
  static const String baseUrl = 'http://localhost:5297/api/students';

  static Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Student.fromJson(json)).toList();
    } else {
      throw Exception('Lỗi khi tải danh sách sinh viên');
    }
  }
}

// ─────────────────────────────────────────────
// YÊU CẦU 2: GIAO DIỆN hiển thị danh sách sinh viên
// ─────────────────────────────────────────────
class Buoi6Screen extends StatefulWidget {
  const Buoi6Screen({super.key});

  @override
  State<Buoi6Screen> createState() => _Buoi6ScreenState();
}

class _Buoi6ScreenState extends State<Buoi6Screen> {
  late Future<List<Student>> _futureStudents;

  @override
  void initState() {
    super.initState();
    _futureStudents = StudentApiService.fetchStudents();
  }

  void _refresh() {
    setState(() {
      _futureStudents = StudentApiService.fetchStudents();
    });
  }

  Color _gpaColor(double gpa) {
    if (gpa >= 8.5) return const Color(0xFF00C896);
    if (gpa >= 7.0) return const Color(0xFF3B82F6);
    return const Color(0xFFF59E0B);
  }

  String _gpaLabel(double gpa) {
    if (gpa >= 8.5) return 'Giỏi';
    if (gpa >= 7.0) return 'Khá';
    if (gpa >= 4.0) return 'Trung bình';
    if (gpa >= 2.0) return 'Yếu';
    return 'Kém';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: _buildAppBar(),
      body: FutureBuilder<List<Student>>(
        future: _futureStudents,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError) {
            return _buildError(snapshot.error.toString());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildEmpty();
          }
          return _buildStudentList(snapshot.data!);
        },
      ),
    );
  }

  // ── AppBar ──────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.black12,
      title: const Row(
        children: [
          Icon(Icons.school_rounded, color: Color(0xFF6366F1), size: 28),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Danh Sách Sinh Viên',
                style: TextStyle(
                  color: Color(0xFF1E293B),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Quản lý thông tin sinh viên',
                style: TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: _refresh,
          icon: const Icon(Icons.refresh_rounded, color: Color(0xFF6366F1)),
          tooltip: 'Tải lại',
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  // ── Loading ──────────────────────────────────
  Widget _buildLoading() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Color(0xFF6366F1)),
          SizedBox(height: 16),
          Text(
            'Đang tải dữ liệu...',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
          ),
        ],
      ),
    );
  }

  // ── Error ────────────────────────────────────
  Widget _buildError(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xFFEF4444).withOpacity(0.3),
                ),
              ),
              child: const Icon(
                Icons.wifi_off_rounded,
                color: Color(0xFFEF4444),
                size: 60,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Không thể kết nối API',
              style: TextStyle(
                color: Color(0xFF1E293B),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Hãy chắc chắn server đang chạy\ntại http://localhost:5297',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: _refresh,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Thử lại'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6366F1),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Empty ────────────────────────────────────
  Widget _buildEmpty() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.inbox_rounded, color: Color(0xFFCBD5E1), size: 64),
          SizedBox(height: 16),
          Text(
            'Không có sinh viên nào',
            style: TextStyle(color: Color(0xFF94A3B8), fontSize: 16),
          ),
        ],
      ),
    );
  }

  // ── Student List ──────────────────────────────
  Widget _buildStudentList(List<Student> students) {
    return Column(
      children: [
        _buildSummaryBar(students.length),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: students.length,
            itemBuilder: (context, index) {
              return _buildStudentCard(students[index], index);
            },
          ),
        ),
      ],
    );
  }

  // ── Summary Bar ────────────────────────────────
  Widget _buildSummaryBar(int total) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.people_alt_rounded, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            'Tổng cộng: $total sinh viên',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.white70,
            size: 18,
          ),
          const SizedBox(width: 4),
          const Text(
            'Đang học',
            style: TextStyle(color: Colors.white70, fontSize: 13),
          ),
        ],
      ),
    );
  }

  // ── Student Card ──────────────────────────────
  Widget _buildStudentCard(Student s, int index) {
    final gpaColor = _gpaColor(s.diemTrungBinh);
    final gpaLabel = _gpaLabel(s.diemTrungBinh);

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // ── Header ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF6366F1).withOpacity(0.15),
                  Colors.transparent,
                ],
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                // Avatar chữ cái đầu
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: s.gioiTinh == 'Nam'
                          ? [const Color(0xFF3B82F6), const Color(0xFF6366F1)]
                          : [const Color(0xFFEC4899), const Color(0xFF8B5CF6)],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      s.hoTen.isNotEmpty ? s.hoTen[0] : '?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Tên & MSSV
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        s.hoTen,
                        style: const TextStyle(
                          color: Color(0xFF1E293B),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          const Icon(
                            Icons.badge_rounded,
                            size: 13,
                            color: Color(0xFF6366F1),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            s.mssv,
                            style: const TextStyle(
                              color: Color(0xFF6366F1),
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            s.gioiTinh == 'Nam'
                                ? Icons.male_rounded
                                : Icons.female_rounded,
                            size: 14,
                            color: s.gioiTinh == 'Nam'
                                ? const Color(0xFF3B82F6)
                                : const Color(0xFFEC4899),
                          ),
                          Text(
                            s.gioiTinh,
                            style: TextStyle(
                              color: s.gioiTinh == 'Nam'
                                  ? const Color(0xFF3B82F6)
                                  : const Color(0xFFEC4899),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // GPA Badge
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: gpaColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: gpaColor.withOpacity(0.4)),
                      ),
                      child: Text(
                        s.diemTrungBinh.toStringAsFixed(1),
                        style: TextStyle(
                          color: gpaColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      gpaLabel,
                      style: TextStyle(color: gpaColor, fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1, color: Color(0xFFE2E8F0)),

          // ── Chi tiết ──
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    _infoTile(Icons.class_rounded, 'Lớp', s.lop),
                    const SizedBox(width: 12),
                    _infoTile(
                      Icons.account_balance_rounded,
                      'Ngành',
                      s.nganh,
                      flex: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _infoTile(
                      Icons.calendar_month_rounded,
                      'Ngày sinh',
                      s.ngaySinh,
                    ),
                    const SizedBox(width: 12),
                    _infoTile(Icons.phone_rounded, 'SĐT', s.soDienThoai),
                  ],
                ),
                const SizedBox(height: 10),
                _infoTile(
                  Icons.email_rounded,
                  'Email',
                  s.email,
                  fullWidth: true,
                ),
              ],
            ),
          ),

          // ── Footer ──
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC),
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFF00C896),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF00C896).withOpacity(0.5),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  s.trangThai,
                  style: const TextStyle(
                    color: Color(0xFF059669),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Text(
                  '#${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── Info Tile ─────────────────────────────────
  Widget _infoTile(
    IconData icon,
    String label,
    String value, {
    int flex = 1,
    bool fullWidth = false,
  }) {
    final tile = Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: const Color(0xFF6366F1)),
          const SizedBox(width: 6),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 10,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF1E293B),
                    fontSize: 13,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (fullWidth) return tile;
    return Expanded(flex: flex, child: tile);
  }
}
