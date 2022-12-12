///popup list

class popupItem{
  int value;
  String name;
  popupItem(this.value,this.name);
}
String value = " ";
List<popupItem> list = [
  popupItem(1, 'Open'),
  popupItem(2, 'Accepted'),
  popupItem(3, 'Resolved'),
  popupItem(4, 'Partially Resolved'),
  popupItem(4, 'Rejected'),
];