import 'package:get/get.dart';
import 'app_routes.dart';
import '../../presentation/pages/home_page.dart';

class AppPages {

  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.home, page: () => HomePage()),
  ];
}