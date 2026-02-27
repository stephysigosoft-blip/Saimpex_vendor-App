class AboutUsModel {
  bool? status;
  AboutData? data;
  String? message;

  AboutUsModel({
    this.status,
    this.data,
    this.message,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic>? json) {
    return AboutUsModel(
      status: json?["status"] as bool?,
      data: json?["data"] != null
          ? AboutData.fromJson(json?["data"])
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

class AboutData {
  AboutContent? about;

  AboutData({this.about});

  factory AboutData.fromJson(Map<String, dynamic>? json) {
    return AboutData(
      about: json?["about"] != null
          ? AboutContent.fromJson(json?["about"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "about": about?.toJson() ?? {},
    };
  }
}

class AboutContent {
  String? titleEn;
  String? titleAr;
  String? titleFr;
  String? contentEn;
  String? contentAr;
  String? contentFr;

  AboutContent({
    this.titleEn,
    this.titleAr,
    this.titleFr,
    this.contentEn,
    this.contentAr,
    this.contentFr,
  });

  factory AboutContent.fromJson(Map<String, dynamic>? json) {
    return AboutContent(
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
