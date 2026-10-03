import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập buổi 4 - Profile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0284C7)),
        useMaterial3: true,
      ),
      // home: const ProfileScreen(),
      // home: Buoi5Screen(),
      // home: Buoi4Card(),
      // home: CardDemov2(),
      // home: ListTileDemo(),
      // home: GridViewDemo(),
      // home: ListViewDemo(),
      // home: SongListScreen(),
      home: SongDetailScreen(),
    );
  }
}

class ContainerExample2 extends StatelessWidget {
  const ContainerExample2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.blue[200],
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(width: 150, height: 150, color: Colors.red),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(width: 150, height: 150, color: Colors.yellow),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContainerExample extends StatelessWidget {
  const ContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 180, 241, 250),
      child: const Center(child: Text("Hello")),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Buoi4Card extends StatelessWidget {
  const Buoi4Card({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      color: Colors.amber,
      elevation: 15,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Text("Nội dung thẻ"),
      ),
    );
  }
}

class CardDemov2 extends StatelessWidget {
  const CardDemov2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Card Demo V2')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 350, // Giới hạn chiều rộng của Card
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 25.0,
                  horizontal: 10.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      leading: Icon(
                        Icons.school,
                        size: 45,
                        color: Colors.deepPurple,
                      ),
                      title: Text(
                        "Thông tin sinh viên",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      subtitle: Text(
                        "Môn học: CMP177",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    const Divider(indent: 5, endIndent: 5), // Đường kẻ
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text("Chi tiết"),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Đăng ký"),
                        ),
                        const SizedBox(
                          width: 12,
                        ), // Đẩy 2 nút qua trái một chút
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListTileDemo extends StatelessWidget {
  const ListTileDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Danh sách')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            elevation: 8, // Đổ bóng
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Bo tròn góc
            ),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.blue,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: const Text("Nguyễn Huỳnh Phúc Hậu"),
              subtitle: const Text("Sinh viên lớp CMP177"),
              trailing: const Icon(Icons.chevron_right, color: Colors.blue),
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}

class GridViewDemo extends StatelessWidget {
  const GridViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GridView Demo')),
      body: GridView.count(
        padding: const EdgeInsets.all(16.0),
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          for (int i = 1; i <= 8; i++)
            Container(
              decoration: BoxDecoration(
                color: Colors.primaries[i % 18][300], // Màu nền nhạt (pastel)
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Center(
                child: Text(
                  "Ô số $i",
                  style: TextStyle(
                    color:
                        Colors.primaries[i %
                            18][800], // Màu chữ cùng tông nhưng cực đậm
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class UserInfoItem {
  final IconData icon;
  final Color color;
  final String title;
  final String subtitle;

  UserInfoItem({
    required this.icon,
    required this.color,
    required this.title,
    required this.subtitle,
  });
}

class ListViewDemo extends StatelessWidget {
  ListViewDemo({super.key});

  final List<UserInfoItem> items = [
    UserInfoItem(
      icon: Icons.person,
      color: Colors.blue,
      title: "Nguyễn Huỳnh Phúc Hậu",
      subtitle: "Sinh viên lớp CMP177",
    ),
    UserInfoItem(
      icon: Icons.phone,
      color: Colors.green,
      title: "Điện thoại",
      subtitle: "0901 234 567",
    ),
    UserInfoItem(
      icon: Icons.email,
      color: Colors.redAccent,
      title: "Email",
      subtitle: "sinhvien@gmail.com",
    ),
    UserInfoItem(
      icon: Icons.school,
      color: Colors.orange,
      title: "Khoa đào tạo",
      subtitle: "Khoa Công nghệ thông tin",
    ),
    UserInfoItem(
      icon: Icons.location_on,
      color: Colors.purple,
      title: "Địa chỉ",
      subtitle: "TP. Hồ Chí Minh",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin sinh viên')),
      body: ListView.builder(
        padding: const EdgeInsets.all(15.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: item.color,
                child: Icon(item.icon, color: Colors.white),
              ),
              title: Text(item.title),
              subtitle: Text(item.subtitle),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}

// 1. Model class chứa thông tin 1 bài hát
class SongItem {
  final String imagePath; // Đường dẫn ảnh - bạn tự thêm ảnh vào assets/
  final String title; // Tên bài hát
  final String artist; // Tên ca sĩ
  final String genre; // Thể loại (V-Pop, Indie,...)
  final String duration; // Thời lượng (VD: "4:12")

  SongItem({
    required this.imagePath,
    required this.title,
    required this.artist,
    required this.genre,
    required this.duration,
  });
}

// 2. Màn hình danh sách bài hát
class SongListScreen extends StatelessWidget {
  SongListScreen({super.key});

  // 3. Danh sách dữ liệu - thay imagePath bằng ảnh bạn tải về
  final List<SongItem> songs = [
    SongItem(
      imagePath: 'images/st.jpg', // <-- thay tên file ảnh của bạn
      title: 'Nơi này có anh',
      artist: 'Sơn Tùng M-TP',
      genre: 'V-Pop',
      duration: '4:12',
    ),
    SongItem(
      imagePath: 'images/seetinh.jpg',
      title: 'See Tình',
      artist: 'Hoàng Thùy Linh',
      genre: 'V-Pop',
      duration: '3:45',
    ),
    SongItem(
      imagePath: 'images/st2.jpg',
      title: 'Hãy Trao Cho Anh',
      artist: 'Sơn Tùng M-TP',
      genre: 'V-Pop',
      duration: '3:38',
    ),
    SongItem(
      imagePath: 'images/vct.jpg',
      title: 'Mơ',
      artist: 'Vũ Cát Tường',
      genre: 'Indie',
      duration: '4:01',
    ),
    SongItem(
      imagePath: 'images/j97.jpg',
      title: 'Đom Đóm',
      artist: 'Jack',
      genre: 'V-Pop',
      duration: '3:22',
    ),
    SongItem(
      imagePath: 'images/j97.jpg',
      title: 'Bạc Phận',
      artist: 'Jack & K-ICM',
      genre: 'V-Pop',
      duration: '4:18',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách bài hát',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF0284C7),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          final song = songs[index];
          return _buildSongCard(song);
        },
      ),
    );
  }

  Widget _buildSongCard(SongItem song) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Ảnh thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                song.imagePath,
                width: 64,
                height: 64,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.music_note, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Thông tin bài hát
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    song.artist,
                    style: TextStyle(color: Colors.grey[600], fontSize: 13),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      // Tag thể loại
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          song.genre,
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        song.duration,
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Mũi tên
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// ==================== CHI TIẾT BÀI HÁT ====================
class SongDetailScreen extends StatelessWidget {
  const SongDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // PHẦN 1: Ảnh lớn + tên bài hát
            Stack(
              children: [
                // Ảnh bìa
                SizedBox(
                  width: double.infinity,
                  height: 280,
                  child: Image.asset(
                    'images/st.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 280,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.music_note,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Lớp tối bên dưới để chữ dễ đọc
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 100,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black87, Colors.transparent],
                      ),
                    ),
                  ),
                ),
                // Nút back
                Positioned(
                  top: 40,
                  left: 12,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                // Tên bài hát
                const Positioned(
                  bottom: 16,
                  left: 16,
                  right: 16,
                  child: Text(
                    'Nơi này có anh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // PHẦN 2: Thông tin chi tiết
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow(Icons.person_outline, 'Ca sĩ', 'Sơn Tùng M-TP'),
                  const Divider(),
                  _buildInfoRow(Icons.album_outlined, 'Album', 'Single'),
                  const Divider(),
                  _buildInfoRow(
                    Icons.access_time_outlined,
                    'Thời lượng',
                    '4:12',
                  ),
                  const Divider(),
                  _buildInfoRow(Icons.label_outline, 'Thể loại', 'V-Pop'),
                ],
              ),
            ),

            // PHẦN 3: Mô tả và nút phát nhạc
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mô tả',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      'Một bài hát nhẹ nhàng, lãng mạn với giai điệu bắt tai và lời ca sâu lắng về tình yêu.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow, color: Colors.white),
                      label: const Text(
                        'Phát nhạc',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0284C7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget tái sử dụng cho mỗi dòng thông tin
  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 26),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 12, color: Colors.grey[500]),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
