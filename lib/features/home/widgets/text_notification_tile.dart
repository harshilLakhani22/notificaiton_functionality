import 'package:flutter/material.dart';
import 'package:notification_functionality/features/home/models/text_notification_model.dart';

class TextNotificationTile extends StatelessWidget {
  final TextNotificationModel notification;

  const TextNotificationTile({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notification.title),
      subtitle: Text(notification.text),
      trailing: Text(notification.appName.split(".")[1].toString()),
      isThreeLine: true,
    );
  }
}
