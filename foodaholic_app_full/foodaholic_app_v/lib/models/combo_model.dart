
class Combos {
  List<Combo> items = List();

  Combos();

  Combos.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final combo = new Combo.fromJsonMap(item);
      items.add(combo);
    }
  }
}

class Combo {
  String idCombo;
  String fusion;
  String cost;
  String image;

  Combo(
      {this.idCombo,
      this.fusion,
      this.cost,
      this.image,
      });

  Combo.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      idCombo = json['idCombo'];
      fusion = json['fusion'];
      cost = json['cost'];
      image = json['image'];
    }
  }
}