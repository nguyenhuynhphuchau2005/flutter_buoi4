import 'package:flutter/material.dart';

class NoticeExample extends StatelessWidget {
  const NoticeExample({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Chuông thông báo
            Icon(Icons.notifications, size: 80, color: Colors.blue),
            // Badge số lượng thông báo
            Positioned(
              top: 8,
              right: 6,
              child: Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Center(
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
