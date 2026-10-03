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
      //home: const ProfileScreen(),
      //home: Buoi5Screen(),
      //home: Buoi4Card(),
      // home: CardDemov2(),
      // home: ListTileDemo(),
      home: GridViewDemo(),
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
