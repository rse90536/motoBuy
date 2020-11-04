class DepotData {
  final List<Depot> data;

  DepotData(this.data);

  factory DepotData.fromJson(List<dynamic> jsonParsed) {
    var list = jsonParsed;
    List<Depot> dataList = list.map((i) => Depot.fromJson(i)).toList();

    return DepotData(dataList);
  }
}

class Depot {
  final int id;
  final String name;
  Depot({
    this.id,
    this.name,
  });
  factory Depot.fromJson(Map<String, dynamic> parsedJson) {
    return Depot(
      id: parsedJson['Id'],
      name: parsedJson['Name'],
    );
  }
}
