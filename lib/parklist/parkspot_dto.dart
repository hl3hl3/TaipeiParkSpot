import 'package:flutter_taipei_park_example/parklist/parkspot_list_dto.dart';

class ParkSpotDTO {
  final ParkSpotListDTO result;

  ParkSpotDTO({
    this.result,
  });

  ParkSpotDTO.fromJson(Map<String, dynamic> jsonMap)
      : result = new ParkSpotListDTO.fromJson(jsonMap['result']);

  Map<String, dynamic> toJson() => {'result': result};
}
