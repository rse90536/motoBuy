import 'dart:io';

import 'package:dio/dio.dart';
import 'package:motobuy/model/user.dart';
import 'package:motobuy/shared/shared_data.dart';
import 'package:motobuy/shared/shared_service.dart';

class UserRepository {
  static Future<bool> signInWithAccount(String account, String password) async {
    SharedService.setDio();
    Response response;
    try {
      response = await SharedService.dio
          .post("/login", data: {"Account": "test90536", "Password": "test90536"});
      if (response.statusCode == HttpStatus.ok) {
        SharedData.token = response.toString();
        return true;
        // await getUserData();
      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }

  static Future<bool> getUserData() async {
    SharedService.dio.options.headers["authorization"] =
        "Bearer ${SharedData.token}";
    Response response;
    try {
      response = await SharedService.dio.get("/getUserData");
      if (response.statusCode == HttpStatus.ok) {
        SharedData.userData = UserData.fromJson(response.data);
        return true;

      } else {
        return false;
      }
    } catch (_) {
      return false;
    }
  }
}
