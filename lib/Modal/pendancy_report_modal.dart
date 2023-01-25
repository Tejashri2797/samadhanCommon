// To parse this JSON data, do
//
//     final pendancyReportModal = pendancyReportModalFromJson(jsonString);

import 'dart:convert';

PendancyReportModal? pendancyReportModalFromJson(String str) => PendancyReportModal.fromJson(json.decode(str));

String pendancyReportModalToJson(PendancyReportModal? data) => json.encode(data!.toJson());

class PendancyReportModal {
  PendancyReportModal({
    this.deptId,
    this.departmentname,
    this.received,
    this.pending,
    this.approvedless7,
    this.approvedless15,
    this.approvedless30,
    this.approvedgrt30,
  });

  int? deptId;
  String? departmentname;
  int? received;
  int? pending;
  int? approvedless7;
  int? approvedless15;
  int? approvedless30;
  int? approvedgrt30;

  factory PendancyReportModal.fromJson(Map<String, dynamic> json) => PendancyReportModal(
    deptId: json["deptId"],
    departmentname: json["departmentname"],
    received: json["received"],
    pending: json["pending"],
    approvedless7: json["approvedless7"],
    approvedless15: json["approvedless15"],
    approvedless30: json["approvedless30"],
    approvedgrt30: json["approvedgrt30"],
  );

  Map<String, dynamic> toJson() => {
    "deptId": deptId,
    "departmentname": departmentname,
    "received": received,
    "pending": pending,
    "approvedless7": approvedless7,
    "approvedless15": approvedless15,
    "approvedless30": approvedless30,
    "approvedgrt30": approvedgrt30,
  };
}
