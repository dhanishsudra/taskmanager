import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/presentation/controllers/auth_controller.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  final AuthController controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow'),
        backgroundColor: Colors.blueAccent,
      ),
      body:  Center(
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
            TextButton(onPressed: controller.logout, child: Text('Logout this email')),
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