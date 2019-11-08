import "package:localstorage/localstorage.dart";
import "package:shared_preferences/shared_preferences.dart";

class AppStorage {
  final LocalStorage storage = new LocalStorage("app-storage");

  final String IS_LOGGIN_KEY = "isLoggedin";
  final String STORE_AUTH = "store-auth";
  final String STORE_INTERNAL_ID = "store-internal-id";

  final String STORE_TOKEN = "store-token";
  Future<bool> storeAuth(auth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(auth);
    print(prefs);
    prefs.setBool(IS_LOGGIN_KEY, true);
    prefs.setString(STORE_INTERNAL_ID, auth['internal_id']);
    prefs.setString(STORE_TOKEN, auth['token']);

//    await storage.setItem(IS_LOGGIN_KEY, true);
//    await storage.setItem(STORE_AUTH, auth);

    return true;
  }

  Future<dynamic> getStoreAuth() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map auth;

    if (prefs.get(IS_LOGGIN_KEY)) {
      auth = {
        "token": prefs.get(STORE_TOKEN),
        "internal_id": prefs.get(STORE_INTERNAL_ID),
        "isLoggedin": prefs.get(IS_LOGGIN_KEY)
      };
    } else {
      auth = null;
    }
//    Map auth = await storage.getItem(STORE_AUTH);
    return auth;
  }
//
//  Future<bool> invalidateStoreAuth() async {
//    await storage.deleteItem(STORE_AUTH);
//    await storage.deleteItem(IS_LOGGIN_KEY);
//  }
}
