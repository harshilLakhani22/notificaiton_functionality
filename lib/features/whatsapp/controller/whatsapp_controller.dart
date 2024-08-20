import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notification_functionality/features/dashboard/models/text_notification_model.dart';
import 'package:notification_functionality/features/whatsapp/models/whatsapp_notification_model.dart';

class WhatsappController extends GetxController {
  final RxList<WhatsappNotificationModel> whatsappNotifications = <WhatsappNotificationModel>[].obs;
  final GetStorage storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _loadStoredNotifications();
  }

  void _loadStoredNotifications() {
    List<dynamic> storedNotifications = storage.read<List<dynamic>>('whatsappNotifications') ?? [];
    whatsappNotifications.value = storedNotifications
        .map((notification) => WhatsappNotificationModel.fromJson(notification))
        .toList();
  }

  void filterWhatsappNotifications(List<TextNotificationModel> allNotifications) {
    for (var notification in allNotifications) {
      if (notification.appName == 'com.whatsapp') {
        final newNotification = WhatsappNotificationModel(
          title: notification.title,
          text: notification.text,
          timestamp: notification.timestamp,
        );

        if (!whatsappNotifications.any((n) =>
        n.title == newNotification.title &&
            n.text == newNotification.text &&
            n.timestamp == newNotification.timestamp)) {
          whatsappNotifications.add(newNotification);
          storage.write('whatsappNotifications', whatsappNotifications.map((n) => n.toJson()).toList());
        }
      }
    }
  }
}
