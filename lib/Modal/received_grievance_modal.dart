// To parse this JSON data, do
//
//     final receivedGrievanceModal = receivedGrievanceModalFromJson(jsonString);

import 'dart:convert';

ReceivedGrievanceModal? receivedGrievanceModalFromJson(String str) => ReceivedGrievanceModal.fromJson(json.decode(str));

String receivedGrievanceModalToJson(ReceivedGrievanceModal? data) => json.encode(data!.toJson());

class ReceivedGrievanceModal {
  ReceivedGrievanceModal({
    this.grievanceId,
    this.grievanceNo,
    this.grievanceStatusId,
    this.isActionable,
    this.status,
    this.applicantName,
    this.date,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.stateId,
    this.state,
    this.villageId,
    this.village,
    this.concernDeptId,
    this.department,
    this.concernOfficeId,
    this.officeName,
    this.natureGrievanceId,
    this.natureofGrievance,
    this.grievanceDescription,
    this.isSelfGrievance,
    this.otherCitizenName,
    this.otherCitizenMobileNo,
    this.otherCitizenAddress,
    this.createdBy,
    this.createdDate,
    this.modifiedBy,
    this.modifiedDate,
    this.isDeleted,
    this.isPartial,
    this.isRed,
  });

  int? grievanceId;
  String? grievanceNo;
  int? grievanceStatusId;
  int? isActionable;
  String? status;
  String? applicantName;
  DateTime? date;
  int? districtId;
  String? district;
  int? talukaId;
  String? taluka;
  int? stateId;
  String? state;
  int? villageId;
  String? village;
  int? concernDeptId;
  String? department;
  int? concernOfficeId;
  String? officeName;
  int? natureGrievanceId;
  String? natureofGrievance;
  String? grievanceDescription;
  int? isSelfGrievance;
  String? otherCitizenName;
  String? otherCitizenMobileNo;
  String? otherCitizenAddress;
  int? createdBy;
  DateTime? createdDate;
  int? modifiedBy;
  DateTime? modifiedDate;
  bool? isDeleted;
  int? isPartial;
  int? isRed;

  factory ReceivedGrievanceModal.fromJson(Map<String, dynamic> json) => ReceivedGrievanceModal(
    grievanceId: json["grievanceId"],
    grievanceNo: json["grievanceNo"],
    grievanceStatusId: json["grievanceStatusId"],
    isActionable: json["isActionable"],
    status: json["status"],
    applicantName: json["applicantName"],
    date: DateTime.parse(json["date"]),
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    stateId: json["stateId"],
    state: json["state"],
    villageId: json["villageId"],
    village: json["village"],
    concernDeptId: json["concern_DeptId"],
    department: json["department"],
    concernOfficeId: json["concern_OfficeId"],
    officeName: json["officeName"],
    natureGrievanceId: json["natureGrievanceId"],
    natureofGrievance: json["natureofGrievance"],
    grievanceDescription: json["grievanceDescription"],
    isSelfGrievance: json["isSelfGrievance"],
    otherCitizenName: json["otherCitizenName"],
    otherCitizenMobileNo: json["otherCitizenMobileNo"],
    otherCitizenAddress: json["otherCitizenAddress"],
    createdBy: json["createdBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedBy: json["modifiedBy"],
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    isDeleted: json["isDeleted"],
    isPartial: json["isPartial"],
    isRed: json["isRed"],
  );

  Map<String, dynamic> toJson() => {
    "grievanceId": grievanceId,
    "grievanceNo": grievanceNo,
    "grievanceStatusId": grievanceStatusId,
    "isActionable": isActionable,
    "status": status,
    "applicantName": applicantName,
    "date": date?.toIso8601String(),
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "stateId": stateId,
    "state": state,
    "villageId": villageId,
    "village": village,
    "concern_DeptId": concernDeptId,
    "department": department,
    "concern_OfficeId": concernOfficeId,
    "officeName": officeName,
    "natureGrievanceId": natureGrievanceId,
    "natureofGrievance": natureofGrievance,
    "grievanceDescription": grievanceDescription,
    "isSelfGrievance": isSelfGrievance,
    "otherCitizenName": otherCitizenName,
    "otherCitizenMobileNo": otherCitizenMobileNo,
    "otherCitizenAddress": otherCitizenAddress,
    "createdBy": createdBy,
    "createdDate": createdDate?.toIso8601String(),
    "modifiedBy": modifiedBy,
    "modifiedDate": modifiedDate?.toIso8601String(),
    "isDeleted": isDeleted,
    "isPartial": isPartial,
    "isRed": isRed,
  };
}
