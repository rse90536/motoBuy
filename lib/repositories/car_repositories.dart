import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:motobuy/model/car_detail.dart';
import 'package:motobuy/model/region.dart';
import 'package:motobuy/shared/shared_service.dart';

class CarRepository {
  Future<CarDetailData> getNewestCarList() async {
    SharedService.setDio();
    Response response;
    // List<CarDetail> carDetailsList;
    CarDetailData carDetailsList;

    response = await SharedService.dio.get(
      "/getNewPost",
    );
    if (response.statusCode == HttpStatus.ok) {
      String str = json.encode(response.data);
      List<dynamic> responseList = json.decode(str);
      carDetailsList = CarDetailData.fromJson(responseList);

      // var data = json.decode(response.data.toString());
      // response.data.toString();
      // data.map((carDetails)=>carDetailsList.add(CarDetail.fromJson(carDetails))).toList();
      return carDetailsList;
      // await getUserData();
    } else {
      throw NetworkException();
    }
  }

  Future<RegionData> getRegionList() async {
    SharedService.setDio();
    Response response;
    RegionData regionDataList;

    response = await SharedService.dio.get(
      "/getRegion",
    );
    if (response.statusCode == HttpStatus.ok) {
      String str = json.encode(response.data);
      List<dynamic> responseList = json.decode(str);
      regionDataList = RegionData.fromJson(responseList);

      // var data = json.decode(response.data.toString());
      // response.data.toString();
      // data.map((carDetails)=>carDetailsList.add(CarDetail.fromJson(carDetails))).toList();
      return regionDataList;
      // await getUserData();
    } else {
      throw NetworkException();
    }
  }
}

class NetworkException implements Exception {}
