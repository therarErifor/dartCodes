import 'dart:io';


class Input{
  var row;
  var col;
  var grid;
  String symbol = '';

  set setGridInput (GameGrid){
    grid = GameGrid;
  }

  List get InputMove {
    try {
      print('введите строку:');
      row = int.parse(stdin.readLineSync()!);
      print('введите столбец:');
      col = int.parse(stdin.readLineSync()!);
      --row;
      --col;
      while ((row > 2) || (col > 2) || (grid [row] [col] == 'O')
          || (grid [row] [col] == 'X')) {
        print('Пожалуйста, введите другие данные');
        print('введите строку:');
        row = int.parse(stdin.readLineSync()!);
        print('введите столбец:');
        col = int.parse(stdin.readLineSync()!);
        --row;
        --col;
      }
      grid [row] [col] = symbol;
      return grid;
    }
    on FormatException {

      print('Пожалуйста, вводите числа');
      print('введите строку:');
      row = int.parse(stdin.readLineSync()!);
      print('введите столбец:');
      col = int.parse(stdin.readLineSync()!);
      --row;
      --col;
      grid [row] [col] = symbol;
    }
    return grid;

  }
}