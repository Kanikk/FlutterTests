import 'package:flutter/material.dart';

class Car {
  int id;
  int mileage;
  Color color;
  CarBrand brand;
  bool isCarNew = false;
  static int idCount = 0;

  Car({
    this.color = Colors.red,
    this.brand = CarBrand.kiwi,
    this.mileage = 0,
    this.isCarNew = true,
  }) : id = idGenerator;

  Car.red({
    this.brand = CarBrand.kiwi,
    this.mileage = 0,
  })  : color = Colors.red,
        id = idGenerator;

  bool get isBrandNew => mileage == 0;

  String get milageKM => "$mileage km";

  static int get idGenerator {
    idCount++;
    return idCount;
  }
}

enum CarBrand { ford, volvo, kiwi }

extension CarBrandExtension on CarBrand {
  String get displayTile {
    switch (this) {
      case CarBrand.volvo:
        return "Brand: Volvo";
      case CarBrand.kiwi:
        return "Brand: Kiwi";
      case CarBrand.ford:
        return "Brand: Ford";
      default:
        return "Nothing";
    }
  }
}

List<Car> carsList = [
  Car(color: Colors.red, brand: CarBrand.ford, mileage: 0, isCarNew: true),
  Car(color: Colors.blue, brand: CarBrand.volvo, mileage: 100, isCarNew: true),
  Car(color: Colors.red, brand: CarBrand.kiwi, mileage: 200, isCarNew: false)
];