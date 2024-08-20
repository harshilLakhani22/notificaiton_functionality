import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification_functionality/features/whatsapp/controller/whatsapp_controller.dart';
import 'package:notification_functionality/features/whatsapp/widgets/whatsapp_user_tile.dart';

class WhatsappScreen extends StatelessWidget {
  WhatsappScreen({super.key});

  final WhatsappController whatsappController = Get.find<WhatsappController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp Notifications'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: whatsappController.whatsappNotifications.length,
          itemBuilder: (context, index) {
            final notification = whatsappController.whatsappNotifications[index];
            return WhatsappUserTile(notification: notification);
          },
        );
      }),
    );
  }
}
