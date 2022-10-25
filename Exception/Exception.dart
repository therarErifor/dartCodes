import 'dart:io';
import 'dart:convert';
void main(){
  enterThePath();
}

//Copy this path's:
//correct.json
//json_with_syntax_error.json

enterThePath()async{
              // this is where the JSON file is read and serialized

  print("Enter the path, please");
  var path = stdin.readLineSync()!;
  // print(path);
  var contents = await File(path).readAsString();
  // print(contents);

  try {       //exception operation
    final Map<String, dynamic> data = jsonDecode(contents);
    var car = Car.fromJson(data);
              // information about the car is displayed
  print(car.brand);
  print(car.model);
  print(car.color);
  print(car.carNumber);
  print(car.carOwnerName);
  }
  catch(e){
    print("the file format is incorrect!");
  }
}

class Car {
  final String brand;
  final String model;
  final String color;
  final String carNumber;
  final String carOwnerName;

  Car({required this.brand, required this.color, required this.model,
    required this.carNumber, required this.carOwnerName});

  factory Car.fromJson(Map<String, dynamic> car) {
    return Car(brand: car["brand"], color: car["color"],  model: car["model"],
        carNumber: car["carNumber"], carOwnerName: car["carOwnerName"]);
  }
}