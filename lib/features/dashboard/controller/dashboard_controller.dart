import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_notification_listener/flutter_notification_listener.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notification_functionality/features/facebook/screens/facebook_screen.dart';
import 'package:notification_functionality/features/dashboard/models/text_notification_model.dart';
import 'package:notification_functionality/features/instagram/screens/instagram_screen.dart';
import 'package:notification_functionality/features/whatsapp/controller/whatsapp_controller.dart';
import 'package:notification_functionality/features/whatsapp/screens/whatsapp_screen.dart';
import 'package:permission_handler/permission_handler.dart';

class DashboardController extends GetxController {
  RxInt currIndex = 0.obs;

  void changeTabIndex(int index) {
    currIndex.value = index;
  }

  final screens = [
    WhatsappScreen(),
    InstagramScreen(),
    FacebookScreen(),
  ];

  /// HomeScreen Controller
  final RxList<TextNotificationModel> notifications = <TextNotificationModel>[].obs;
  final RxBool isListening = false.obs;

  // List of allowed package names
  final List<String> allowedApps = [
    'com.whatsapp',
    'com.instagram.android',
    'com.facebook.orca' // Facebook Messenger
  ];

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void _initialize() {
    _checkPermissions();
  }

  void _checkPermissions() async {
    var status = await Permission.notification.status;
    if (status.isGranted) {
      _checkNotificationListenerPermission();
    } else {
      _requestPermissions();
    }
  }

  void _requestPermissions() async {
    var status = await Permission.notification.request();
    if (status.isGranted) {
      _checkNotificationListenerPermission();
    } else {
      print('Notification permission denied');
      _requestNotificationAccess();
    }
  }

  void _requestNotificationAccess() async {
    bool? hasNotificationAccess = await NotificationsListener.hasPermission;
    if (hasNotificationAccess == false) {
      NotificationsListener.openPermissionSettings();
    }
  }

  Future<void> _checkNotificationListenerPermission() async {
    bool? hasNotificationAccess = await NotificationsListener.hasPermission;
    if (hasNotificationAccess == false) {
      NotificationsListener.openPermissionSettings();
    } else {
      _startListening();
    }
  }

  void startListening() {
    _startListening();
  }

  void _startListening() async {
    if (isListening.value) return;

    // Register a receive port for background events
    ReceivePort receivePort = ReceivePort();
    IsolateNameServer.removePortNameMapping("_listener_");
    IsolateNameServer.registerPortWithName(receivePort.sendPort, "_listener_");
    receivePort.listen((message) => _onNotificationReceived(message));

    // Initialize the listener
    NotificationsListener.initialize(callbackHandle: _callback);

    // Check if the service is already running
    bool isRunning = (await NotificationsListener.isRunning) ?? false;
    if (!isRunning) {
      await NotificationsListener.startService(
        foreground: true,
        title: "Notification Listener",
        description: "Listening for notifications",
      );
    }

    isListening.value = true;
  }

  void _onNotificationReceived(NotificationEvent event) {
    if (allowedApps.contains(event.packageName)) {
      final newNotification = TextNotificationModel(
        title: event.title ?? "No Title",
        text: event.text ?? "No Text",
        appName: event.packageName ?? "Unknown App",
        timestamp: DateTime.now(),
      );

      if (!notifications.any((n) =>
      n.title == newNotification.title &&
          n.text == newNotification.text &&
          n.appName == newNotification.appName)) {
        notifications.add(newNotification);

        // Save notifications in local storage
        final GetStorage storage = GetStorage();
        storage.write('allNotifications', notifications.map((n) => n.toJson()).toList());

        // Trigger filtering in WhatsappController
        final WhatsappController whatsappController = Get.find<WhatsappController>();
        whatsappController.filterWhatsappNotifications([newNotification]);
      }
    }
  }

  @pragma(
      'vm:entry-point') // prevent dart from stripping out this function on release build in Flutter 3.x
  static void _callback(NotificationEvent event) {
    final SendPort? sendPort = IsolateNameServer.lookupPortByName("_listener_");
    sendPort?.send(event);
  }

  void stopListening() async {
    if (isListening.value) {
      await NotificationsListener.stopService();
      isListening.value = false;
    }
  }
}
