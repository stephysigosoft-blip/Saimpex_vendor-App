class LoginModel {
  final bool? status;
  final LoginData? data;
  final LoginMessage? message;

  LoginModel({
    this.status,
    this.data,
    this.message,
  });

  factory LoginModel.fromJson(Map<String, dynamic>? json) {
    return LoginModel(
      status: json?['status']?.toString() == 'true',
      data: json?['data'] != null
          ? LoginData.fromJson(json?['data'])
          : null,
      message: json?['message'] != null
          ? LoginMessage.fromJson(json?['message'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status ?? false,
      'data': data?.toJson(),
      'message': message?.toJson(),
    };
  }
}

class LoginData {
  final LoginDetails? details;

  LoginData({this.details});

  factory LoginData.fromJson(Map<String, dynamic>? json) {
    return LoginData(
      details: json?['details'] != null
          ? LoginDetails.fromJson(json?['details'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'details': details?.toJson(),
    };
  }
}

class LoginDetails {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final int? roleId;
  final int? status;
  final String? token;
  final int? vendorType;
  final int? vendorId;

  LoginDetails({
    this.id,
    this.name,
    this.email,
    this.username,
    this.roleId,
    this.status,
    this.token,
    this.vendorType,
    this.vendorId,
  });

  factory LoginDetails.fromJson(Map<String, dynamic>? json) {
    return LoginDetails(
      id: json?['id'] ?? 0,
      name: json?['name'] ?? '',
      email: json?['email'] ?? '',
      username: json?['username'] ?? '',
      roleId: json?['role_id'] ?? 0,
      status: json?['status'] ?? 0,
      token: json?['token'] ?? '',
      vendorType: json?['vendor_type'] ?? 0,
      vendorId: json?['vendor_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? 0,
      'name': name ?? '',
      'email': email ?? '',
      'username': username ?? '',
      'role_id': roleId ?? 0,
      'status': status ?? 0,
      'token': token ?? '',
      'vendor_type': vendorType ?? 0,
      'vendor_id': vendorId ?? 0,
    };
  }
}

class LoginMessage {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  LoginMessage({
    this.messageEn,
    this.messageFr,
    this.messageAr,
  });

  factory LoginMessage.fromJson(Map<String, dynamic>? json) {
    return LoginMessage(
      messageEn: (json?['message_en'] as List?)
              ?.map((e) => e?.toString() ?? '')
              .toList() ??
          [],
      messageFr: (json?['message_fr'] as List?)
              ?.map((e) => e?.toString() ?? '')
              .toList() ??
          [],
      messageAr: (json?['message_ar'] as List?)
              ?.map((e) => e?.toString() ?? '')
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_en': messageEn ?? [],
      'message_fr': messageFr ?? [],
      'message_ar': messageAr ?? [],
    };
  }
}