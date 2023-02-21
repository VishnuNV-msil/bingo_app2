import 'bloc_event.dart';
import 'bloc_state.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../Strings/strings.dart';

class BingoBloc extends Bloc<BingoEvent, BingoState> {
  List userSelectedList = [];
  List numbersList = List.generate(25, (int index) => '');
  int number = 0;
  List crossedList = [];
  List bingoList = [];

  @override
  BingoBloc() : super(BingoInitialState()) {
    on<BingoAddNumberEvent>((event, emit) {
      addToUserSelectedList(event.userIndexValue);
      emit(BingoAddNumberState(numbersList, bingoList));
    });
    on<BingoRefreshEvent>((event, emit) {
      number = 0;
      numbersList = List.generate(25, (int index) => '');
      userSelectedList = [];
      bingoList = [];
      crossedList = [];
      emit(BingoRefreshState());
    });
  }
  void addToUserSelectedList(int index) {
    if (number == 25) {
      numbersList[index] = 'X';
      addToCrossedList(index);
    } else {
      if (userSelectedList.contains(index)) {
      } else {
        number = number + 1;
        userSelectedList.add(index);
        numbersList[index] = number;
      }
    }
  }

  void addToCrossedList(int index) {
    if (crossedList.contains(index)) {
    } else {
      crossedList.add(index);
      if (crossedList.length > 4) {
        checkBingo();
      }
    }
  }

  void checkBingo() {
    if (Set.of(crossedList).containsAll(Strings.r1) && !bingoList.contains(Strings.r1Str)) {
      bingoList.add(Strings.r1Str);
    }
    if (Set.of(crossedList).containsAll(Strings.r2) && !bingoList.contains(Strings.r2Str)) {
      bingoList.add(Strings.r2Str);
    }
    if (Set.of(crossedList).containsAll(Strings.r3) && !bingoList.contains(Strings.r3Str)) {
      bingoList.add(Strings.r3Str);
    }
    if (Set.of(crossedList).containsAll(Strings.r4) && !bingoList.contains(Strings.r4Str)) {
      bingoList.add(Strings.r4Str);
    }
    if (Set.of(crossedList).containsAll(Strings.r5) && !bingoList.contains(Strings.r5Str)) {
      bingoList.add(Strings.r5Str);
    }
    if (Set.of(crossedList).containsAll(Strings.c1) && !bingoList.contains(Strings.c1Str)) {
      bingoList.add(Strings.c1Str);
    }
    if (Set.of(crossedList).containsAll(Strings.c2) && !bingoList.contains(Strings.c2Str)) {
      bingoList.add(Strings.c2Str);
    }
    if (Set.of(crossedList).containsAll(Strings.c3) && !bingoList.contains(Strings.c3Str)) {
      bingoList.add(Strings.c3Str);
    }
    if (Set.of(crossedList).containsAll(Strings.c4) && !bingoList.contains(Strings.c4Str)) {
      bingoList.add(Strings.c4Str);
    }
    if (Set.of(crossedList).containsAll(Strings.c5) && !bingoList.contains(Strings.c5Str)) {
      bingoList.add(Strings.c5Str);
    }
    if (Set.of(crossedList).containsAll(Strings.dLeft) &&
        !bingoList.contains(Strings.dLeftStr)) {
      bingoList.add(Strings.dLeftStr);
    }
    if (Set.of(crossedList).containsAll(Strings.dRight) &&
        !bingoList.contains(Strings.dRightStr)) {
      bingoList.add(Strings.dRightStr);
    } else {}
  }

}
