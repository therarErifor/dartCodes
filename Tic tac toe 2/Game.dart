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
    String whoWon = '';

    do {

      human.setGrid = grid;
      print('\n Ходит игрок');
      view.output(human.FirstHumanMove);
      whoWon = field.Check(grid);
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }

      if (whoWon == 'FirstPlayer') {
        print('Вы победили!');
        break;
      }

      bot.setGrid = grid;
      print('\n Ходит бот');
      view.output(bot.BotMove);
      whoWon = field.Check(grid);

      if (whoWon == 'SecondPlayer') {
        print('Вы проиграли!');
        break;
      }
    }

    while ((whoWon == 'nobody')|(whoWon == 'full'));
    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }

  _customGame(){
    Human human2 = Human();
    String whoWon = '';

    do {
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }
      print('\n ходит Крестик');
      human.setGrid = grid;
      view.output(human.FirstHumanMove);
      whoWon = field.Check(grid);
      if (whoWon == 'FirstPlayer') {
        print("Победил Крестик!");
        view.output(grid);
        break;
      }
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }
      print('\n ходит Нолик');
      human2.setGrid = grid;
      view.output(human2.SecondHumanMove);
      whoWon = field.Check(grid);
      if (whoWon == 'SecondPlayer') {
        print('Победил Нолик!');
        break;
      }
    }
    while ((whoWon == 'nobody')|(whoWon == 'full'));

    print('Подтвердите выход');
    var exit = stdin.readLineSync()!;
  }
}

