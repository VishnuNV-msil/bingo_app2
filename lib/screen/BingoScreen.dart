import 'package:bingo_app/bloc/bloc_event.dart';
import 'package:bingo_app/bloc/bloc_state.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Strings/strings.dart';
import '../bloc/bingo_bloc.dart';
import 'BoxWidget.dart';
import '../Helpers/GridLines.dart';
import '../Helpers/CustomCenter_Widget.dart';

class BingoScreen extends StatelessWidget {
  const BingoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BingoBloc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            Strings.appBarTitle,
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        body: const BingoTable(),
      ),
    );
  }
}

class BingoTable extends StatefulWidget {
  const BingoTable({Key? key}) : super(key: key);

  @override
  State<BingoTable> createState() => _BingoTableState();
}

class _BingoTableState extends State<BingoTable> {
  @override
  Widget build(BuildContext context) {
    final BingoBloc bingoBloc = BlocProvider.of<BingoBloc>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          customCenter(Strings.title, Colors.pink),
          BlocBuilder<BingoBloc, BingoState>(
            builder: (context, state) {
              String str;
              if (state is BingoEndState) {
                str = Strings.gameOver;
              }  else {
                str = '';
              }
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.width - 30,
                    width: MediaQuery.of(context).size.width - 30,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: CustomPaint(
                        foregroundPainter: GridLines(
                            Paint()
                              ..color = Colors.black
                              ..strokeWidth = 6.0,
                            state is BingoAddNumberState
                              ? state.bingoList
                              : state is BingoEndState
                              ? state.bingoList
                              : []),
                        child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 25,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return ButtonWidget(
                                buttonTapped: () {
                                  bingoBloc.add(BingoAddNumberEvent(index));
                                },
                                buttonText: state is BingoAddNumberState
                                    ? state.userIndexList[index].toString()
                                    : state is BingoEndState
                                    ? state.userIndexList[index].toString()
                                    : '',
                                textColor: Colors.black,
                                index: index,
                              );
                            }),
                      ),
                    ),
                  ),
                  customCenter(str, Colors.black),
                ],
              );
            },
          ),
          FloatingActionButton(
            heroTag: 'btn2',
            child: const Icon(Icons.refresh),
            onPressed: () {
              bingoBloc.add(BingoRefreshEvent());
            },
          ),
        ],
      ),
    );
  }
}
