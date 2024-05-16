import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:task/model/address.dart';

part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String lastName;

  @HiveField(3)
  final int age;

  @HiveField(4)
  final String gender;

  @HiveField(5)
  final String email;

  @HiveField(6)
  final String phone;

  @HiveField(7)
  final String birthDate;

  @HiveField(8)
  final String image;

  @HiveField(9)
  final Address address;
  @HiveField(10)
  Uint8List? imageBytes; 

  User({
    required this.id,
    required this.name,
    required this.lastName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.image,
    required this.address,
     this.imageBytes,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['firstName'],
      lastName: json['lastName'],
      age: json['age'],
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      birthDate: json['birthDate'],
      image: json['image'],
      address: Address.fromJson(json['address']),
    );
  }
}
