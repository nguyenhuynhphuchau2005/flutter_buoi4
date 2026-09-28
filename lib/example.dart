import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Dòng 1 (Header): Gồm 3 cột (Cột 2 flex: 2 to hơn cột 1 và 3 flex: 1)
            // Trong mỗi cột gồm 2 mục (Column): Icon và Số thứ tự/tên cột
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.blue[50],
              child: Row(
                children: [
                  // Cột 1
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.home, color: Colors.blue, size: 28),
                        SizedBox(height: 4),
                        Text(
                          'Cột 1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  // Cột 2 (Cột giữa to hơn cột 1 và cột 3)
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.star, color: Colors.amber, size: 36),
                        SizedBox(height: 4),
                        Text(
                          'Cột 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Cột 3
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.person, color: Colors.blue, size: 28),
                        SizedBox(height: 4),
                        Text(
                          'Cột 3',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Dòng 2 (Body): Nền màu vàng nhạt, có Icon ở chính giữa body
            Expanded(
              child: Container(
                color: Colors.yellow[100], // Nền vàng nhạt
                child: const Center(
                  child: Icon(
                    Icons.favorite,
                    size: 90,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ),

            // Dòng 3 (Footer): Gồm 2 cột chia đều nhau
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[200],
              child: Row(
                children: const [
                  Expanded(
                    child: Text(
                      'Cột 1: Xin Chào',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Cột 2: Flutter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
