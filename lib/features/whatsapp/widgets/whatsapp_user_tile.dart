import 'package:flutter/material.dart';
import 'package:notification_functionality/features/whatsapp/models/whatsapp_notification_model.dart';
import 'package:intl/intl.dart';  // Add this for proper date formatting

class WhatsappUserTile extends StatelessWidget {
  final WhatsappNotificationModel notification;

  const WhatsappUserTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(notification.title),
        subtitle: Text(notification.text),
        trailing: Text(DateFormat('dd/MM/yyyy HH:mm').format(
            notification.timestamp.toLocal())), // Format timestamp
      ),
    );
  }
}
