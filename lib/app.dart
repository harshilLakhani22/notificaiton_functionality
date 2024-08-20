
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_functionality/features/dashboard/screens/dashboard_screen.dart';
import 'package:notification_functionality/routes/app_pages.dart';
import 'package:notification_functionality/routes/app_routes.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DashboardScreen(),
      initialRoute: AppRoutes.dashboardPage,
      getPages: AppPages.pageList,
    );
  }
}
