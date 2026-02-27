// verify_otp_model.dart

class VerifyOtpModel {
  final bool? status;
  final VerifyOtpData? data;
  final VerifyOtpMessage? message;

  VerifyOtpModel({
    this.status,
    this.data,
    this.message,
  });

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpModel(
      status: json['status'] as bool?,
      data: json['data'] != null
          ? VerifyOtpData.fromJson(json['data'])
          : null,
      message: json['message'] != null
          ? VerifyOtpMessage.fromJson(json['message'])
          : null,
    );
  }
}

class VerifyOtpData {
  final bool? isNewUser;
  final String? token;
  final VerifyOtpUser? user;

  VerifyOtpData({
    this.isNewUser,
    this.token,
    this.user,
  });

  factory VerifyOtpData.fromJson(Map<String, dynamic> json) {
    return VerifyOtpData(
      isNewUser: json['is_new_user'] as bool?,
      token: json['token'] as String?,
      user: json['user'] != null
          ? VerifyOtpUser.fromJson(json['user'])
          : null,
    );
  }
}

class VerifyOtpUser {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? emailVerifiedAt;
  final int? countryCodeId;
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
  final String? prefferedLocale;
  final int? addedBy;
  final int? updatedBy;
  final String? deletedAt;
  final String? createdAt;
  final String? updatedAt;

  VerifyOtpUser({
    this.id,
    this.name,
    this.email,
    this.username,
    this.emailVerifiedAt,
    this.countryCodeId,
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
    this.prefferedLocale,
    this.addedBy,
    this.updatedBy,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory VerifyOtpUser.fromJson(Map<String, dynamic> json) {
    return VerifyOtpUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      username: json['username'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      countryCodeId: json['country_code_id'] as int?,
      mobile: json['mobile'] as String?,
      address: json['address'] as String?,
      roleId: json['role_id'] as int?,
      image: json['image'] as String?,
      gender: json['gender'] as String?,
      idProofUrl: json['id_proof_url'] as String?,
      passKey: json['pass_key'] as String?,
      status: json['status'] as int?,
      points: json['points'] as String?,
      fcm: json['fcm'] as String?,
      regStatus: json['reg_status'] as int?,
      phoneVerified: json['phone_verified'] as int?,
      prefferedLocale: json['preffered_locale'] as String?,
      addedBy: json['added_by'] as int?,
      updatedBy: json['updated_by'] as int?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );
  }
}

class VerifyOtpMessage {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  VerifyOtpMessage({
    this.messageEn,
    this.messageFr,
    this.messageAr,
  });

  factory VerifyOtpMessage.fromJson(Map<String, dynamic> json) {
    return VerifyOtpMessage(
      messageEn: json['message_en'] != null
          ? List<String>.from(json['message_en'])
          : null,
      messageFr: json['message_fr'] != null
          ? List<String>.from(json['message_fr'])
          : null,
      messageAr: json['message_ar'] != null
          ? List<String>.from(json['message_ar'])
          : null,
    );
  }
}
