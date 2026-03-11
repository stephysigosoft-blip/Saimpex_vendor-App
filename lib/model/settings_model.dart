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
  int? maintenanceAndroidVendor;
  int? maintenanceIosVendor;
  String? maintenanceReasonAndroid;
  String? maintenanceReasonIos;
  String? maintenanceReasonAndroidDelivery;
  String? maintenanceReasonAndroidVendor;
  String? maintenanceReasonIosVendor;
  String? appStoreLink;
  String? appStoreLinkVendor;
  String? playStoreLink;
  String? playStoreLinkDelivery;
  String? playStoreLinkVendor;
  String? appStoreVersion;
  String? appStoreVersionVendor;
  String? playStoreVersion;
  String? playStoreVersionDelivery;
  String? playStoreVersionVendor;
  int? appStoreUpdate;
  int? appStoreUpdateVendor;
  int? playStoreUpdate;
  int? playStoreUpdateDelivery;
  int? playStoreUpdateVendor;
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
    this.maintenanceAndroidVendor,
    this.maintenanceIosVendor,
    this.maintenanceReasonAndroid,
    this.maintenanceReasonIos,
    this.maintenanceReasonAndroidDelivery,
    this.maintenanceReasonAndroidVendor,
    this.maintenanceReasonIosVendor,
    this.appStoreLink,
    this.appStoreLinkVendor,
    this.playStoreLink,
    this.playStoreLinkDelivery,
    this.playStoreLinkVendor,
    this.appStoreVersion,
    this.appStoreVersionVendor,
    this.playStoreVersion,
    this.playStoreVersionDelivery,
    this.playStoreVersionVendor,
    this.appStoreUpdate,
    this.appStoreUpdateVendor,
    this.playStoreUpdate,
    this.playStoreUpdateDelivery,
    this.playStoreUpdateVendor,
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
      maintenanceAndroidVendor: json?["maintenance_android_vendor"] as int?,
      maintenanceIosVendor: json?["maintenance_ios_vendor"] as int?,
      maintenanceReasonAndroid: json?["maintenance_reason_android"]?.toString(),
      maintenanceReasonIos: json?["maintenance_reason_ios"]?.toString(),
      maintenanceReasonAndroidDelivery:
          json?["maintenance_reason_android_delivery"]?.toString(),
      maintenanceReasonAndroidVendor:
          json?["maintenance_reason_android_vendor"]?.toString(),
      maintenanceReasonIosVendor:
          json?["maintenance_reason_ios_vendor"]?.toString(),
      appStoreLink: json?["app_store_link"]?.toString(),
      appStoreLinkVendor: json?["app_store_link_vendor"]?.toString(),
      playStoreLink: json?["play_store_link"]?.toString(),
      playStoreLinkDelivery: json?["play_store_link_delivery"]?.toString(),
      playStoreLinkVendor: json?["play_store_link_vendor"]?.toString(),
      appStoreVersion: json?["app_store_version"]?.toString(),
      appStoreVersionVendor: json?["app_store_version_vendor"]?.toString(),
      playStoreVersion: json?["play_store_version"]?.toString(),
      playStoreVersionDelivery:
          json?["play_store_version_delivery"]?.toString(),
      playStoreVersionVendor: json?["play_store_version_vendor"]?.toString(),
      appStoreUpdate: json?["app_store_update"] as int?,
      appStoreUpdateVendor: json?["app_store_update_vendor"] as int?,
      playStoreUpdate: json?["play_store_update"] as int?,
      playStoreUpdateDelivery: json?["play_store_update_delivery"] as int?,
      playStoreUpdateVendor: json?["play_store_update_vendor"] as int?,
      createdAt: json?["created_at"]?.toString(),
      updatedAt: json?["updated_at"]?.toString(),
    );
  }
}
