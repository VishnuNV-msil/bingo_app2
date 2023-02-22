abstract class BingoEvent {}

class BingoInitialEvent extends BingoEvent {

}
class BingoAddNumberEvent extends BingoEvent {
  int userIndexValue;
  BingoAddNumberEvent(this.userIndexValue);
}

class BingoRefreshEvent extends BingoEvent {
  BingoRefreshEvent();
}
class BingoEndEvent extends BingoEvent {
  BingoEndEvent();
}
