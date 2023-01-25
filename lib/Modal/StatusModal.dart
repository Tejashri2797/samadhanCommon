// To parse this JSON data, do
//
//     final statusModal = statusModalFromJson(jsonString);

import 'dart:convert';

StatusModal? statusModalFromJson(String str) => StatusModal.fromJson(json.decode(str));

String statusModalToJson(StatusModal? data) => json.encode(data!.toJson());

class StatusModal {
  StatusModal({
    this.id,
    this.name,
    this.mName,
  });

  int? id;
  String? name;
  String? mName;

  factory StatusModal.fromJson(Map<String, dynamic> json) => StatusModal(
    id: json["id"],
    name: json["name"],
    mName: json["m_Name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "m_Name": mName,
  };
}
