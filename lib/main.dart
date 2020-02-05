import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Number Game",
      /*
      home: ChangeNotifierProvider(
        // TODO: add create attribute
        child: HomePage()
      ),

       */
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Number Game")),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("ANSWER", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 100),
              TextFormField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

