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
    if (Set.of(crossedList).containsAll(Strings.r1) && !bingoList.contains('r1')) {
      bingoList.add('r1');
    }
    if (Set.of(crossedList).containsAll(Strings.r2) && !bingoList.contains('r2')) {
      bingoList.add('r2');
    }
    if (Set.of(crossedList).containsAll(Strings.r3) && !bingoList.contains('r3')) {
      bingoList.add('r3');
    }
    if (Set.of(crossedList).containsAll(Strings.r4) && !bingoList.contains('r4')) {
      bingoList.add('r4');
    }
    if (Set.of(crossedList).containsAll(Strings.r5) && !bingoList.contains('r5')) {
      bingoList.add('r5');
    }
    if (Set.of(crossedList).containsAll(Strings.c1) && !bingoList.contains('c1')) {
      bingoList.add('c1');
    }
    if (Set.of(crossedList).containsAll(Strings.c2) && !bingoList.contains('c2')) {
      bingoList.add('c2');
    }
    if (Set.of(crossedList).containsAll(Strings.c3) && !bingoList.contains('c3')) {
      bingoList.add('c3');
    }
    if (Set.of(crossedList).containsAll(Strings.c4) && !bingoList.contains('c4')) {
      bingoList.add('c4');
    }
    if (Set.of(crossedList).containsAll(Strings.c5) && !bingoList.contains('c5')) {
      bingoList.add('c5');
    }
    if (Set.of(crossedList).containsAll(Strings.dLeft) &&
        !bingoList.contains('dLeft')) {
      bingoList.add('dLeft');
    }
    if (Set.of(crossedList).containsAll(Strings.dRight) &&
        !bingoList.contains('dRight')) {
      bingoList.add('dRight');
    } else {}
  }

}
