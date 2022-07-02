import 'dart:ffi';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserSimplePreferences{
  static const  _keyNumber ='0';
  static  SharedPreferences _preferences;
  static Future init() async =>
      _preferences=await SharedPreferences.getInstance();
  static Future setNumber(int amountGathered) async =>
      await _preferences.setInt(_keyNumber, amountGathered);
  static int getNumber()=>_preferences.getInt(_keyNumber);
}

