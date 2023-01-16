// To parse this JSON data, do
//
//     final postGrievanceModal = postGrievanceModalFromJson(jsonString);

import 'dart:convert';

PostGrievanceModal postGrievanceModalFromJson(String str) => PostGrievanceModal.fromJson(json.decode(str));

String postGrievanceModalToJson(PostGrievanceModal data) => json.encode(data.toJson());

class PostGrievanceModal {
  PostGrievanceModal({
    this.id,
    this.grievanceNo,
    this.districtId,
    this.talukaId,
    this.stateId,
    this.villageId,
    this.concernDeptId,
    this.concernOfficeId,
    this.natureGrievanceId,
    this.grievanceDescription,
    this.isSelfGrievance,
    this.otherCitizenName,
    this.otherCitizenMobileNo,
    this.otherCitizenAddress,
    this.createdBy,
    this.modifiedBy,
    this.citizenGrievanceImages,
  });

  int? id;
  String? grievanceNo;
  int? districtId;
  int? talukaId;
  int? stateId;
  int? villageId;
  int? concernDeptId;
  int? concernOfficeId;
  int? natureGrievanceId;
  String? grievanceDescription;
  int? isSelfGrievance;
  String? otherCitizenName;
  String? otherCitizenMobileNo;
  String? otherCitizenAddress;
  int? createdBy;
  int? modifiedBy;
  List<CitizenGrievanceImage>? citizenGrievanceImages;

  factory PostGrievanceModal.fromJson(Map<String, dynamic> json) => PostGrievanceModal(
    id: json["id"],
    grievanceNo: json["grievanceNo"],
    districtId: json["districtId"],
    talukaId: json["talukaId"],
    stateId: json["stateId"],
    villageId: json["villageId"],
    concernDeptId: json["concern_DeptId"],
    concernOfficeId: json["concern_OfficeId"],
    natureGrievanceId: json["natureGrievanceId"],
    grievanceDescription: json["grievanceDescription"],
    isSelfGrievance: json["isSelfGrievance"],
    otherCitizenName: json["otherCitizenName"],
    otherCitizenMobileNo: json["otherCitizenMobileNo"],
    otherCitizenAddress: json["otherCitizenAddress"],
    createdBy: json["createdBy"],
    modifiedBy: json["modifiedBy"],
    citizenGrievanceImages: List<CitizenGrievanceImage>.from(json["citizenGrievanceImages"].map((x) => CitizenGrievanceImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "grievanceNo": grievanceNo,
    "districtId": districtId,
    "talukaId": talukaId,
    "stateId": stateId,
    "villageId": villageId,
    "concern_DeptId": concernDeptId,
    "concern_OfficeId": concernOfficeId,
    "natureGrievanceId": natureGrievanceId,
    "grievanceDescription": grievanceDescription,
    "isSelfGrievance": isSelfGrievance,
    "otherCitizenName": otherCitizenName,
    "otherCitizenMobileNo": otherCitizenMobileNo,
    "otherCitizenAddress": otherCitizenAddress,
    "createdBy": createdBy,
    "modifiedBy": modifiedBy,
    "citizenGrievanceImages": List<dynamic>.from(citizenGrievanceImages!.map((x) => x.toJson())),
  };
}

class CitizenGrievanceImage {
  CitizenGrievanceImage({
    this.grievanceId,
    this.docname,
    this.docpath,
    this.sortOrder,
    this.createdBy,
    this.modifiedBy,
  });

  int? grievanceId;
  String?docname;
  String? docpath;
  int? sortOrder;
  int? createdBy;
  int? modifiedBy;

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
