import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'View/NoConnection.dart';
import 'View/customNewsCard.dart';
import 'View/myAppBar.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: mainButton());
  }
}

class mainButton extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _mainButton();
  }
}

class _mainButton extends State<mainButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(title: Title(color: Colors.green, child: Text("News"))),
      body: Center(
          child: RaisedButton(
        onPressed: () {
          setState(() {
            // checkConnectivity(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomNewsCard()));
          });
        },
        child: Text("Get Latest News"),
        color: Colors.redAccent,
        splashColor: Colors.blueAccent,
      )),
    );
  }

  checkConnectivity(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {

      Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomNewsCard()));



    } else {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) => NoConnection()));
    }
  }
}

class myLeadingIcon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: ()=> print("tap"),
    );
  }
}