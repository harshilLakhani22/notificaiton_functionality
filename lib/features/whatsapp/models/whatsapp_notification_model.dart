import 'dart:convert';

class WhatsappNotificationModel {
  final String title;
  final String text;
  final DateTime timestamp;

  WhatsappNotificationModel({
    required this.title,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory WhatsappNotificationModel.fromJson(Map<String, dynamic> json) {
    return WhatsappNotificationModel(
      title: json['title'],
      text: json['text'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
