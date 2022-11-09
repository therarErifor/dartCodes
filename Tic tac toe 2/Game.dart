import 'dart:io';
import 'Field.dart';
import 'Player/Human.dart';
import 'Player/Bot.dart';
import 'StateGame.dart';


main(){
  Game game = Game();
  game.Start();

}

class Game{
  StateGame stateGame = StateGame();
  Field field = Field();
  Human human = Human();
  Bot bot = Bot();
  var grid;
  var value = 's';

  Start() {
    grid = stateGame.generateArray;
    print('Если хотите начать стандартную игру с ботом, введите "s"; \n'
        ' если хотите играть с другим человеком, введите "m"');
    value = stdin.readLineSync()!;
    if (value == 's') {
      classicGame();
    }else if (value == 'm'){
      customGame();
    }
  }

  classicGame(){
    do {
      print('\n Ходит игрок');
      human.setGrid = grid;
      field.output(human.HumanMove);
      print('\n Ходит бот');
      bot.setGrid = grid;
      field.output(bot.BotMove);
      print('');
      var checkList = stateGame.Check(grid);
      var checkHuman = checkList[0];
      var checkBot = checkList[1];
      if (checkHuman == true) {
        print("Вы победили! \n игровое поле:");
        field.output(grid);
        break;
      } else if (checkBot == true) {
        print('Вы проиграли! \n игровое поле:');
        field.output(grid);
        break;
      }
    }
    while ((stateGame.cond != true) | (stateGame.condBot != true));
    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }

  customGame(){
    Human human2 = Human();

    do {
      print('\n ходит Крестик');
      human.setGrid = grid;
      field.output(human.HumanMove);
      print('\n ходит Нолик');
      human2.setGrid = grid;
      field.output(human2.HumanMove2);
      var checkList = stateGame.Check(grid);
      var checkHuman = checkList[0];
      var checkBot = checkList[1];
      if (checkHuman == true) {
        print("Победил Крестик!");
        field.output(grid);
        break;
      } else if (checkBot == true) {
        print('Победил Нолик!');
        break;
      }
    }
    while ((stateGame.cond != true) | (stateGame.condBot != true));
    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }
}

