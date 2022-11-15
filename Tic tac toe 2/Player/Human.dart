import 'Player.dart';
import 'Input.dart';

class Human extends Player{
  Input input = Input();

  playerMove () {
    return input.InputMove;
  }
}
