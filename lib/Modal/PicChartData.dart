// To parse this JSON data, do
//
//     final picChartModalClass = picChartModalClassFromJson(jsonString);

import 'dart:convert';

PicChartModalClass? picChartModalClassFromJson(String str) => PicChartModalClass.fromJson(json.decode(str));

String picChartModalClassToJson(PicChartModalClass? data) => json.encode(data!.toJson());

class PicChartModalClass {
  PicChartModalClass({
    this.count,
    this.grievanceStatusId,
    this.name,
    this.totalcount,
  });

  int? count;
  int? grievanceStatusId;
  String? name;
  int? totalcount;

  factory PicChartModalClass.fromJson(Map<String, dynamic> json) => PicChartModalClass(
    count: json["count"],
    grievanceStatusId: json["grievanceStatusId"],
    name: json["name"],
    totalcount: json["totalcount"],
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "grievanceStatusId": grievanceStatusId,
    "name": name,
    "totalcount": totalcount,
  };
}
