import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/app/routes/app_pages.dart';
import 'package:task_manager/app/routes/app_routes.dart'; // ← ye CLI ne generate kiya hai
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
    );
  }
}
