import 'dart:io';

void main(){
  print("Введите данные об автомобиле");
  Car tom = Car();
  print("brand");
  tom.brand = stdin.readLineSync();
  print("model");
  tom.model = stdin.readLineSync();
  print("color");
  tom.color = stdin.readLineSync();
  print("num");
  tom.num = stdin.readLineSync();
  print("name");
  tom.name = stdin.readLineSync();
  tom.display();

}
class Car {
  String? brand, model, color, num, name;
  void display(){
    print("brand: $brand\n model: $model\n color: $color\n num: $num\n name: $name");
  }


  Car({this.brand, this.color, this.model, this.num, this.name});
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
