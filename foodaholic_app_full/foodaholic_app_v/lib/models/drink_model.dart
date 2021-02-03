
class Drinks {
  List<Drink> items = List();

  Drinks();

  Drinks.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final drink = new Drink.fromJsonMap(item);
      items.add(drink);
    }
  }
}

class Drink {
  String idDrink;
  String name;
  String cost;
  String image;

  Drink(
      {this.idDrink,
      this.name,
      this.cost,
      this.image,
      });

  Drink.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      idDrink = json['idDrink'];
      name = json['name'];
      cost = json['cost'];
      image = json['image'];
    }
  }
}