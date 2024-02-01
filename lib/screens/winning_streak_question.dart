import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:winning_streak_lab04/models/streak_tracker.dart';
import 'package:flutter/widgets.dart';

WinningStreakQuestion extends StatelessWidget {
  const WinningStreakQuestion({Key? key} : super(key:key));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Winning Streak"),
        actions: <Widget>[
          Align(
            alignment:Alignment.bottomRight,
            child: Row(
              children: <Widget>[
                const Icon(Icons.check_rounded,
                  color:Colors.red,
                  size:36.0),
                Consumer<StreakTracker> (
                  builder: (context, streak, child) =>
                Text("${streak.streak}",
                  textScaleFactor: 2.0,
                ),
                ),
              ]
            ),
          ),
        ]
      ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text("In golf it's the proper word to yell when your ball is headed toward a player",
        textScaleFactor: 2.0,
        ),
        Column(
          children: [
            ChoiceTile(option:1,
              text:"fore",
              callBack: context.read<StreakTracker>().increment,
            ),
            ChoiceTile(option:2,
              text:"golf",
              callBack: context.read<StreakTracker>().reset,
            ),
            ChoiceTile(option:3,
              text:"Tiger Woods",
              callBack: context.read<StreakTracker>().reset,
            ),
            ChoiceTile(option:4,
              text:"Buffalo",
              callBack: context.read<StreakTracker>().reset,
            ),
          ]
        )
      ],
    )
    );
  }
}

class ChoiceTile extends StatelessWidget {
  final int option;
  final String text;
  final void Function() callBack;

  const ChoiceTile ( {required this.option, required this.text, required this.callBack });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text("${option}."),
        title: Text(text),
        onTap: callBack,
      )
    );
  }
}