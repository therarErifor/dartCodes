import "dart:io";

class Field{

  output(List grid){
    for (var n in grid) {
      stdout.write(n);
      print('');
    }
  }
}