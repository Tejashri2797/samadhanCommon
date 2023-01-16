

class DepartmentModalClass{
  int? id;
  String? departmentName;

  DepartmentModalClass({this.id,this.departmentName});


  factory DepartmentModalClass.fromJson(Map<String, dynamic> json) =>
      DepartmentModalClass(
        id: json['id'],
        departmentName: json['departmentName'],
      );

  Map<String, dynamic> toJson()=>
      {
        "id":id,
        "departmentName":departmentName,
      };
}