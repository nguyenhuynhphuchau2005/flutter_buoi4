import 'package:flutter/material.dart';

class Buoi5Screen extends StatelessWidget {
  const Buoi5Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buổi 5')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            20,
            (index) => Container(
              height: 100,
              margin: const EdgeInsets.all(10),
              color: Colors.blue[(index % 9 + 1) * 100],
              child: Center(
                child: Text(
                  'Item $index',
                  style: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
