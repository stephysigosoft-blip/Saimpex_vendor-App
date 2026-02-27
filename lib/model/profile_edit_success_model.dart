class ProfileEditSuccessModel {
  final bool status;
  final ProfileSuccessData? data;
  final Message? message;

  ProfileEditSuccessModel({required this.status, this.data, this.message});

  factory ProfileEditSuccessModel.fromJson(Map<String, dynamic> json) {
    return ProfileEditSuccessModel(
      status: json['status'] ?? false,
      data: json['data'] != null
          ? ProfileSuccessData.fromJson(json['data'])
          : null,
      message: json['message'] != null
          ? Message.fromJson(json['message'])
          : null,
    );
  }
}

class ProfileSuccessData {
  final User? user;

  ProfileSuccessData({this.user});

  factory ProfileSuccessData.fromJson(Map<String, dynamic> json) {
    return ProfileSuccessData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? mobile;
  final String? address;
  final int? roleId;
  final String? image;
  final String? gender;
  final String? idProofUrl;
  final String? passKey;
  final int? status;
  final String? points;
  final String? fcm;
  final int? regStatus;
  final int? phoneVerified;
  final String? preferredLocale;
  final String? createdAt;
  final String? updatedAt;

  User({
    this.id,
    this.name,
    this.email,
    this.username,
    this.mobile,
    this.address,
    this.roleId,
    this.image,
    this.gender,
    this.idProofUrl,
    this.passKey,
    this.status,
    this.points,
    this.fcm,
    this.regStatus,
    this.phoneVerified,
    this.preferredLocale,
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'] ?? '',
      email: json['email'],
      username: json['username'],
      mobile: json['mobile'] ?? '',
      address: json['address'],
      roleId: json['role_id'],
      image: json['image'],
      gender: json['gender'],
      idProofUrl: json['id_proof_url'],
      passKey: json['pass_key'],
      status: json['status'],
      points: json['points'] ?? '0.00',
      fcm: json['fcm'],
      regStatus: json['reg_status'],
      phoneVerified: json['phone_verified'],
      preferredLocale: json['preffered_locale'] ?? 'en',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Message {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  Message({this.messageEn, this.messageFr, this.messageAr});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      messageEn: (json['message_en'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      messageFr: (json['message_fr'] as List?)
          ?.map((e) => e.toString())
          .toList(),
      messageAr: (json['message_ar'] as List?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }
}
