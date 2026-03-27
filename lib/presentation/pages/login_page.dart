import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/app_routes.dart';
import 'package:task_manager/presentation/controllers/auth_controller.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TaskFlow Login'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Obx(() => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Welcome to TaskFlow', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: controller.isLoading.value ? null : () => controller.signInWithGoogle(),
              child: const Text('Continue with Google'),
            ),
            if (controller.isLoading.value) const CircularProgressIndicator(),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.toNamed(AppRoutes.home),
              child: const Text('Skip (Testing)'),
            ),
          ],
        )),
      ),
    );
  }
}
