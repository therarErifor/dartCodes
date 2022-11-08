import 'dart:io';
import 'Field.dart';
import 'Player/Player.dart';
import 'Player/Human.dart';
import 'Player/Bot.dart';
import 'StateGame.dart';


main(){
  Game game = Game();
  game.run();

}


class Game{
  StateGame stateGame = StateGame();
  Field field = Field();
  Human human = Human();
  Bot bot = Bot();

  var row;
  var col;
  var grid;

  run(){
    grid = stateGame.generateArray;
    do {

      human.setGrid = grid;
      field.output(human.HumanMove);
      print('');
      bot.setGrid = grid;
      field.output(bot.BotMove);
      var checkList = stateGame.Check(grid);
      var checkHuman = checkList[0];
      var checkBot = checkList[1];
    if(checkHuman == true){
      print("Вы победили!");
      break;
    }else
    if (checkBot == true){
    print('Вы проиграли');
    break;
    }
  }
  while ((stateGame.cond != true) | (stateGame.condBot != true));
  print('Подтвердите выход');
  var exit = stdin.readLineSync()!;
  }
}