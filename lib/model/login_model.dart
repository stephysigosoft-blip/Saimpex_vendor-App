class LoginModel {
  final bool status;
  final List<dynamic> data;
  final LoginMessage message;

  LoginModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    json ??= {};

    return LoginModel(
      status: json['status'] as bool? ?? false,
      data: (json['data'] as List?) ?? [],
      message: LoginMessage.fromJson(json['message'] as Map<String, dynamic>?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status,
      "data": data,
      "message": message.toJson(),
    };
  }
}

class LoginMessage {
  final List<String> messageEn;
  final List<String> messageFr;
  final List<String> messageAr;

  LoginMessage({
    required this.messageEn,
    required this.messageFr,
    required this.messageAr,
  });

  factory LoginMessage.fromJson(Map<String, dynamic>? json) {
    json ??= {};

    return LoginMessage(
      messageEn: _toStringList(json['message_en']),
      messageFr: _toStringList(json['message_fr']),
      messageAr: _toStringList(json['message_ar']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "message_en": messageEn,
      "message_fr": messageFr,
      "message_ar": messageAr,
    };
  }

  /// Safely converts dynamic list → List<String>
  static List<String> _toStringList(dynamic value) {
    if (value is List) {
      return value.map((e) => e?.toString() ?? "").toList();
    }
    return [];
  }
}
