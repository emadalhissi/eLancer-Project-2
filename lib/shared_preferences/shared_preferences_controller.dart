import 'package:elancer_project_2/models/api/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SPKeys {
  firstVisit,
  loggedIn,
  id,
  name,
  mobile,
  gender,
  cityEn,
  cityAr,
  language,
  theme,
  token
}

class SharedPreferencesController {
  static final SharedPreferencesController _sharedPrefControllerObj =
      SharedPreferencesController._sharedPrefPrivateConstructor();

  SharedPreferencesController._sharedPrefPrivateConstructor();

  late SharedPreferences _sharedPrefLibObj;

  factory SharedPreferencesController() {
    return _sharedPrefControllerObj;
  }

  Future<void> initSharedPreferences() async {
    _sharedPrefLibObj = await SharedPreferences.getInstance();
  }

  Future<void> setLanguage({required String language}) async {
    await _sharedPrefLibObj.setString(SPKeys.language.toString(), language);
  }

  String get checkLanguage =>
      _sharedPrefLibObj.getString(SPKeys.language.toString()) ?? 'en';

  Future<void> setFirstVisit() async {
    await _sharedPrefLibObj.setBool(SPKeys.firstVisit.toString(), false);
  }

  bool get checkFirstVisit =>
      _sharedPrefLibObj.getBool(SPKeys.firstVisit.toString()) ?? true;

  Future<void> save({required User user}) async {
    await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), true);
    await _sharedPrefLibObj.setInt(SPKeys.id.toString(), user.id);
    await _sharedPrefLibObj.setString(SPKeys.name.toString(), user.name);
    await _sharedPrefLibObj.setString(SPKeys.mobile.toString(), user.mobile);
    await _sharedPrefLibObj.setString(SPKeys.gender.toString(), user.gender);
    await _sharedPrefLibObj.setString(
        SPKeys.cityAr.toString(), user.city.nameAr);
    await _sharedPrefLibObj.setString(
        SPKeys.cityEn.toString(), user.city.nameEn);
    await _sharedPrefLibObj.setString(
        SPKeys.token.toString(), 'Bearer ' + user.token);
  }

  bool get loggedIn =>
      _sharedPrefLibObj.getBool(SPKeys.loggedIn.toString()) ?? false;

  Future<bool> logout() async {
    return await _sharedPrefLibObj.setBool(SPKeys.loggedIn.toString(), false);
  }

  Future<bool> clear() async {
    return await _sharedPrefLibObj.clear();
  }
}
