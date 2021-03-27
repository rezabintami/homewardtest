import 'package:shared_preferences/shared_preferences.dart';

class VPref {
  VPref._();

  static Future<bool> saveToken(String token) async {
    var ref = await SharedPreferences.getInstance();
    return ref.setString("token", token);
  }

  static Future<String> getToken() async {
    var ref = await SharedPreferences.getInstance();
    return ref.getString("token");
  }

  static Future<Map<String, dynamic>> getAuthorization() async {
    Map<String, dynamic> data = {};
    var ref = await SharedPreferences.getInstance();
    data["Authorization"] = "Bearer ${ref.getString("token")}";
    return data;
  }

  static Future<bool> clearAll() async {
    var ref = await SharedPreferences.getInstance();
    return ref.clear();
  }
}
