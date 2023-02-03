

class DepartmentModalClass{
  int? id;
  String? departmentName;
  String? m_DepartmentName;

  DepartmentModalClass({this.id,this.departmentName,this.m_DepartmentName});


  factory DepartmentModalClass.fromJson(Map<String, dynamic> json) =>
      DepartmentModalClass(
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