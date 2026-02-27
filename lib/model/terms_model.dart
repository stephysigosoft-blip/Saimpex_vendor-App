class TermsModel {
  bool? status;
  TermsData? data;
  String? message;

  TermsModel({
    this.status,
    this.data,
    this.message,
  });

  factory TermsModel.fromJson(Map<String, dynamic>? json) {
    return TermsModel(
      status: json?["status"] as bool?,
      data: json?["data"] != null
          ? TermsData.fromJson(json?["data"])
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

class TermsData {

  TermsContent? terms;

  TermsData({this.terms});

  factory TermsData.fromJson(Map<String, dynamic>? json) {
    return TermsData(
      terms: json?["terms"] != null
          ? TermsContent.fromJson(json?["terms"])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "terms": terms?.toJson() ?? {},
    };
  }
}

class TermsContent {
  String? titleEn;
  String? titleAr;
  String? titleFr;
  String? contentEn;
  String? contentAr;
  String? contentFr;

  TermsContent({
    this.titleEn,
    this.titleAr,
    this.titleFr,
    this.contentEn,
    this.contentAr,
    this.contentFr,
  });

  factory TermsContent.fromJson(Map<String, dynamic>? json) {
    return TermsContent(
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
