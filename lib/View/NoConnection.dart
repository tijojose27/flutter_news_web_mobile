import 'package:flutter/material.dart';

class NoConnection extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Network Check",
      theme: ThemeData(      primarySwatch: Colors.red,),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Network Check"),
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: (){
                Navigator.pop(context);
              }
          ),
        ),
        body: Center(
          child: Text(
            "There is not internet connection. Please check connection",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              fontSize: 25.0
            ),),
        ),
      ),
    );
  }
}