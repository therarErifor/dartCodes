import 'Player.dart';
import 'dart:math';

class Bot extends Player{
  BotMove(){
    Random random = Random();
    row = random.nextInt(3);
    col = random.nextInt(3);
    while ((grid [row] [col] == 'X')||(grid [row] [col] == 'O')){
      row = random.nextInt(3);
      col = random.nextInt(3);
    }
    grid [row] [col] = 'O';
  }
}
