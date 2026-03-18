import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/app_pages.dart';
import 'package:task_manager/app/routes/app_routes.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Task Flow',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),

    );
  }
}


