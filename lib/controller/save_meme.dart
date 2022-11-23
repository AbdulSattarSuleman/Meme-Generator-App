import 'package:shared_preferences/shared_preferences.dart';

class SaveMyData {
  static String memeKey = "memkey";
  static String? imgUrl;

  static Future<bool> saveData(int val) async {
    final inst = await SharedPreferences.getInstance();
    return inst.setInt(memeKey, val);
  }

  static Future<int?> fetchData() async {
    final inst = await SharedPreferences.getInstance();
    return inst.getInt(memeKey);
  }

  static Future<String?> saveImgUrl(String passImgUrl) async {
    final inst = await SharedPreferences.getInstance();
    imgUrl = passImgUrl;
    return imgUrl;
  }
}
