
import 'dart:core';

class VillageModalClass {
  int? talukaId;
  int? id;
  String? village;
  String? m_Village;

  VillageModalClass({this.id, this.village, this.m_Village,this.talukaId});


  ///convert from json to object
  factory VillageModalClass.fromJson(Map<String, dynamic> json)=>
      VillageModalClass(
        talukaId: json["talukaId"],
        id: json["id"],
        village: json["village"],
        m_Village: json["m_Village"],
      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "selecctVillage": talukaId,
        "id": id,
        "village": village,
        "m_Village": m_Village,
      };


}

