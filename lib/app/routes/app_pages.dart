import 'package:get/get.dart';
import 'app_routes.dart';
import '../../presentation/pages/home_page.dart';
import '../../presentation/pages/login_page.dart';
import '../../presentation/binding/auth_binding.dart';
class AppPages {

  static final pages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage(), binding: AuthBinding()),
  ];
}