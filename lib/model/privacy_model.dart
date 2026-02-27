class PrivacyModel {
  bool? status;
  PrivacyData? data;
  String? message;

  PrivacyModel({
    this.status,
    this.data,
    this.message,
  });

  factory PrivacyModel.fromJson(Map<String, dynamic>? json) {
    return PrivacyModel(
      status: json?["status"] as bool?,
      data: json?["data"] != null
          ? PrivacyData.fromJson(json?["data"])
          : null,
      message: json?["message"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "status": status ?? false,
      "data": data?.toJson() ?? {},
      "message": message ?? "",
    };
  }
}

class PrivacyData {
  PrivacyContent? privacyPolicy;

  PrivacyData({this.privacyPolicy});

  factory PrivacyData.fromJson(Map<String, dynamic>? json) {
    return PrivacyData(
      privacyPolicy: json?["privacy_policy"] != null
          ? PrivacyContent.fromJson(json?["privacy_policy"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "privacy_policy": privacyPolicy?.toJson() ?? {},
    };
  }
}

class PrivacyContent {
  String? titleEn;
  String? titleAr;
  String? titleFr;
  String? contentEn;
  String? contentAr;
  String? contentFr;

  PrivacyContent({
    this.titleEn,
    this.titleAr,
    this.titleFr,
    this.contentEn,
    this.contentAr,
    this.contentFr,
  });

  factory PrivacyContent.fromJson(Map<String, dynamic>? json) {
    return PrivacyContent(
      titleEn: json?["title_en"]?.toString(),
      titleAr: json?["title_ar"]?.toString(),
      titleFr: json?["title_fr"]?.toString(),
      contentEn: json?["content_en"]?.toString(),
      contentAr: json?["content_ar"]?.toString(),
      contentFr: json?["content_fr"]?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title_en": titleEn ?? "",
      "title_ar": titleAr ?? "",
      "title_fr": titleFr ?? "",
      "content_en": contentEn ?? "",
      "content_ar": contentAr ?? "",
      "content_fr": contentFr ?? "",
    };
  }
}
