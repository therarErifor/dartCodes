import 'dart:io';
import 'Player.dart';

class Human extends Player{
  HumanMove() {
    print('введите строку:');
    row = int.parse(stdin.readLineSync()!);
    print('введите столбец:');
    col = int.parse(stdin.readLineSync()!);
    --row;
    --col;
    while ((row > 2)||(col > 2)||(grid [row] [col] == 'O') || (grid [row] [col] == 'X')){
      print('Пожалуйста, введите другие данные');
      print('введите строку:');
      row = int.parse(stdin.readLineSync()!);
      print('введите столбец:');
      col = int.parse(stdin.readLineSync()!);
      --row;
      --col;
    }
    grid [row] [col] = 'X';
    row = 0;
    col = 0;
  }
}
