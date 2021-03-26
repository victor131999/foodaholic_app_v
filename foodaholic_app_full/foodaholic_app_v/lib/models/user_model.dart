class User {
  String name;
  String role;
  String email;

  User({this.name, this.role, this.email});

  User.fromJsonMap(Map<dynamic, dynamic> json) {
    if (json != null) {
      name = json['name'];
      role = json['role'];
      email = json['email'];
    }
  }
}
