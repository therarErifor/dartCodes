import 'dart:io';
import 'Field.dart';
import 'Player/Human.dart';
import 'Player/Bot.dart';
import 'StateGame.dart';
import 'View.dart';

main(){
  Game game = Game();
  game.Start();
}

class Game{
  StateGame stateGame = StateGame();
  Field field = Field();
  View view = View();
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
      _classicGame();
    }else if (value == 'm'){
      _customGame();
    }
  }

  _classicGame(){
    do {
      print('\n Ходит игрок');
      human.setGrid = grid;
      view.output(human.FirstHumanMove);
      print('\n Ходит бот');
      bot.setGrid = grid;
      view.output(bot.BotMove);
    }
    while (field.Check(grid) == 'nobody');

    if (field.Check(grid) == 'FirstPlayer') {
      print('Вы победили! \n игровое поле:');
      view.output(grid);
    }
    if (field.Check(grid) == 'SecondPlayer') {
      print('Вы проиграли! \n игровое поле:');
      view.output(grid);
    }
    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }

  _customGame(){
    Human human2 = Human();

    do {
      print('\n ходит Крестик');
      human.setGrid = grid;
      view.output(human.FirstHumanMove);
      print('\n ходит Нолик');
      human2.setGrid = grid;
      view.output(human2.SecondHumanMove);
      var whoWon = field.Check(grid);

      if (whoWon == 'FirstPlayer') {
        print("Победил Крестик!");
        view.output(grid);
        break;
      }else
      if (whoWon == 'SecondPlayer') {
        print('Победил Нолик!');
        break;
      }
    }
    while (field.whoWon == 'nobody');

    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }
}

