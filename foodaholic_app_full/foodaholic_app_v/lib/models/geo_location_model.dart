class GeoLocation{
  String longitud;
  String latitud;

GeoLocation({this.longitud, this.latitud});

GeoLocation.fromJsonMap(Map<dynamic, dynamic> json){
  if(json != null){
    longitud = json['longitud'];
    latitud = json['latitud'];
  }
}
}