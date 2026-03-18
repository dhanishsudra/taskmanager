import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🎯 Day 2 Complete!\n\nClean Architecture + GetX Routing Ready',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(
              'Navigation system set up ho gaya hai.\nAb real features aane wale hain!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar(
            'Success',
            'GetX navigation & routing working perfectly!',
            snackPosition: SnackPosition.BOTTOM,
          );
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}