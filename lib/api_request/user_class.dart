class User {
  String email;
  String name;
  String role;
  String jwt;

  User({this.email, this.name, this.role, this.jwt});

  User.fromMap(Map<String, String> map) {
    email = map['email'];
    name = map['name'];
    role = map['role'];
    jwt = map['jwt'];
  }
}
