import 'package:flutter/material.dart';
import 'package:fintech_/models/user_setting.dart';

class UserSettingsProvider with ChangeNotifier {
  UserSettings _userSettings = UserSettings(
    username: 'S\'Go Company',
    email: 'sgo_co@sgo.com',
  );

  UserSettings get userSettings => _userSettings;

  void updateUserSettings(UserSettings newSettings) {
    _userSettings = newSettings;
    notifyListeners();
  }

  void updateUsername(String username) {
    _userSettings = UserSettings(
      username: username,
      email: _userSettings.email,
    );
    notifyListeners();
  }

  void updateEmail(String email) {
    _userSettings = UserSettings(
      username: _userSettings.username,
      email: email,
    );
    notifyListeners();
  }

  Future<void> fetchUserSettings() async {
    await Future.delayed(Duration(seconds: 1));
    final fetchedSettings = UserSettings(
      username: 'S\'Go Company',
      email: 'sgo_co@sgo.com',
    );

    _userSettings = fetchedSettings;
    notifyListeners();
  }
}
