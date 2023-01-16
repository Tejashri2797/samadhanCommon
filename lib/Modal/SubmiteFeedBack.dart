import 'dart:convert';

SubmitFeedbackModal submitFeedbackListFromJson(String str) => SubmitFeedbackModal.fromJson(json.decode(str));

String submitFeedbackListToJson(SubmitFeedbackModal data) => json.encode(data.toJson());

class SubmitFeedbackModal {
  int? grievanceId;
  String? grievanceNo;
  int? isSelfGrievance;
  int? deptId;
  String? department;
  String? office;
  DateTime? submissionDateAndTime;
  String? name;
  String? mobileNo;
  String? email;
  int? districtId;
  String? district;
  String? talukaId;
  String? taluka;
  String? villageId;
  String? village;
  String? natureOfGrievance;
  String? grievanceDetails;
  int? grievanceStatusId;
  int? isSatisfied;
  String? status;
  int? createdBy;
  int? modifiedBy;
  DateTime? createdDate;
  DateTime? modifiedDate;
  bool? isDeleted;
  SubmitFeedbackModal({
    this.grievanceId,
    this.grievanceNo,
    this.isSelfGrievance,
    this.deptId,
    this.department,
    this.office,
    this.submissionDateAndTime,
    this.name,
    this.mobileNo,
    this.email,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.villageId,
    this.village,
    this.natureOfGrievance,
    this.grievanceDetails,
    this.grievanceStatusId,
    this.isSatisfied,
    this.status,
    this.createdBy,
    this.modifiedBy,
    this.createdDate,
    this.modifiedDate,
    this.isDeleted,
  });



  factory SubmitFeedbackModal.fromJson(Map<String, dynamic> json) => SubmitFeedbackModal(
    grievanceId: json["grievanceId"],
    grievanceNo: json["grievanceNo"],
    isSelfGrievance: json["isSelfGrievance"],
    deptId: json["deptId"],
    department: json["department"],
    office: json["office"],
    submissionDateAndTime: DateTime.parse(json["submissionDateAndTime"]),
    name: json["name"],
    mobileNo: json["mobileNo"],
    email: json["email"],
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    villageId: json["villageId"],
    village: json["village"],
    natureOfGrievance: json["natureOfGrievance"],
    grievanceDetails: json["grievanceDetails"],
    grievanceStatusId: json["grievanceStatusId"],
    isSatisfied: json["isSatisfied"],
    status: json["status"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    createdDate: DateTime.parse(json["createdDate"]),
    modifiedDate: DateTime.parse(json["modifiedDate"]),
    isDeleted: json["isDeleted"],
  );

  Map<String, dynamic> toJson() => {
    "grievanceId": grievanceId,
    "grievanceNo": grievanceNo,
    "isSelfGrievance": isSelfGrievance,
    "deptId": deptId,
    "department": department,
    "office": office,
    "submissionDateAndTime": submissionDateAndTime!.toIso8601String(),
    "name": name,
    "mobileNo": mobileNo,
    "email": email,
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "villageId": villageId,
    "village": village,
    "natureOfGrievance": natureOfGrievance,
    "grievanceDetails": grievanceDetails,
    "grievanceStatusId": grievanceStatusId,
    "isSatisfied": isSatisfied,
    "status": status,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "createdDate": createdDate!.toIso8601String(),
    "modifiedDate": modifiedDate!.toIso8601String(),
    "isDeleted": isDeleted,
  };
}
