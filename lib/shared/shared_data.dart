import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:motobuy/model/region.dart';
import 'package:motobuy/model/user.dart';

class SharedData {
  static BuildContext mainContext;

  static String serverUrl ="https://www.moto-tp.com/api"  ;
  static String token = "";
  static UserData userData;
  static RegionData regionDataList;
  static Map<String,String>  handTypeMap = {"1":"新車","2":"一手","3":"二手"};

}
