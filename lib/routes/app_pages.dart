import 'package:get/get.dart';
import 'package:notification_functionality/features/dashboard/screens/dashboard_screen.dart';
import 'package:notification_functionality/features/instagram/screens/instagram_screen.dart';
import 'package:notification_functionality/features/whatsapp/screens/whatsapp_screen.dart';
import 'package:notification_functionality/routes/app_routes.dart';

class AppPages {
  static List<GetPage> pageList = [
    GetPage(
      name: AppRoutes.dashboardPage,
      page: DashboardScreen.new,
    ),
    GetPage(
      name: AppRoutes.whatsappPage,
      page: WhatsappScreen.new,
    ),
    GetPage(
      name: AppRoutes.instagramPage,
      page: InstagramScreen.new,
    ),

  ];
}
