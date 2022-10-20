import 'dart:io';
import 'dart:convert';

void main(){

  print("Введите данные об автомобиле");

  print("Марка автомобиля:");
  var brand = stdin.readLineSync()!;
  print("Модель автомобиля:");
  var model = stdin.readLineSync()!;
  print("Цвет автомобиля:");
  var color = stdin.readLineSync()!;
  print("Госномер автомобиля");
  var carNumber = stdin.readLineSync()!;
  print("Имя владельца");
  var carOwnerName = stdin.readLineSync()!;

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
