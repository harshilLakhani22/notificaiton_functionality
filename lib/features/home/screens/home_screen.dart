import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_functionality/features/home/controllers/home_controller.dart';
import 'package:notification_functionality/features/home/widgets/text_notification_tile.dart';
import 'package:notification_functionality/utils/constants/colors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        centerTitle: true,
        // actions: [
        //   Obx(() {
        //     return IconButton(
        //       icon: Icon(homeController.isListening.value ? Icons.stop : Icons.play_arrow),
        //       onPressed: () {
        //         if (homeController.isListening.value) {
        //           homeController.stopListening();
        //         } else {
        //           homeController.startListening();
        //         }
        //       },
        //     );
        //   }),
        // ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.notifications.length,
          itemBuilder: (context, index) {
            return TextNotificationTile(notification: homeController.notifications[index]);
          },
        );
      }),
    );
  }
}
