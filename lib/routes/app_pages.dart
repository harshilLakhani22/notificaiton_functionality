import 'package:get/get.dart';
import 'package:notification_functionality/features/home/screens/home_screen.dart';
import 'package:notification_functionality/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pageList = [
    GetPage(
      name: AppRoutes.homePage,
      page: HomeScreen.new,
    ),
  ];
}
