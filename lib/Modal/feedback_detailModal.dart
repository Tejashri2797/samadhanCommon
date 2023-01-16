import 'dart:convert';

FeedbackDetailsModal feedbackDetailsModalFromJson(String str) => FeedbackDetailsModal.fromJson(json.decode(str));

String feedbackDetailsModalToJson(FeedbackDetailsModal data) => json.encode(data.toJson());

class FeedbackDetailsModal {
  FeedbackDetailsModal({
    this.grievanceId,
    this.grievanceNo,
    this.districtId,
    this.district,
    this.talukaId,
    this.taluka,
    this.stateId,
    this.state,
    this.villageId,
    this.village,
    this.concernDeptId,
    this.departmentName,
    this.concernOfficeId,
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
    this.isFeedBack,
    this.comment,
    this.isSatisfied,
    this.status,
    this.createdBy,
    this.name,
    this.userMobileNo,
    this.userEmailId,
    this.url,
    this.citizenGrievanceImages,
    this.officerRedressalImages,
  });

  int? grievanceId;
  String? grievanceNo;
  int? districtId;
  String? district;
  int? talukaId;
  String? taluka;
  int? stateId;
  String? state;
  int? villageId;
  String? village;
  int? concernDeptId;
  String? departmentName;
  int? concernOfficeId;
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
  int? isFeedBack;
  String? comment;
  int? isSatisfied;
  String? status;
  int? createdBy;
  String? name;
  String? userMobileNo;
  String? userEmailId;
  String? url;
  List<CitizenGrievanceImage>? citizenGrievanceImages;
  List<dynamic>? officerRedressalImages;

  factory FeedbackDetailsModal.fromJson(Map<String, dynamic> json) => FeedbackDetailsModal(
    grievanceId: json["grievanceId"],
    grievanceNo: json["grievanceNo"],
    districtId: json["districtId"],
    district: json["district"],
    talukaId: json["talukaId"],
    taluka: json["taluka"],
    stateId: json["stateId"],
    state: json["state"],
    villageId: json["villageId"],
    village: json["village"],
    concernDeptId: json["concern_DeptId"],
    departmentName: json["departmentName"],
    concernOfficeId: json["concern_OfficeId"],
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
    isFeedBack: json["isFeedBack"],
    comment: json["comment"],
    isSatisfied: json["isSatisfied"],
    status: json["status"],
    createdBy: json["createdBy"],
    name: json["name"],
    userMobileNo: json["userMobileNo"],
    userEmailId: json["userEmailId"],
    url: json["url"],
    citizenGrievanceImages: List<CitizenGrievanceImage>.from(json["citizenGrievanceImages"].map((x) => CitizenGrievanceImage.fromJson(x))),
    officerRedressalImages: List<dynamic>.from(json["officerRedressalImages"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "grievanceId": grievanceId,
    "grievanceNo": grievanceNo,
    "districtId": districtId,
    "district": district,
    "talukaId": talukaId,
    "taluka": taluka,
    "stateId": stateId,
    "state": state,
    "villageId": villageId,
    "village": village,
    "concern_DeptId": concernDeptId,
    "departmentName": departmentName,
    "concern_OfficeId": concernOfficeId,
    "officeName": officeName,
    "natureGrievanceId": natureGrievanceId,
    "natureofGrievance": natureofGrievance,
    "grievanceDescription": grievanceDescription,
    "isSelfGrievance": isSelfGrievance,
    "otherCitizenName": otherCitizenName,
    "otherCitizenMobileNo": otherCitizenMobileNo,
    "otherCitizenAddress": otherCitizenAddress,
    "grievanceSubmissionDate": grievanceSubmissionDate!.toIso8601String(),
    "grievanceStatusId": grievanceStatusId,
    "isFeedBack": isFeedBack,
    "comment": comment,
    "isSatisfied": isSatisfied,
    "status": status,
    "createdBy": createdBy,
    "name": name,
    "userMobileNo": userMobileNo,
    "userEmailId": userEmailId,
    "url": url,
    "citizenGrievanceImages": List<dynamic>.from(citizenGrievanceImages!.map((x) => x.toJson())),
    "officerRedressalImages": List<dynamic>.from(officerRedressalImages!.map((x) => x)),
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
  String? docname;
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
