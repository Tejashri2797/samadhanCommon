

class ReportDepartmentModalClass{
  int? id;
  String? departmentName;

  ReportDepartmentModalClass({this.id,this.departmentName});


  factory ReportDepartmentModalClass.fromJson(Map<String, dynamic> json) =>
      ReportDepartmentModalClass(
        id: json['id'],
        departmentName: json['departmentName'],
      );

  Map<String, dynamic> toJson()=>
      {
        "id":id,
        "departmentName":departmentName,
      };
}