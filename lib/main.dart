import 'package:flutter/material.dart';
import 'package:notification_functionality/app.dart';
import 'package:notification_functionality/dependency_injection.dart';
import 'package:permission_handler/permission_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.notification.request();

  await DependencyInjection.init();

  runApp(const App());
}
