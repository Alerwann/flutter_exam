import 'package:shared_preferences/shared_preferences.dart';

class ProfilStorageService {
  static const String _pseudo = 'pseudo';
  static const String _city = 'city';

  static Future<bool> savePseudo(String pseudo) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_pseudo, pseudo);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> saveCity(String city) async {
    print("je débute le save");
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_city, city);
        print("ok");
      return true;
    
    } catch (e) {
        print("non");
      return false;
    }
  }

  static Future<String> getPseudo() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_pseudo) ?? 'Inconnu';
    } catch (e) {
      return 'Inconnu';
    }
  }

  static Future<String> getCity() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_city) ?? 'Paris';
    } catch (e) {
      return 'Paris';
    }
  }
}
