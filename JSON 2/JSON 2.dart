import 'dart:io';
import 'dart:convert';

void main ()async{
  const jsonString =
      '{"brand": "Toyota", "model": "Corolla", "color": "Red", '
      '"carNumber": "re123r", "carOwnerName": "Victor"}';

  var file = new File('Test.txt');
  //var sink = f.openWrite(mode: FileMode.append);
  var sink = file.openWrite();
  var contents;
  sink.write(jsonString);
  sink.close();
  if (await file.exists()){
    //read file
    contents = await file.readAsString();
  }
  print(contents);

  final Map<String, dynamic> data = jsonDecode(contents);
  var car = Car.fromJson(data);

  print(car.brand);
  print(car.model);
  print(car.color);
  print(car.carNumber);
  print(car.carOwnerName);

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
