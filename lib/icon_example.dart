import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  const IconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Dòng 1: góc trái trên cùng
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Icon(Icons.star, size: 48, color: Colors.amber)],
          ),

          // Dòng 2: giữa màn hình
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.favorite, size: 48, color: Colors.redAccent),
              SizedBox(width: 24),
              Icon(Icons.favorite, size: 48, color: Colors.redAccent),
            ],
          ),

          // Dòng 3: góc trái dưới cùng
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Icon(Icons.star, size: 48, color: Colors.amber)],
          ),
        ],
      ),
    );
  }
}
