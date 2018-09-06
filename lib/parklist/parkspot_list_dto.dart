import 'package:flutter_taipei_park_example/parklist/parkspot_list_item_dto.dart';

class ParkSpotListDTO {
  final int offset;
  final int limit;
  final int count;
  final String sort;
  final List<ParkSpotListItemDTO> results;

  ParkSpotListDTO({
    this.offset,
    this.limit,
    this.count,
    this.sort,
    this.results,
  });

  ParkSpotListDTO.fromJson(Map<String, dynamic> jsonMap)
      : offset = jsonMap['offset'],
        limit = jsonMap['limit'],
        count = jsonMap['count'],
        sort = jsonMap['sort'],
        results = (jsonMap['results'] as List)
            .map((e) => new ParkSpotListItemDTO.fromJson(e))
            .toList();

  Map<String, dynamic> toJson() => {
    'offset': offset,
    'limit': limit,
    'count': count,
    'sort': sort,
    'results': results,
  };
}