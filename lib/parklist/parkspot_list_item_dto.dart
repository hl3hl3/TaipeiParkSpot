class ParkSpotListItemDTO {
  final String id;
  final String ParkName;
  final String Name;
  final String YearBuilt;
  final String OpenTime;
  final String Image;
  final String Introduction;

  ParkSpotListItemDTO({
    this.id,
    this.ParkName,
    this.Name,
    this.YearBuilt,
    this.OpenTime,
    this.Image,
    this.Introduction,
  });

  ParkSpotListItemDTO.fromJson(Map<String, dynamic> jsonMap)
      : id = jsonMap['_id'],
        ParkName = jsonMap['ParkName'],
        Name = jsonMap['Name'],
        YearBuilt = jsonMap['YearBuilt'],
        OpenTime = jsonMap['OpenTime'],
        Image = jsonMap['Image'],
        Introduction = jsonMap['Introduction'];

  Map<String, dynamic> toJson() => {
    '_id': id,
    'ParkName': ParkName,
    'Name': Name,
    'YearBuilt': YearBuilt,
    'OpenTime': OpenTime,
    'Image': Image,
    'Introduction': Introduction,
  };
}