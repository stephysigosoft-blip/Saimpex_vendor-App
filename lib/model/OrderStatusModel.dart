// To parse this JSON data, do
//
//     final orderStatusModel = orderStatusModelFromJson(jsonString);

import 'dart:convert';

OrderStatusModel orderStatusModelFromJson(String str) => OrderStatusModel.fromJson(json.decode(str));

String orderStatusModelToJson(OrderStatusModel data) => json.encode(data.toJson());

class OrderStatusModel {
  final String? status;
  final Data? data;
  final String? message;

  OrderStatusModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) => OrderStatusModel(
    status: json["status"]?.toString(),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    message: json["message"]?.toString(),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  final int? orderId;

  Data({
    this.orderId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
  };
}
