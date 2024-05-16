import 'package:hive/hive.dart';

part 'coordinates.g.dart';

@HiveType(typeId: 2)
class Coordinates extends HiveObject {
  @HiveField(0)
  final double lat;
  @HiveField(1)
  final double lng;

  Coordinates({
    required this.lat,
    required this.lng,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
