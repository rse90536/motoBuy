import 'package:equatable/equatable.dart';

class CarDetailData {
  final List<CarDetail> data;

  CarDetailData(this.data);

  factory CarDetailData.fromJson(List<dynamic> jsonParsed) {
    var list = jsonParsed;
    List<CarDetail> dataList = list.map((i) => CarDetail.fromJson(i)).toList();

    return CarDetailData(dataList);
  }
}

class CarDetail extends Equatable {
  final int id;
  final int depotId;
  final int userId;
  final int type;
  final String title;
  final int money;
  final int modelId;
  final String model;
  final int years;
  final String name;
  final int regionId;
  final int handType;
  final int km;
  final int cc;
  final String color;
  final String productionDate;
  final String listingDate;
  final String lineId;
  final String phone;
  final String description;
  final String special;
  final int viewCount;
  final String img;
  final int status;
  final String createdAt;
  final String updatedAt;
  final int collectionId;

  CarDetail({
    this.id,
    this.depotId,
    this.userId,
    this.type,
    this.title,
    this.money,
    this.modelId,
    this.model,
    this.years,
    this.name,
    this.regionId,
    this.handType,
    this.km,
    this.cc,
    this.color,
    this.productionDate,
    this.listingDate,
    this.lineId,
    this.phone,
    this.description,
    this.special,
    this.viewCount,
    this.img,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.collectionId,
  });

  factory CarDetail.fromJson(Map<String, dynamic> parsedJson) {
    return CarDetail(
      id: parsedJson['Id'],
      depotId: parsedJson['Depot_id'],
      name: parsedJson['Name'],
      userId: parsedJson['User_id'],
      type: parsedJson['Type'],
      title: parsedJson['Title'],
      money: parsedJson['Money'],
      modelId: parsedJson['Model_id'],
      model: parsedJson['Model'],
      years: parsedJson['Years'],
      regionId: parsedJson['Region_id'],
      handType: parsedJson['Handtype'],
      km: parsedJson['Km'],
      cc: parsedJson['Cc'],
      color: parsedJson['Color'],
      productionDate: parsedJson['Production_date'],
      listingDate: parsedJson['Listing_date'],
      lineId: parsedJson['Lineid'],
      phone: parsedJson['Phone'],
      description: parsedJson['Description'],
      special: parsedJson['Special'],
      viewCount: parsedJson['View_count'],
      img: parsedJson['Img'],
      status: parsedJson['Status'],
      createdAt: parsedJson['Created_at'],
      updatedAt: parsedJson['Updated_at'],
      collectionId: parsedJson['Collection_id'],
    );
  }

  @override
  List<Object> get props => [
        id,
        depotId,
        userId,
        type,
        title,
        money,
        modelId,
        model,
        years,
        name,
        regionId,
        handType,
        km,
        cc,
        color,
        productionDate,
        listingDate,
        lineId,
        phone,
        description,
        special,
        viewCount,
        img,
        status,
        createdAt,
        updatedAt,
        collectionId,
      ];
}
