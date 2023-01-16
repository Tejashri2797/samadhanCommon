

class NotificationModal{
  int? userId;
  int? isReadcount;


  NotificationModal({this.userId, this.isReadcount});


  factory NotificationModal.fromJson(Map<String, dynamic> json)=>
      NotificationModal(
        userId:json["userId"],
        isReadcount:json["isReadcount"],
      );

  Map<String, dynamic> toJson()=>
      {
        "userId":userId,
        "isReadcount":isReadcount,
      };
}