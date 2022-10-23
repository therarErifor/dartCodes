import 'dart:convert';

/*
void main(){
  print("Введите данные об автомобиле");
  var brand = check(text:"Марка");
  var model = check(text: "Модель");
  var color = check(text:"Цвет");
  var carNumber = check(text: "Госномер" );
  var carOwnerName = check(text: "Имя владельца");

  Car tom = Car(brand: brand, model: model, color: color,
      carNumber: carNumber, carOwnerName: carOwnerName);

  String jsonCar = jsonEncode(tom);
  print(jsonCar);

}

check({var text, data}) {
  print("$text автомобиля:");
  data = stdin.readLineSync()!;
  text = text.toLowerCase();
  while (data == "") {
    print("Пожалуйста, введите $text автомобиля!:");
    data = stdin.readLineSync()!;
  };
  return data;
}
*/
void main (){
  const jsonString =
      '{"brand": "Toyota", "model": "Corolla", "color": "Red", '
      '"carNumber": "re123r", "carOwnerName": "Victor"}';
  final data = jsonDecode(jsonString);
  print(data["brand"]);
  print(data["model"]);
  print(data["color"]);
  print(data["carNumber"]);
  print(data["carOwnerName"]);
}

/*
class Car {

  Map<String, dynamic> toJson() {
    return {
      "brand": "toyota",
      "model": "corolla",
      "color": "red",
      "carNumber": "re123r",
      "carOwnerName": "Victor",
    };
  }
  jsonDecode(){
    "brand": brand,
    "model": "re",
    "color": "re",
    "carNumber": "re",
    "carOwnerName": "re",
  };
}
*/