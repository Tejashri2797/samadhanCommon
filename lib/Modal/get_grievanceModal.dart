class GetGrievanceResolvedModal {
  int? id;
  String? grievanceNo;
  int? isSatisfied;
  String? taluka;
  String? department;
  String? nature_Of_Grievance;
  String? reg_Date;
  String? resolved_Date;
  int? isSelfGrievance;

  GetGrievanceResolvedModal(
      {
        this.id,
      this.grievanceNo,
      this.isSatisfied,
      this.taluka,
      this.department,
      this.nature_Of_Grievance,
      this.reg_Date,
      this.resolved_Date,
      this.isSelfGrievance
      });

  factory GetGrievanceResolvedModal.fromJson(Map<String, dynamic> json) =>
      GetGrievanceResolvedModal(
        id: json["id"],
        grievanceNo: json["grievanceNo"],
        isSatisfied: json["isSatisfied"],
        taluka: json["taluka"],
        department: json["department"],
        nature_Of_Grievance: json["nature_Of_Grievance"],
        reg_Date: json["reg_Date"],
        resolved_Date: json["resolved_Date"],
        isSelfGrievance: json["isSelfGrievance"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "grievanceNo": grievanceNo,
        "isSatisfied": isSatisfied,
        "taluka": taluka,
        "department": department,
        "nature_Of_Grievance": nature_Of_Grievance,
        "reg_Date": reg_Date,
        "resolved_Date": resolved_Date,
        "isSelfGrievance": isSelfGrievance,

      };
}
