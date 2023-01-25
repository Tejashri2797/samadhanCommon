class OfficerDepartmentModal{
  int? id;
  String? departmentName;
  String? m_DepartmentName;

  OfficerDepartmentModal({this.id,this.departmentName,this.m_DepartmentName});


  factory OfficerDepartmentModal.fromJson(Map<String, dynamic> json) =>
      OfficerDepartmentModal(
        id: json['id'],
        departmentName: json['departmentName'],
        m_DepartmentName: json['m_DepartmentName'],
      );

  Map<String, dynamic> toJson()=>
      {
        "id":id,
        "departmentName":departmentName,
        "m_DepartmentName":m_DepartmentName,
      };
}