
class StateGame {

  var row;
  var col;
  var grid;
  var count = 0;
  var countBot = 0;
  var cond = false;
  var condBot = false;
  List get generateArray {
    grid = List<List<String>>.generate(3,
            (i) => List<String>.generate(3, (j) => "_"));
    return grid;
  }

  set setArray(a) {
    grid = a;
  }

  Check(grid) {

    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == "X") & (j == i)) { //главная диагональ
          count++;
        }
        if ((grid [i][j] == "O") & (j == i)) { //главная диагональ
          countBot++;
        }
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      for (int j = 0; j <= 2; j++) {
        if ((grid [i][j] == "X") & (i + j == 2)) { //побочная диагональ
          count++;
        }
        if ((grid [i][j] == "O") & (i + j == 2)) { //побочная диагональ
          countBot++;
        }
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][0] == "X") {
        count++;
      }
      if (grid [i][0] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][1] == "X") {
        count++;
      }
      if (grid [i][1] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }

// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [i][2] == "X") {
        count++;
      }
      if (grid [i][2] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }

// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [0][i] == "X") {
        count++;
      }
      if (grid [0][i] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [1][i] == "X") {
        count++;
      }
      if (grid [1][i] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
// следующая проверка
    count = 0;
    countBot = 0;
    for (int i = 0; i <= 2; i++) {
      if (grid [2][i] == "X") {
        count++;
      }
      if (grid [2][i] == "O") {
        countBot++;
      }
    }
    if (count == 3) {
      cond = true;
    } else if (countBot == 3) {
      condBot = true;
    }
    List <bool> countList = [cond, condBot];
    return countList;
  }
}