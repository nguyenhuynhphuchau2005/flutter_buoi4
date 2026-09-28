import 'package:flutter/material.dart';

class ImageAvt extends StatelessWidget {
  const ImageAvt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Hình Tròn'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: imageAvt(),
      ),
    );
  }

  // Hàm imageAvt() để tạo ảnh Avatar hình tròn
  Widget imageAvt() {
    return Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
        shape: BoxShape.circle, // Tạo khung hình tròn
        border: Border.all(color: Colors.blue, width: 3), // Viền viền ngoài
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        image: const DecorationImage(
          image: AssetImage('images/1_1.jpg'), // Ảnh trong thư mục images
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
