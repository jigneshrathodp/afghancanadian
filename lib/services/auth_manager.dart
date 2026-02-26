import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userIdKey = 'user_id';
  static const String _userNameKey = 'user_name';
  
  static final AuthManager _instance = AuthManager._internal();
  factory AuthManager() => _instance;
  AuthManager._internal();

  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // Check if user is logged in
  bool get isLoggedIn => _prefs.getBool(_isLoggedInKey) ?? false;

  // Get user ID
  String? get userId => _prefs.getString(_userIdKey);

  // Get user name
  String? get userName => _prefs.getString(_userNameKey);

  // Login user
  Future<void> login({required String userId, required String userName}) async {
    await _prefs.setBool(_isLoggedInKey, true);
    await _prefs.setString(_userIdKey, userId);
    await _prefs.setString(_userNameKey, userName);
  }

  // Logout user
  Future<void> logout() async {
    await _prefs.setBool(_isLoggedInKey, false);
    await _prefs.remove(_userIdKey);
    await _prefs.remove(_userNameKey);
  }

  // Clear all auth data
  Future<void> clear() async {
    await _prefs.clear();
  }
}