class User {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? password;
  final List<dynamic>? roles;
  final String? accessToken;

  User(
      {this.id,
      this.username,
      this.email,
      this.password,
      this.roles,
      this.accessToken,
      this.firstName,
      this.lastName});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        roles: json['roles'],
        accessToken: json["accessToken"],
        firstName: json['firstname'],
        lastName: json['lastname']);
  }
}
