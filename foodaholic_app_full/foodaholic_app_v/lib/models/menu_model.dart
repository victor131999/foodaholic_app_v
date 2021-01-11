
class Menus {
  List<Menu> items = List();

  Menus();

  Menus.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    for (var item in jsonList) {
      final menu = new Menu.fromJsonMap(item);
      items.add(menu);
    }
  }
}

class Menu {
  String idFood;
  String name;
  String cost;
  String description;
  String image;
  int like;

  Menu(
      {this.idFood,
      this.name,
      this.cost,
      this.description,
      this.image,
      this.like
      });

  Menu.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      idFood = json['idFood'];
      name = json['name'];
      cost = json['cost'];
      description = json['description'];
      image = json['image'];
    }
  }
}