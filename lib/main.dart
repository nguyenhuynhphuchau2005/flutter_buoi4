import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_buoi4/Buoi6.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bài tập buổi 6',
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
      // home: SongDetailScreen(),
      // home: ListViewDemoAPI(),
      home: Buoi6Screen(),
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

class UserModel {
  final int id;
  final String name;
  final String email;
  final String phone;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }
}

Future<List<UserModel>> fetchUsers() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body) as List<dynamic>;
    return data
        .map((item) => UserModel.fromJson(item as Map<String, dynamic>))
        .toList();
  } else {
    throw Exception('Lỗi khi gọi API: Mã lỗi ${response.statusCode}');
  }
}

class ListViewDemoAPI extends StatelessWidget {
  const ListViewDemoAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserModel>>(
      future: fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Đang kết nối API và lấy dữ liệu..."),
              ],
            ),
          );
        }

        if (snapshot.hasError) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Đã xảy ra lỗi: ${snapshot.error}",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          );
        }

        if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          final users = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return _buildUserCard(context, user);
            },
          );
        }

        // Trạng thái rỗng
        return const Center(child: Text("Không tìm thấy dữ liệu nào!"));
      },
    );
  }
}

Widget _buildUserCard(BuildContext context, UserModel user) {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
    elevation: 4,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[user.id % Colors.primaries.length],
        child: Text(
          user.name.isNotEmpty ? user.name[0] : '?',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        user.name,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.email, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  user.email,
                  style: const TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          Row(
            children: [
              const Icon(Icons.phone, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Expanded(
                child: Text(
                  user.phone,
                  style: const TextStyle(fontSize: 13),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Đã chọn: ${user.name}")));
      },
    ),
  );
}
