import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:motobuy/model/user.dart';

class SharedData {
  static BuildContext mainContext;

  static String serverUrl ="https://www.moto-tp.com/api"  ;
  static String token = "";
  static UserData userData;

}
