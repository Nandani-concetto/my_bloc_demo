import 'dart:convert';

import 'package:my_bloc_demo/models/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends SharedPreferenceRepository {
  final String _userDetails = "user_details";
  late SharedPreferences _pref;
  late Details user;

  @override
  Future<Details> getUserDetail() async {
    String userDetail = _pref.getString(_userDetails) ?? "";

    if (userDetail != null && userDetail.isNotEmpty) {
      var jsonDecoded = jsonDecode(userDetail);
      user = Details.fromJson(jsonDecoded);
    }
    return user;
  }

  @override
  Future<bool> clearData() async {
    return _pref.clear();
  }

  initPreference() async {
    _pref = await SharedPreferences.getInstance();
  }
}

abstract class SharedPreferenceRepository {
  Future<Details> getUserDetail();

  Future<bool> clearData();
}