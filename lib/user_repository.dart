import 'dart:io';

import 'package:dio/dio.dart';
import 'package:motobuy/model/user.dart';
import 'package:motobuy/shared/shared_data.dart';
import 'package:motobuy/shared/shared_service.dart';

abstract class UserRepository {
  Future<void> getToken(String account, String password);

  Future<UserData> getUserData(String token);
}

class GetUserRepository implements UserRepository {
  @override
  // Future<Weather> fetchWeather(String cityName) {
  //   // Simulate network delay
  //   return Future.delayed(
  //     Duration(seconds: 1),
  //         () {
  //       final random = Random();
  //
  //       // Simulate some network exception
  //       if (random.nextBool()) {
  //         throw NetworkException();
  //       }
  //
  //       // Return "fetched" weather
  //       return Weather(
  //         cityName: cityName,
  //         // Temperature between 20 and 35.99
  //         temperatureCelsius: 20 + random.nextInt(15) + random.nextDouble(),
  //       );
  //     },
  //   );
  // }

  @override
  Future<UserData> getToken(String account, String password) async {
    SharedService.setDio();
    Response response;
    response = await SharedService.dio
        .post("/login", data: {"Account": account, "Password": password});
    if (response.statusCode == HttpStatus.ok) {
      String token = response.toString();
      SharedData.token = token;
      return await getUserData(token);
      // await getUserData();
    } else {
      throw NetworkException();
    }
  }

  @override
  Future<UserData> getUserData(String token) async {
    SharedService.dio.options.headers["authorization"] = "Bearer $token";
    Response response;
    response = await SharedService.dio.get("/getUserData");
    if (response.statusCode == HttpStatus.ok) {
      UserData userData = UserData.fromJson(response.data);
      SharedData.userData = userData;
      return userData;
    } else {
      throw NetworkException();
    }
  }
}

class NetworkException implements Exception {}
