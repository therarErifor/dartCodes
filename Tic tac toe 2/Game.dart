import 'dart:io';
import 'Field.dart';
import 'Player/Human.dart';
import 'Player/Bot.dart';
import 'Player/Player.dart';
import 'StateGame.dart';
import 'View.dart';


main(){
  Game game = Game();
  game.Start();
}
class Game{
  StateGame stateGame = StateGame();
  Field field = Field(size: 3);
  View view = View();
  Player player1 = Human();
  Player player2 = Human();
  Player bot = Bot();
  var value = 's';

  Start() {
    print('Если хотите начать стандартную игру с ботом, введите "s"; \n'
      ' если хотите играть с другим человеком, введите "m"');
  value = stdin.readLineSync()!;
    if (value == 's') {
      _classicGame();
    }else if (value == 'm'){
      _customGame();
    }
  }

  _classicGame() {
    String whoWon = '';
    List grid = field.FieldGenerate();
    player1.symbol = 1;
    bot.symbol = 2;
    do {

      print('\n Ходит игрок');
      var move = player1.playerMove();
      while (grid[move[0]][move[1]] == 1 || grid[move[0]][move[1]] == 2)
      {
        print('Пожалуйста, введите другие данные');
        move = player1.playerMove();
      }
      view.output(stateGame.state(grid, move, player1.symbol));
      field.setGrid = stateGame.state(grid, move, player1.symbol);

      whoWon = Check(grid);
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }

      if (whoWon == 'FirstPlayer') {
        print('Вы победили!');
        break;
      }

      print('\n Ходит бот');
      move = bot.playerMove();
      while (grid[move[0]][move[1]] == 1 || grid[move[0]][move[1]] == 2)
      {
        move = bot.playerMove();
      }
      view.output(stateGame.state(grid, move, bot.symbol));
      field.setGrid = stateGame.state(grid, move, bot.symbol);
      whoWon = Check(grid);
      if (whoWon == 'SecondPlayer') {
        print('Вы проиграли!');
        break;
      }

    }while((whoWon == 'nobody')|(whoWon == 'full'));
      print('Подтвердите выход');
      var exit = stdin.readLineSync()!;
  }

  //   do {
  //
  //     print('\n Ходит игрок');
  //     view.output(player1.HumanMove);
  //     whoWon = Check(StateGame.setGrid());
  //     if (whoWon == 'full'){
  //       print('Ничья!');
  //       break;
  //     }
  //
  //     if (whoWon == 'FirstPlayer') {
  //       print('Вы победили!');
  //       break;
  //     }
  //
  //     bot.setGrid = grid;
  //     print('\n Ходит бот');
  //     view.output(bot.BotMove);
  //     whoWon = field.Check(grid);
  //
  //     if (whoWon == 'SecondPlayer') {
  //       print('Вы проиграли!');
  //       break;
  //     }
  //   }
  //
  //   while ((whoWon == 'nobody')|(whoWon == 'full'));
  //   print('Подтвердите выход');
  //   var exit = stdin.readLineSync()!;
  // }

  _customGame(){
    String whoWon = '';
    List grid = field.FieldGenerate();
    player1.symbol = 1;
    player2.symbol = 2;

    do {
      whoWon = Check(grid);
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }
      print('\n Ходит крестик');
      var move = player1.playerMove();
      while (grid[move[0]][move[1]] == 1 || grid[move[0]][move[1]] == 2) {
        print('Пожалуйста, введите другие данные');
        move = player1.playerMove();
      }
      view.output(stateGame.state(grid, move, player1.symbol));
      field.setGrid = stateGame.state(grid, move, player1.symbol);
      whoWon = Check(grid);
      if (whoWon == 'FirstPlayer') {
        print('Победил Крестик!');
        break;
      }
      if (whoWon == 'full'){
        print('Ничья!');
        break;
      }

      print('\n Ходит Нолик');
      move = player2.playerMove();
      while (grid[move[0]][move[1]] == 1 || grid[move[0]][move[1]] == 2) {
        print('Пожалуйста, введите другие данные');
        move = player2.playerMove();
      }
      view.output(stateGame.state(grid, move, player2.symbol));
      field.setGrid = stateGame.state(grid, move, player2.symbol);
      whoWon = Check(grid);
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


_CheckWhoWon(int count, int countBot){
  var whoWon;
  if (count == 3) {
    whoWon = 'FirstPlayer';
  } else
  if (countBot == 3) {
    whoWon = 'SecondPlayer';
  }else{
    whoWon = 'nobody';
  }
  return whoWon;
}

Check(grid) {
  int count = 0;
  int countBot = 0;
  String whoWon = 'nobody';
  int countField = 0;
  do {
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == 1) && (j == i)) { //главная диагональ
          count++;
        }
        if ((grid [i][j] == 2) && (j == i)) { //главная диагональ
          countBot++;
        }
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon!= 'nobody') {
      break;
    }

// следующая проверка по побочной диагонали
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == 1) & (i + j == 2)) { //побочная диагональ
          count++;
        }
        if ((grid [i][j] == 2) & (i + j == 2)) { //побочная диагональ
          countBot++;
        }
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (первый столбец)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][0] == 1) {
        count++;
      }
      if (grid [i][0] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (второй столбец)

    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][1] == 1) {
        count++;
      }
      if (grid [i][1] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (третий столбец)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][2] == 1) {
        count++;
      }
      if (grid [i][2] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (1 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [0][i] == 1) {
        count++;
      }
      if (grid [0][i] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (2 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [1][i] == 1) {
        count++;
      }
      if (grid [1][i] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка (3 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [2][i] == 1) {
        count++;
      }
      if (grid [2][i] == 2) {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
    if (whoWon != 'nobody') {
      break;
    }

    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if (grid [i][j] == 0) {
          countField++;
        }
      }
    }
    if (countField == 0){
      whoWon = 'full';
      break;
    }
  } while(whoWon != 'nobody');
  return whoWon;
}
