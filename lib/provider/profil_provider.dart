import 'package:dailyfamilymessage/services/profil_storage_service.dart';
import 'package:flutter/foundation.dart';

class ProfilProvider extends ChangeNotifier {
  String _pseudo = 'Inconnu';

  String _city = 'Paris';

  String get city => _city;

  String get pseudo => _pseudo;

  ProfilProvider() {
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      _pseudo = await ProfilStorageService.getPseudo();
      print('init pseudo : $_pseudo');
      _city = await ProfilStorageService.getCity();
    } catch (e) {
      if (kDebugMode) {
        print("load error : $e");
      }
    }
  }

  Future<bool> setPseudo(String pseudo) async {
    final oldpseudo = _pseudo;
    _pseudo = pseudo;

    final success = await ProfilStorageService.savePseudo(_pseudo);
    if (!success) {
      _pseudo = oldpseudo;
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<bool> resetPseudo() async {
    _pseudo = 'Inconnu';
    return await setPseudo(_pseudo);
  }

  Future<bool> setCity(String city) async {
    final oldCity = city;
    _city = city;
    final success = await ProfilStorageService.saveCity(_city);
    if (!success) {
      _city = oldCity;
      return false;
    }
    notifyListeners();
    return true;
  }

  Future<(bool, bool)> setAll(String pseudo, String city) async {
    final cityBool = await setCity(city);
    final pseudoBool = await setPseudo(pseudo);
    return (cityBool, pseudoBool);
  }

  Future<bool> resetCity() async {
    _city = 'Paris';
    return await setCity(_pseudo);
  }

  Future<bool> resetAll() async {
    final pseudoSuccess = await resetPseudo();
    final citysuccess = await resetCity();

    if (!pseudoSuccess || !citysuccess) {
      print("❌ Erreur lors de la réinitialisation");
    }

    return pseudoSuccess && citysuccess;
  }
}
