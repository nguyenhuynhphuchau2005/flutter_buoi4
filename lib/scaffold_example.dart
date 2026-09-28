import 'package:flutter/material.dart';

class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Bar",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 203, 183, 238),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.5,
                color: const Color.fromARGB(255, 184, 157, 232),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 184, 157, 232),
                  size: 32,
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 184, 157, 232),
                  size: 32,
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.star,
                  color: Color.fromARGB(255, 184, 157, 232),
                  size: 32,
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.settings,
                  color: Color.fromARGB(255, 184, 157, 232),
                  size: 32,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
