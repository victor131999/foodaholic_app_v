class SMenu{
  static const tblMenu = 'Smenus';
  static const meId = 'id';
  static const meName = 'name';
  static const meCost = 'cost';
  static const meDescription = 'description';

  SMenu({this.idFood,this.name,this.cost,this.description});
  SMenu.fromMap(Map<String, dynamic> map){
    idFood = map[meId];
    name =map[meName];
    cost = map[meCost];
    description = map[meDescription];
  }
   int idFood;
  String name;
  String cost;
  String description;

  Map<String,dynamic>  toMap(){
  var map = <String,dynamic>{meName:name,meCost:cost,meDescription:description};
  if(idFood != null) map[meId]=idFood;
    return map;
}

}

