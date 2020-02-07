import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'homepage_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Number Game",
      home: ChangeNotifierProvider(
        create: (_) => HomePageState(),
        child: HomePage()
      ),

    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageState = Provider.of<HomePageState>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: Text("Number Game")),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // TODO: return result
              Text(homePageState.subNum.toString(), style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 100),
              SubmitForm(errorMessage: "not good"),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitForm extends StatelessWidget {
  String errorMessage;

  SubmitForm({this.errorMessage = "Put some text"});

  @override
  Widget build(BuildContext context) {
    final homePageState = Provider.of<HomePageState>(context);
    return Form(
      key: homePageState.formKey,
      child: TextFormField(
        validator: (value) {
          int v_int = int.parse(value);

          if (value.isEmpty) {
            return errorMessage;
          }

          if (v_int >= 1000 || v_int <= 99) {
            return "you must input 3 digits";
          }

          int numThird = v_int ~/ 100;
          int tmp = v_int % 100;
          int numSecond = tmp ~/ 10;
          int numFirst = tmp % 10;

          if (numFirst == numSecond || numFirst == numThird || numSecond == numThird) {
            return "you must input number without duplication";
          }

          return null;
        },
        onSaved: (value) {
          // TODO: make error handring do validator
          try {
            homePageState.submit(int.parse(value));
          } catch (exception) {
            homePageState.submit(100);
          }
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
      )
    );
  }
}

class SubmitButton extends StatelessWidget {
  void pressFunc(BuildContext context) {
    final homePageState = Provider.of<HomePageState>(context, listen: false);
    FormState _formState = homePageState.formKey.currentState;
    if (_formState.validate()) {
      print("saved!");
      _formState.save();
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Result"),
            content: Text("ANS: ${homePageState.ansNum}\nHIT: ${homePageState
              .hitNum}\nBITE: ${homePageState.biteNum}"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Submit"),
      textColor: Colors.white,
      color: Colors.indigo,
      // TODO: refactoring
      onPressed: (){
        pressFunc(context);
      },
    );
  }
}
