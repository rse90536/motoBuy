import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motobuy/model/car_detail.dart';
import 'package:motobuy/shared/shared_data.dart';

class MotorCardWidget extends StatefulWidget {
  final CarDetail carDetail;

  MotorCardWidget({Key key, @required this.carDetail}) : super(key: key);

  @override
  MotorCardWidgetState createState() => MotorCardWidgetState();
}

class MotorCardWidgetState extends State<MotorCardWidget> {
  CarDetail _carDetail;
  String _imgStr;
  Size _size;
  String _region;
  String _handType;
  String _listingDate;

  @override
  void initState() {
    super.initState();
    _carDetail = widget.carDetail;
    _imgStr = _carDetail.img.split(",").first;
    _region = SharedData.regionDataList.data.firstWhere((element) => element.id == _carDetail.regionId).name;
    _handType = SharedData.handTypeMap[_carDetail.handType.toString()];
    _listingDate = _carDetail.listingDate == null ? "尚未掛牌" : "${_carDetail.listingDate}";
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.all(3),
      padding: EdgeInsets.all(5),
      child: Card(
        child: Container(
          width: _size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.network(
                      'https://www.moto-tp.com/upload/post/${_carDetail.id}/$_imgStr',
                      height: _size.height * 0.3,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "$_region",
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.6),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "$_handType",
                        style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: _size.width,
                      alignment: Alignment.centerRight,
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      child: Text(
                        "\$${_carDetail.money}",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text("${_carDetail.title}",
                        style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold)),
                    Divider(
                      thickness: 1,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      child: Text("排氣量：${_carDetail.cc}cc",
                          style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      child: Text("公里數：${_carDetail.km}km",
                          style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      child: Text("出廠日期：${_carDetail.productionDate}",
                          style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 3),
                      child: Text("掛牌日期：$_listingDate",
                          style: TextStyle(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
