class User {
  String username;
  String email;
  String accessToken;
  DateTime expiredDate;
  List<String> roles = [];
  bool requireNewPassword = false;
  String? centerControlId;

  User({
    required this.username,
    required this.email,
    required this.accessToken,
    required this.expiredDate,
    this.roles = const [],
    this.requireNewPassword = false,
    this.centerControlId,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      accessToken: json['accessToken'],
      expiredDate: DateTime.parse(json['expiredDate']),
      roles: List<String>.from(json['roles']),
      requireNewPassword: json['requireNewPassword'],
      centerControlId: json['centerControlId'],
    );
  }
}