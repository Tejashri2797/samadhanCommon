
import 'dart:core';

class DistrictModalClass {
  int? id;
  String? district;
  String? m_District;

  DistrictModalClass({this.id, this.district, this.m_District,});


  @override
  String toString() {
   return district!;
  }

  ///convert from json to object
  factory DistrictModalClass.fromJson(Map<String, dynamic> json)=>
      DistrictModalClass(
        id: json["id"],
        district: json["district"],
        m_District: json["m_District"],
      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "id": 1,
        "district": district,
        "m_District": m_District,
      };


}

