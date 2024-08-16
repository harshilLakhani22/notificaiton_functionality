import 'package:get/instance_manager.dart';
import 'package:notification_functionality/features/dashboard/controllers/dashboard_controller.dart';
import 'package:notification_functionality/features/home/controllers/home_controller.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);
  }
}
