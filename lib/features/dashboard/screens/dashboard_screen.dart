import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_functionality/features/dashboard/controller/dashboard_controller.dart';
import 'package:notification_functionality/utils/constants/colors.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});

  final DashboardController dashboardController =
  Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return IndexedStack(
          index: dashboardController.currIndex.value,
          children: dashboardController.screens,
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: MColors.buttonPrimary,
          unselectedItemColor: MColors.buttonSecondary,
          onTap: dashboardController.changeTabIndex,
          currentIndex: dashboardController.currIndex.value,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.message), label: 'WhatsApp'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Instagram'),
            BottomNavigationBarItem(icon: Icon(Icons.facebook), label: 'Facebook'),
          ],
        );
      }),
    );
  }
}
