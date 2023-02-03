// To parse this JSON data, do
//
//     final getOfficeByDeptId = getOfficeByDeptIdFromJson(jsonString);

import 'dart:convert';

GetOfficeByDeptId getOfficeByDeptIdFromJson(String str) => GetOfficeByDeptId.fromJson(json.decode(str));

String getOfficeByDeptIdToJson(GetOfficeByDeptId data) => json.encode(data.toJson());

class GetOfficeByDeptId {
  GetOfficeByDeptId({
   this.id,
   this.deptId,
   this.name,
   this.m_OfficeName,
  });

  int? id;
  int? deptId;
  String? name;
  String? m_OfficeName;

  factory GetOfficeByDeptId.fromJson(Map<String, dynamic> json) => GetOfficeByDeptId(
    id: json["id"],
    deptId: json["deptId"],
    name: json["name"],
    m_OfficeName: json["m_OfficeName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "deptId": deptId,
    "name": name,
    "m_OfficeName": m_OfficeName,
  };
}
