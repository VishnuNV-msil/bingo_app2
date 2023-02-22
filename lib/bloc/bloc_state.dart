class BingoState {}

class BingoInitialState extends BingoState {}

class BingoAddNumberState extends BingoState {
  List userIndexList;
   List bingoList;
  BingoAddNumberState(this.userIndexList,this.bingoList);
}

class BingoRefreshState extends BingoState {
  BingoRefreshState();
}

class BingoEndState extends BingoState {
List userIndexList;
  List bingoList;
  BingoEndState(this.userIndexList, this.bingoList);
}
