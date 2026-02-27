class ProfileModel {
  final bool? status;
  final ProfileData? data;
  final ProfileMessage? message;

  ProfileModel({this.status, this.data, this.message});

  factory ProfileModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileModel();

    return ProfileModel(
      status: json['status'] as bool?,
      data: json['data'] != null
          ? ProfileData.fromJson(json['data'] as Map<String, dynamic>?)
          : null,
      message: json['message'] != null
          ? ProfileMessage.fromJson(json['message'] as Map<String, dynamic>?)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data?.toJson(),
      'message': message?.toJson(),
    };
  }
}

class ProfileData {
  final int? id;
  final String? name;
  final String? countryCode;
  final String? mobile;
  final String? image;
  final String? facebookUrl;
  final String? instagramUrl;
  final String? twitterUrl;
  final String? whatsappUrl;
  final bool? hasBasketOrders;

  ProfileData({
    this.id,
    this.name,
    this.countryCode,
    this.mobile,
    this.image,
    this.facebookUrl,
    this.instagramUrl,
    this.twitterUrl,
    this.whatsappUrl,
    this.hasBasketOrders,
  });

  factory ProfileData.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileData();

    return ProfileData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      countryCode: json['country_code'] as String?,
      mobile: json['mobile'] as String?,
      image: json['image'] as String?,
      facebookUrl: json['facebook_url'] as String?,
      instagramUrl: json['instagram_url'] as String?,
      twitterUrl: json['twitter_url'] as String?,
      whatsappUrl: json['whatsapp_url'] as String?,
      hasBasketOrders: json['has_basket_orders'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_code': countryCode,
      'mobile': mobile,
      'image': image,
    };
  }
}

class ProfileMessage {
  final List<String>? messageEn;
  final List<String>? messageFr;
  final List<String>? messageAr;

  ProfileMessage({this.messageEn, this.messageFr, this.messageAr});

  factory ProfileMessage.fromJson(Map<String, dynamic>? json) {
    if (json == null) return ProfileMessage();

    return ProfileMessage(
      messageEn: (json['message_en'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
      messageFr: (json['message_fr'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
      messageAr: (json['message_ar'] as List?)
          ?.map((e) => e?.toString() ?? '')
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message_en': messageEn,
      'message_fr': messageFr,
      'message_ar': messageAr,
    };
  }
}
