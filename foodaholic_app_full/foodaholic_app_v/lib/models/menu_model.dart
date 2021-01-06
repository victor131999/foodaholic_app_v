class Special{
  String name;
  String cost;

Special({this.name, this.cost});

Special.fromJsonMap(Map<dynamic, dynamic> json){
  if(json != null){
    name = json['name'];
    cost = json['cost'];
  }
}
}