import 'dart:io';
import 'dart:convert';

void main(){
  print("Введите данные об автомобиле");
  Car tom = Car();
  print("Марка автомобиля:");
  tom.brand = stdin.readLineSync();
  print("Модель автомобиля:");
  tom.model = stdin.readLineSync();
  print("Цвет автомобиля:");
  tom.color = stdin.readLineSync();
  print("Госномер автомобиля");
  tom.carNumber = stdin.readLineSync();
  print("Имя владельца");
  tom.carOwnerName = stdin.readLineSync();

  String jsonCar = jsonEncode(tom);
  print(jsonCar);

  //tom.display();

}
class Car {
  String? brand, model, color, carNumber, carOwnerName;
 /*
  void display(){
    print("brand: $brand\n model: $model\n color: $color\n num: $num\n name: $name");
  }
  */
  Car({this.brand, this.color, this.model, this.carNumber, this.carOwnerName});

  Map toJson() => {
    "brand\n" : brand,
    "model\n" : model,
    "color\n" : color,
    "carNumber\n" : carNumber,
    "carOwnerName\n" : carOwnerName,
  };
}
/*
  Map<String, dynamic> toJson() {
    return {
      "brand" : brand,
      "model" : model,
      "color" : color,
      "num" : num,
      "ownName" : ownName,
    };
  }
*/
