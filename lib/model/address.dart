import 'package:hive/hive.dart';
import 'package:task/model/coordinates.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
class Address extends HiveObject {
  @HiveField(0)
  final String address;

  @HiveField(1)
  final String city;

  @HiveField(2)
  final Coordinates coordinates;

  @HiveField(3)
  final String postalCode;

  @HiveField(4)
  final String state;

  Address({
    required this.address,
    required this.city,
    required this.coordinates,
    required this.postalCode,
    required this.state,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json['address'],
      city: json['city'],
      coordinates: Coordinates.fromJson(json['coordinates']),
      postalCode: json['postalCode'],
      state: json['state'],
    );
  }
}
