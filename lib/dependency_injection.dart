import 'package:get/instance_manager.dart';
import 'package:notification_functionality/features/dashboard/controller/dashboard_controller.dart';
import 'package:notification_functionality/features/whatsapp/controller/whatsapp_controller.dart';

class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut<DashboardController>(() => DashboardController(), fenix: true);

    Get.lazyPut<WhatsappController>(() => WhatsappController(), fenix: true);
  }
}
