class NotificationModel {
  final bool status;
  final NotificationData data;
  final Message message;

  NotificationModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic>? json) {
    return NotificationModel(
      status: json?['status'] ?? false,
      data: NotificationData.fromJson(json?['data']),
      message: Message.fromJson(json?['message']),
    );
  }
}

class NotificationData {
  final List<AppNotification> notifications;

  NotificationData({required this.notifications});

  factory NotificationData.fromJson(Map<String, dynamic>? json) {
    return NotificationData(
      notifications: (json?['notifications'] as List<dynamic>?)
              ?.map((e) => AppNotification.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class AppNotification {
  final int id;
  final String titleEn;
  final String titleAr;
  final String titleFr;
  final String contentEn;
  final String contentFr;
  final String contentAr;
  final String date;
  final String time;
  final String notificationsCreatedAt;

  AppNotification({
    required this.id,
    required this.titleEn,
    required this.titleAr,
    required this.titleFr,
    required this.contentEn,
    required this.contentFr,
    required this.contentAr,
    required this.date,
    required this.time,
    required this.notificationsCreatedAt,
  });

  factory AppNotification.fromJson(Map<String, dynamic>? json) {
    return AppNotification(
      id: json?['id'] ?? 0,
      titleEn: json?['title_en'] ?? '',
      titleAr: json?['title_ar'] ?? '',
      titleFr: json?['title_fr'] ?? '',
      contentEn: json?['content_en'] ?? '',
      contentFr: json?['content_fr'] ?? '',
      contentAr: json?['content_ar'] ?? '',
      date: json?['date'] ?? '',
      time: json?['time'] ?? '',
      notificationsCreatedAt:
          json?['notifications_created_at'] ?? '',
    );
  }
}

class Message {
  final List<String> messageEn;
  final List<String> messageFr;
  final List<String> messageAr;

  Message({
    required this.messageEn,
    required this.messageFr,
    required this.messageAr,
  });

  factory Message.fromJson(Map<String, dynamic>? json) {
    return Message(
      messageEn:
          (json?['message_en'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
      messageFr:
          (json?['message_fr'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
      messageAr:
          (json?['message_ar'] as List<dynamic>?)
                  ?.map((e) => e.toString())
                  .toList() ??
              [],
    );
  }
}
