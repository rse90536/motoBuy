class CarTypeData {
  final List<CarType> data;

  CarTypeData(this.data);

  factory CarTypeData.fromJson(List<dynamic> jsonParsed) {
    var list = jsonParsed;
    List<CarType> dataList = list.map((i) => CarType.fromJson(i)).toList();

    return CarTypeData(dataList);
  }
}

class CarType {
  final int id;
  final String name;
  CarType({
    this.id,
    this.name,
  });
  factory CarType.fromJson(Map<String, dynamic> parsedJson) {
    return CarType(
      id: parsedJson['Id'],
      name: parsedJson['Name'],
    );
  }
}
