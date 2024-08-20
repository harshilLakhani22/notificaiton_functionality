class TextNotificationModel {
  final String title;
  final String text;
  final String appName;
  final DateTime timestamp;

  TextNotificationModel({
    required this.title,
    required this.text,
    required this.appName,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
      'appName': appName,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory TextNotificationModel.fromJson(Map<String, dynamic> json) {
    return TextNotificationModel(
      title: json['title'],
      text: json['text'],
      appName: json['appName'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}
