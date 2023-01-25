// To parse this JSON data, do
//
//     final deptReportDetailsModal = deptReportDetailsModalFromJson(jsonString);

import 'dart:convert';

DeptReportDetailsModal? deptReportDetailsModalFromJson(String str) => DeptReportDetailsModal.fromJson(json.decode(str));

String deptReportDetailsModalToJson(DeptReportDetailsModal? data) => json.encode(data!.toJson());

class DeptReportDetailsModal {
  DeptReportDetailsModal({
    this.deptId,
    this.departmentname,
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
  int? received;
  int? openn;
  int? accepted;
  int? resolved;
  int? partialResloved;
  int? rejected;
  int? transfered;
  bool? isDeleted;

  factory DeptReportDetailsModal.fromJson(Map<String, dynamic> json) => DeptReportDetailsModal(
    deptId: json["deptId"],
    departmentname: json["departmentname"],
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
