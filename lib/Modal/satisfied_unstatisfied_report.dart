// To parse this JSON data, do
//
//     final satisfiedUnSReportModal = satisfiedUnSReportModalFromJson(jsonString);

import 'dart:convert';

SatisfiedUnSReportModal? satisfiedUnSReportModalFromJson(String str) => SatisfiedUnSReportModal.fromJson(json.decode(str));

String satisfiedUnSReportModalToJson(SatisfiedUnSReportModal? data) => json.encode(data!.toJson());

class SatisfiedUnSReportModal {
  SatisfiedUnSReportModal({
    this.deptId,
    this.departmentname,
    this.received,
    this.resolved,
    this.satisfied,
    this.unSatisfied,
    this.isDeleted,
  });

  int? deptId;
  String? departmentname;
  int? received;
  int? resolved;
  int? satisfied;
  int? unSatisfied;
  bool? isDeleted;

  factory SatisfiedUnSReportModal.fromJson(Map<String, dynamic> json) => SatisfiedUnSReportModal(
    deptId: json["deptId"],
    departmentname: json["departmentname"],
    received: json["received"],
    resolved: json["resolved"],
    satisfied: json["satisfied"],
    unSatisfied: json["unSatisfied"],
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "deptId": deptId,
    "departmentname": departmentname,
    "received": received,
    "resolved": resolved,
    "satisfied": satisfied,
    "unSatisfied": unSatisfied,
    "isDeleted": isDeleted,
  };
}
