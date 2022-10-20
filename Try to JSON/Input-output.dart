import 'dart:io';
import 'dart:convert';

void main(){

  print("Введите данные об автомобиле");

  print("Марка автомобиля:");

  var brand = stdin.readLineSync()!;
  while (brand == ""){
    print("Пожалуйста, введите марку автомобиля!:");
    brand = stdin.readLineSync()!;
  };

  print("Модель автомобиля:");
  var model = stdin.readLineSync()!;
  while (model == ""){
    print("Пожалуйста, введите модель автомобиля!:");
    model = stdin.readLineSync()!;
  };

  print("Цвет автомобиля:");
  var color = stdin.readLineSync()!;
  while (color == ""){
    print("Пожалуйста, введите цвет автомобиля!:");
    color = stdin.readLineSync()!;
  };

  print("Госномер автомобиля:");
  var carNumber = stdin.readLineSync()!;
  while (carNumber == ""){
    print("Пожалуйста, введите госномер автомобиля!:");
    carNumber = stdin.readLineSync()!;
  };

  print("Имя владельца автомобиля:");
  var carOwnerName = stdin.readLineSync()!;
  while (carOwnerName == ""){
    print("Пожалуйста, введите имя владельца автомобиля!:");
    carOwnerName = stdin.readLineSync()!;
  };

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
