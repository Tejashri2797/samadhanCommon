
import 'dart:core';

class TalukaModalClass {
  int? id;
  String? taluka;
  String? m_Taluka;
  String? firstTaluka;

  TalukaModalClass({this.id, this.taluka, this.m_Taluka,this.firstTaluka});


  ///convert from json to object
  factory TalukaModalClass.fromJson(Map<String, dynamic> json)=>
      TalukaModalClass(
        id: json["id"],
        taluka: json["taluka"],
        m_Taluka: json["m_Taluka"],
        firstTaluka: json["firstTaluka"],
      );

  /// convert object to json
  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "taluka": taluka,
        "m_Taluka": m_Taluka,
      };


}

