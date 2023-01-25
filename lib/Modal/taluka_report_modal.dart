// To parse this JSON data, do
//
//     final talukaReportModal = talukaReportModalFromJson(jsonString);

import 'dart:convert';

TalukaReportModal? talukaReportModalFromJson(String str) => TalukaReportModal.fromJson(json.decode(str));

String talukaReportModalToJson(TalukaReportModal? data) => json.encode(data!.toJson());

class TalukaReportModal {
  TalukaReportModal({
    this.talukaId,
    this.taluka,
    this.received,
    this.openn,
    this.accepted,
    this.resolved,
    this.partialResloved,
    this.rejected,
    this.transfered,
    this.isDeleted,
  });

  int? talukaId;
  String? taluka;
  int? received;
  int? openn;
  int? accepted;
  int? resolved;
  int? partialResloved;
  int? rejected;
  int? transfered;
  bool? isDeleted;

  factory TalukaReportModal.fromJson(Map<String, dynamic> json) => TalukaReportModal(
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    received: json["received"],
    openn: json["openn"],
    accepted: json["accepted"],
    resolved: json["resolved"],
    partialResloved: json["partialResloved"],
    rejected: json["rejected"],
    transfered: json["transfered"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "talukaId": talukaId,
    "taluka": taluka,
    "received": received,
    "openn": openn,
    "accepted": accepted,
    "resolved": resolved,
    "partialResloved": partialResloved,
    "rejected": rejected,
    "transfered": transfered,
    "isDeleted": isDeleted,
  };
}
