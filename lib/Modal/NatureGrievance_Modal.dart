

class NatureModalClass{
  int? id;
  int? deptId;
  String? name;
  String? m_Name;

  NatureModalClass({this.id,this.deptId,this.name,this.m_Name});

  factory NatureModalClass.fromJson(Map<String, dynamic> json) =>
      NatureModalClass(
        id: json['id'],
        deptId: json['deptId'],
        name: json['name'],
        m_Name: json['m_Name'],
      );

  Map<String, dynamic> toJson()=>
      {
        "id" :id,
        "deptId" :deptId,
        "id" :name,
        "id" :m_Name,
      };
}