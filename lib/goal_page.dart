import 'package:flutter/material.dart';
import 'package:number_game/homepage_state.dart';
import 'package:provider/provider.dart';

class GoalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageState = Provider.of<HomePageState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Number Game"),
      ),
      body: Center(
        child: Text(
            "Excellent! Answer is ${homePageState.ansNum}\nYou input number ${homePageState.challengeNum} times."),
      ),
    );
  }
}
