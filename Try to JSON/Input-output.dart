import 'dart:io';
import 'dart:convert';

void main(){

  print("Введите данные об автомобиле");

  print("Марка автомобиля:");
  dynamic brand = stdin.readLineSync();
  print("Модель автомобиля:");
  dynamic model = stdin.readLineSync();
  print("Цвет автомобиля:");
  dynamic color = stdin.readLineSync();
  print("Госномер автомобиля");
  dynamic carNumber = stdin.readLineSync();
  print("Имя владельца");
  dynamic carOwnerName = stdin.readLineSync();

  Car tom = Car(brand: brand, model: model, color: color,
  carNumber: carNumber, carOwnerName: carOwnerName);

  String jsonCar = jsonEncode(tom);
  print(jsonCar);
}
class Car {
  final String brand;
  final String model;
  final String color;
  final String carNumber;
  final String carOwnerName;

  Car({required this.brand, required this.color, required this.model,
    required this.carNumber, required this.carOwnerName});

  Map<String, dynamic> toJson() {
    return {
      "brand": brand,
      "model": model,
      "color": color,
      "carNumber": carNumber,
      "carOwnerName": carOwnerName,
    };
  }
}
