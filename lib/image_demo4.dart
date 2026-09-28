import 'package:flutter/material.dart';

class ImageDemo4 extends StatelessWidget {
  const ImageDemo4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 400,
          height: 400,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(48)),
            border: Border.all(color: Colors.blue, width: 1),
            image: const DecorationImage(
              image: AssetImage("images/1_1.jpg"),
              fit: BoxFit.cover, // Bo góc và viền ôm sát hình ảnh
            ),
          ),
        ),
      ),
    );
  }
}
