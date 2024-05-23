class UserSettings {
  final String username;
  final String email;

  UserSettings({
    required this.username,
    required this.email,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      username: json['username'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
    };
  }
}
