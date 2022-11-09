
class StateGame {

  var row;
  var col;
  var grid;

  List get generateArray {
    grid = List<List<String>>.generate(3,
            (i) => List<String>.generate(3, (j) => "_"));
    return grid;
  }

  set setArray(GameGrid) {
    grid = GameGrid;
  }
}
