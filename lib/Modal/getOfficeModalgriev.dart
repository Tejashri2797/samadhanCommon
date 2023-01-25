
import 'dart:core';

class OfficeModalClass {
  int? id;
  int? deptId;
  String? name;
  String? m_OfficeName;

  OfficeModalClass({this.id,this.deptId,this.name,this.m_OfficeName});


  ///convert from json to object
  factory OfficeModalClass.fromJson(Map<String, dynamic> json)=>
      OfficeModalClass(
        id: json["id"],
        deptId: json["deptId"],
        name: json["name"],
        m_OfficeName: json["m_OfficeName"],
      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "deptId": deptId,
        "name": name,
        "m_OfficeName": m_OfficeName,
      };


}

