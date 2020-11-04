class CarModelData {
  final List<CarModel> data;

  CarModelData(this.data);

  factory CarModelData.fromJson(List<dynamic> jsonParsed) {
    var list = jsonParsed;
    List<CarModel> dataList = list.map((i) => CarModel.fromJson(i)).toList();

    return CarModelData(dataList);
  }
}

class CarModel {
  final int id;
  final String depotId;
  final String name;

  CarModel( {
    this.id,
    this.depotId,
    this.name,
  });
  factory CarModel.fromJson(Map<String, dynamic> parsedJson) {
    return CarModel(
      id: parsedJson['Id'],
      depotId: parsedJson['Depot_id'],
      name: parsedJson['Name'],
    );
  }
}
