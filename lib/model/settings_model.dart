class SettingsModel {
  bool? status;
  SettingsData? data;
  String? message;

  SettingsModel({
    this.status,
    this.data,
    this.message,
  });

  factory SettingsModel.fromJson(Map<String, dynamic>? json) {
    return SettingsModel(
      status: json?["status"] as bool?,
      data: json?["data"] != null ? SettingsData.fromJson(json?["data"]) : null,
      message: json?["message"]?.toString(),
    );
  }
}

// ---------------- DATA -------------------

class SettingsData {
  List<SettingItem>? settings;

  SettingsData({this.settings});

  factory SettingsData.fromJson(Map<String, dynamic>? json) {
    return SettingsData(
      settings: (json?["settings"] as List<dynamic>?)
          ?.map((e) => SettingItem.fromJson(e))
          .toList() ??
          [],
    );
  }
}

// ---------------- SETTINGS ITEM -------------------

class SettingItem {
  int? id;
  int? deliveryRange;
  String? facebook;
  String? twitter;
  String? instagram;
  int? autoApproval;
  int? maintenanceAndroid;
  int? maintenanceIos;
  int? maintenanceAndroidDelivery;
  String? maintenanceReasonAndroid;
  String? maintenanceReasonIos;
  String? maintenanceReasonAndroidDelivery;
  String? appStoreLink;
  String? playStoreLink;
  String? playStoreLinkDelivery;
  String? appStoreVersion;
  String? playStoreVersion;
  String? playStoreVersionDelivery;
  int? appStoreUpdate;
  int? playStoreUpdate;
  int? playStoreUpdateDelivery;
  String? createdAt;
  String? updatedAt;

  SettingItem({
    this.id,
    this.deliveryRange,
    this.facebook,
    this.twitter,
    this.instagram,
    this.autoApproval,
    this.maintenanceAndroid,
    this.maintenanceIos,
    this.maintenanceAndroidDelivery,
    this.maintenanceReasonAndroid,
    this.maintenanceReasonIos,
    this.maintenanceReasonAndroidDelivery,
    this.appStoreLink,
    this.playStoreLink,
    this.playStoreLinkDelivery,
    this.appStoreVersion,
    this.playStoreVersion,
    this.playStoreVersionDelivery,
    this.appStoreUpdate,
    this.playStoreUpdate,
    this.playStoreUpdateDelivery,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingItem.fromJson(Map<String, dynamic>? json) {
    return SettingItem(
      id: json?["id"] as int?,
      deliveryRange: json?["delivery_range"] as int?,
      facebook: json?["facebook"]?.toString(),
      twitter: json?["twitter"]?.toString(),
      instagram: json?["instagram"]?.toString(),
      autoApproval: json?["auto_approval"] as int?,
      maintenanceAndroid: json?["maintenance_android"] as int?,
      maintenanceIos: json?["maintenance_ios"] as int?,
      maintenanceAndroidDelivery: json?["maintenance_android_delivery"] as int?,
      maintenanceReasonAndroid: json?["maintenance_reason_android"]?.toString(),
      maintenanceReasonIos: json?["maintenance_reason_ios"]?.toString(),
      maintenanceReasonAndroidDelivery:
      json?["maintenance_reason_android_delivery"]?.toString(),
      appStoreLink: json?["app_store_link"]?.toString(),
      playStoreLink: json?["play_store_link"]?.toString(),
      playStoreLinkDelivery: json?["play_store_link_delivery"]?.toString(),
      appStoreVersion: json?["app_store_version"]?.toString(),
      playStoreVersion: json?["play_store_version"]?.toString(),
      playStoreVersionDelivery:
      json?["play_store_version_delivery"]?.toString(),
      appStoreUpdate: json?["app_store_update"] as int?,
      playStoreUpdate: json?["play_store_update"] as int?,
      playStoreUpdateDelivery:
      json?["play_store_update_delivery"] as int?,
      createdAt: json?["created_at"]?.toString(),
      updatedAt: json?["updated_at"]?.toString(),
    );
  }
}
