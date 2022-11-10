class Field{
  int count = 0;
  int countBot = 0;
  String whoWon = 'nobody';

  _CheckWhoWon(int count, int countBot){
    int a = count;
    int b = countBot;
    if (a == 3) {
      whoWon = 'FirstPlayer';
    } else
      if (b == 3) {
      whoWon = 'SecondPlayer';
    }
    return whoWon;

  }

  Check(grid) {
  do {
    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == 'X') && (j == i)) { //главная диагональ
          count++;
        }
        if ((grid [i][j] == 'O') && (j == i)) { //главная диагональ
          countBot++;
        }
      }
      whoWon = _CheckWhoWon(count, countBot);
    }
    if (whoWon != 'nobody') {
      break;
    }

// следующая проверка по побочной диагонали
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == 'X') & (i + j == 2)) { //побочная диагональ
          count++;
        }
        if ((grid [i][j] == 'O') & (i + j == 2)) { //побочная диагональ
          countBot++;
        }
      }
      whoWon = _CheckWhoWon(count, countBot);
    }

// следующая проверка (первый столбец)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][0] == 'X') {
        count++;
      }
      if (grid [i][0] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);

// следующая проверка (второй столбец)

    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][1] == 'X') {
        count++;
      }
      if (grid [i][1] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);


// следующая проверка (третий столбец)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][2] == 'X') {
        count++;
      }
      if (grid [i][2] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);

// следующая проверка (1 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [0][i] == 'X') {
        count++;
      }
      if (grid [0][i] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);

// следующая проверка (2 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [1][i] == 'X') {
        count++;
      }
      if (grid [1][i] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);

// следующая проверка (3 строка)
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [2][i] == 'X') {
        count++;
      }
      if (grid [2][i] == 'O') {
        countBot++;
      }
    }
    whoWon = _CheckWhoWon(count, countBot);
  }

    while(whoWon != 'nobody');
    return whoWon;
  }
}