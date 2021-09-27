class User {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;

  final List<dynamic>? roles;

  User({this.username, this.email, this.roles, this.firstName, this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        username: json['username'],
        email: json['email'],
        roles: json['roles'],
        firstName: json['firstname'],
        lastName: json['lastname']);
  }
}
