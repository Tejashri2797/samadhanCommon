// To parse this JSON data, do
//
//     final notificationDetail = notificationDetailFromJson(jsonString);

import 'dart:convert';

NotificationDetailModal notificationDetailFromJson(String str) => NotificationDetailModal.fromJson(json.decode(str));

String notificationDetailToJson(NotificationDetailModal data) => json.encode(data.toJson());

class NotificationDetailModal {
  NotificationDetailModal({
    this.id,
    this.msgId,
    this.userId,
    this.greivanceId,
    this.deviceTypeId,
    this.appId,
    this.title,
    this.description,
    this.notificationDate,
    this.notificatioFailError,
    this.isRead,
  });

  int? id;
  int? msgId;
  int? userId;
  int? greivanceId;
  int? deviceTypeId;
  int? appId;
  String? title;
  String? description;
  DateTime? notificationDate;
  String? notificatioFailError;
  bool? isRead;

  factory NotificationDetailModal.fromJson(Map<String, dynamic> json) => NotificationDetailModal(
    id: json["id"],
    msgId: json["msgId"],
    userId: json["userId"],
    greivanceId: json["greivanceId"],
    deviceTypeId: json["deviceTypeId"],
    appId: json["appId"],
    title: json["title"],
    description: json["description"],
    notificationDate: DateTime.parse(json["notificationDate"]),
    notificatioFailError: json["notificatioFailError"],
    isRead: json["isRead"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "msgId": msgId,
    "userId": userId,
    "greivanceId": greivanceId,
    "deviceTypeId": deviceTypeId,
    "appId": appId,
    "title": title,
    "description": description,
    "notificationDate": notificationDate!.toIso8601String(),
    "notificatioFailError": notificatioFailError,
    "isRead": isRead,
  };
}
