// To parse this JSON data, do
//
//     final officeReportModal = officeReportModalFromJson(jsonString);

import 'dart:convert';

OfficeReportModal? officeReportModalFromJson(String str) => OfficeReportModal.fromJson(json.decode(str));

String officeReportModalToJson(OfficeReportModal? data) => json.encode(data!.toJson());

class OfficeReportModal {
  OfficeReportModal({
    this.deptId,
    this.departmentname,
    this.officeId,
    this.officeName,
    this.received,
    this.openn,
    this.accepted,
    this.resolved,
    this.partialResloved,
    this.rejected,
    this.transfered,
    this.isDeleted,
  });

  int? deptId;
  String? departmentname;
  int? officeId;
  String? officeName;
  int? received;
  int? openn;
  int? accepted;
  int? resolved;
  int? partialResloved;
  int? rejected;
  int? transfered;
  bool? isDeleted;

  factory OfficeReportModal.fromJson(Map<String, dynamic> json) => OfficeReportModal(
    deptId: json["deptId"],
    departmentname: json["departmentname"],
    officeId: json["officeId"],
    officeName: json["officeName"],
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
    "deptId": deptId,
    "departmentname": departmentname,
    "officeId": officeId,
    "officeName": officeName,
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
