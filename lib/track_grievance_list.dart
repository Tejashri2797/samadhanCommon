// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

class TrackGrievanceListModal {
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
  DateTime? grievanceSubmissionDate;
  int? grievanceStatusId;
  String? status;
  DateTime? grievanceStatusDate;
  List<TrackGrievanceListPageDetails>? trackGrievanceListPageDetails;



  TrackGrievanceListModal({
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
    this.grievanceSubmissionDate,
    this.grievanceStatusId,
    this.status,
    this.grievanceStatusDate,
    this.trackGrievanceListPageDetails

  });



  factory TrackGrievanceListModal.fromJson(Map<String, dynamic> json) => TrackGrievanceListModal(
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

    grievanceSubmissionDate: DateTime.parse(json["grievanceSubmissionDate"]),
    grievanceStatusId: json["grievanceStatusId"],
    status: json["status"],
    grievanceStatusDate: DateTime.parse(json["grievanceStatusDate"],),
    trackGrievanceListPageDetails: json["trackGrievanceListPageDetails"],

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
    "grievanceSubmissionDate": grievanceSubmissionDate?.toIso8601String(),
    "grievanceStatusId": grievanceStatusId,
    "status": status,
    "grievanceStatusDate": grievanceStatusDate?.toIso8601String(),
    "trackGrievanceListPageDetails": trackGrievanceListPageDetails

  };
}



class TrackGrievanceListPageDetails {
  TrackGrievanceListPageDetails({
    required this.pageNo,
    required this.totalPages,
    required this.pageCount,
  });

  int pageNo;
  int totalPages;
  int pageCount;

  factory TrackGrievanceListPageDetails.fromJson(Map<String, dynamic> json) => TrackGrievanceListPageDetails(
    pageNo: json["pageNo"],
    totalPages: json["totalPages"],
    pageCount: json["pageCount"],
  );

  Map<String, dynamic> toJson() => {
    "pageNo": pageNo,
    "totalPages": totalPages,
    "pageCount": pageCount,
  };
}

