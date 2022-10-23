import 'dart:io';
import 'dart:convert';

void main (){
  const jsonString =
      '{"brand": "Toyota", "model": "Corolla", "color": "Red", '
      '"carNumber": "re123r", "carOwnerName": "Victor"}';
  final Map<String, dynamic> data = jsonDecode(jsonString);
  var car = Car.fromJson(data);
  print(data);


  var f = new File('Test.txt');
  //var sink = f.openWrite(mode: FileMode.append);
  var sink = f.openWrite();
  sink.write(data);
  sink.close();
  // f.writeAsStringSync(car.brand);
  // f.writeAsStringSync(car.model);
  // f.writeAsStringSync(car.color);
  // f.writeAsStringSync(car.carNumber);
  // f.writeAsStringSync(car.carOwnerName);
}

class Car {
  final String brand;
  final String model;
  final String color;
  final String carNumber;
  final String carOwnerName;

  Car({required this.brand, required this.color, required this.model,
    required this.carNumber, required this.carOwnerName});

  // Map<String, dynamic> toJson() {
  //   return {
  //     "brand": brand,
  //     "model": model,
  //     "color": color,
  //     "carNumber": carNumber,
  //     "carOwnerName": carOwnerName,
  //   };
  // }

  factory Car.fromJson(Map<String, dynamic> car) {
    return Car(brand: car["brand"], color: car["color"],  model: car["model"],
        carNumber: car["carNumber"], carOwnerName: car["carOwnerName"]);
  }
}
