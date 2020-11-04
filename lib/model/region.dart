class RegionData {
  final List<Region> data;

  RegionData(this.data);

  factory RegionData.fromJson(List<dynamic> jsonParsed) {
    var list = jsonParsed;
    List<Region> dataList = list.map((i) => Region.fromJson(i)).toList();

    return RegionData(dataList);
  }
}

class Region {
  final int id;
  final String name;
  Region({
    this.id,
    this.name,
  });
  factory Region.fromJson(Map<String, dynamic> parsedJson) {
    return Region(
      id: parsedJson['Id'],
      name: parsedJson['Name'],
    );
  }
}
