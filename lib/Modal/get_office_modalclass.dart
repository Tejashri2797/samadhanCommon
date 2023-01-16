class GetOfficeByDeptId{
  int? id;
  int? deptId;
  String? name;

  GetOfficeByDeptId({this.id, this.deptId, this.name});
  factory GetOfficeByDeptId.fromJson(Map<String, dynamic> json)=>
      GetOfficeByDeptId(
        id: json["id"],
        deptId: json["deptId"],
        name: json["name"],


      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "deptId": deptId,
        "name": name,

      };
}