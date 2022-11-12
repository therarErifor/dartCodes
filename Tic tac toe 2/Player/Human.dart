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

}
