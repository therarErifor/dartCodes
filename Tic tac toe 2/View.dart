import 'dart:io';
class View{
  output(List grid){
    for (var n in grid) {
      stdout.write(n);
      print('');
    }
  }
}