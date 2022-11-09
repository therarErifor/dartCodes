import 'dart:io';
import 'Player.dart';
import 'Input.dart';

class Human extends Player{
  Input FirstHuman = Input();
  Input SecondHuman = Input();


  set setGrid (GameGrid){
    grid = GameGrid;
  }


  List get FirstHumanMove {
    FirstHuman.symbol = 'X';
    FirstHuman.setGridInput = grid;
    return FirstHuman.InputMove;
  }

  List get SecondHumanMove {
    FirstHuman.symbol = 'O';
    FirstHuman.setGridInput = grid;
    return FirstHuman.InputMove;
  }
  // List get HumanMove2 {
  //   print('введите строку:');
  //   row = int.parse(stdin.readLineSync()!);
  //   print('введите столбец:');
  //   col = int.parse(stdin.readLineSync()!);
  //   --row;
  //   --col;
  //   while ((row > 2)||(col > 2)||(grid [row] [col] == 'O')
  //       || (grid [row] [col] == 'X')){
  //     print('Пожалуйста, введите другие данные');
  //     print('введите строку:');
  //     row = int.parse(stdin.readLineSync()!);
  //     print('введите столбец:');
  //     col = int.parse(stdin.readLineSync()!);
  //     --row;
  //     --col;
  //   }
  //   grid [row] [col] = 'O';
  //   return grid;
  // }
}
