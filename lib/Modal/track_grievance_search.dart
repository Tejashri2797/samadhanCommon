

import 'dart:convert';

class CitizenGrievanceImage {
  int? grievanceId;
  String? docname;
  String? docpath;
  int? sortOrder;
  int? createdBy;
  int? modifiedBy;
  CitizenGrievanceImage({
    this.grievanceId,
    this.docname,
    this.docpath,
    this.sortOrder,
    this.createdBy,
    this.modifiedBy,
  });



  factory CitizenGrievanceImage.fromJson(Map<String, dynamic> json) => CitizenGrievanceImage(
    grievanceId: json["grievanceId"],
    docname: json["docname"],
    docpath: json["docpath"],
    sortOrder: json["sortOrder"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
  );

  Map<String, dynamic> toJson() => {
    "grievanceId": grievanceId,
    "docname": docname,
    "docpath": docpath,
    "sortOrder": sortOrder,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
  };
}

class TrackGrievanceSearchdModal {
  int? grievanceId;
  String? grievanceNo;
  int? districtId;
  String? district;
  String? talukaId;
  String? taluka;
  String? stateId;
  String? villageId;
  String? village;
  int? concernDeptId;
  String? departmentName;
  String? officeName;
  int? natureGrievanceId;
  String? natureofGrievance;
  String? grievanceDescription;
  int? isSelfGrievance;
  String? otherCitizenName;
  String? otherCitizenMobileNo;
  String? otherCitizenAddress;
  DateTime? grievanceSubmissionDate;
  int? grievanceStatusId;
  DateTime? grievanceStatusDate;
  String? status;
  int? createdBy;
  String? name;
  String? userMobileNo;
  String? userEmailId;
  List<CitizenGrievanceImage>? citizenGrievanceImages;


  TrackGrievanceSearchdModal({
    this.grievanceId,
    this.grievanceNo,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.stateId,
    this.villageId,
    this.village,
    this.concernDeptId,
    this.departmentName,
    this.officeName,
    this.natureGrievanceId,
    this.natureofGrievance,
    this.grievanceDescription,
    this.isSelfGrievance,
    this.otherCitizenName,
    this.otherCitizenMobileNo,
    this.otherCitizenAddress,
    this.grievanceSubmissionDate,
    this.grievanceStatusId,
    this.grievanceStatusDate,
    this.status,
    this.createdBy,
    this.name,
    this.userMobileNo,
    this.userEmailId,
    this.citizenGrievanceImages,

  });



  factory TrackGrievanceSearchdModal.fromJson(Map<String, dynamic> json) => TrackGrievanceSearchdModal(
    grievanceId: json["grievanceId"],
    grievanceNo: json["grievanceNo"],
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    stateId: json["stateId"],
    villageId: json["villageId"],
    village: json["village"],
    concernDeptId: json["concern_DeptId"],
    departmentName: json["departmentName"],
    officeName: json["officeName"],
    natureGrievanceId: json["natureGrievanceId"],
    natureofGrievance: json["natureofGrievance"],
    grievanceDescription: json["grievanceDescription"],
    isSelfGrievance: json["isSelfGrievance"],
    otherCitizenName: json["otherCitizenName"],
    otherCitizenMobileNo: json["otherCitizenMobileNo"],
    otherCitizenAddress: json["otherCitizenAddress"],
    grievanceSubmissionDate: DateTime.parse(json["grievanceSubmissionDate"]),
    grievanceStatusId: json["grievanceStatusId"],
    grievanceStatusDate: DateTime.parse(json["grievanceStatusDate"]),
    status: json["status"],
    createdBy: json["createdBy"],
    name: json["name"],
    userMobileNo: json["userMobileNo"],
    userEmailId: json["userEmailId"],
    citizenGrievanceImages: List<CitizenGrievanceImage>.from(json["citizenGrievanceImages"].map((x) => CitizenGrievanceImage.fromJson(x))),


  );

  Map<String, dynamic> toJson() => {
    "grievanceId": grievanceId,
    "grievanceNo": grievanceNo,
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "stateId": stateId,
    "villageId": villageId,
    "village": village,
    "concern_DeptId": concernDeptId,
    "departmentName": departmentName,
    "officeName": officeName,
    "natureGrievanceId": natureGrievanceId,
    "natureofGrievance": natureofGrievance,
    "grievanceDescription": grievanceDescription,
    "isSelfGrievance": isSelfGrievance,
    "otherCitizenName": otherCitizenName,
    "otherCitizenMobileNo": otherCitizenMobileNo,
    "otherCitizenAddress": otherCitizenAddress,
    "grievanceSubmissionDate": grievanceSubmissionDate?.toIso8601String(),
    "grievanceStatusId": grievanceStatusId,
    "grievanceStatusDate": grievanceStatusDate?.toIso8601String(),
    "status": status,
    "createdBy": createdBy,
    "name": name,
    "userMobileNo": userMobileNo,
    "userEmailId": userEmailId,
    "citizenGrievanceImages": List<dynamic>.from(citizenGrievanceImages!.map((x) => x.toJson())),


  };
}
