import 'dart:convert';

DisatisfactionReason disatisfactionReasonFromJson(String str) => DisatisfactionReason.fromJson(json.decode(str));

String disatisfactionReasonToJson(DisatisfactionReason data) => json.encode(data.toJson());

class DisatisfactionReason {
  int? id;
  String? dSatisfactnReason;
  DisatisfactionReason({
    this.id,
    this.dSatisfactnReason,
  });



  factory DisatisfactionReason.fromJson(Map<String, dynamic> json) => DisatisfactionReason(
    id: json["id"],
    dSatisfactnReason: json["d_satisfactn_Reason"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "d_satisfactn_Reason": dSatisfactnReason,
  };
}
