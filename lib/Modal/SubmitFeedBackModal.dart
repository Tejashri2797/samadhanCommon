// To parse this JSON data, do
//
//     final postFeedbackModal = postFeedbackModalFromJson(jsonString);

import 'dart:convert';

PostFeedbackModal postFeedbackModalFromJson(String str) => PostFeedbackModal.fromJson(json.decode(str));

String postFeedbackModalToJson(PostFeedbackModal data) => json.encode(data.toJson());

class PostFeedbackModal {
  PostFeedbackModal({
    this.id,
    this.grievanceId,
    this.comment,
    this.isSatisfied,
    this.dSatisfactnReason,
    this.createdBy,
  });

  int? id;
  int? grievanceId;
  String? comment;
  int? isSatisfied;
  int? dSatisfactnReason;
  String? createdBy;

  factory PostFeedbackModal.fromJson(Map<String, dynamic> json) => PostFeedbackModal(
    id: json["id"],
    grievanceId: json["grievanceId"],
    comment: json["comment"],
    isSatisfied: json["isSatisfied"],
    dSatisfactnReason: json["d_satisfactn_Reason"],
    createdBy: json["createdBy"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "grievanceId": grievanceId,
    "comment": comment,
    "isSatisfied": isSatisfied,
    "d_satisfactn_Reason": dSatisfactnReason,
    "createdBy": createdBy,
  };
}
