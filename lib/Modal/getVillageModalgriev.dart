
import 'dart:core';

class VillageModalClass {
  int? id;
  String? village;
  String? m_Village;

  VillageModalClass({this.id, this.village, this.m_Village,});


  ///convert from json to object
  factory VillageModalClass.fromJson(Map<String, dynamic> json)=>
      VillageModalClass(
        id: json["id"],
        village: json["village"],
        m_Village: json["m_Village"],
      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "id": 1,
        "village": village,
        "m_Village": m_Village,
      };


}

