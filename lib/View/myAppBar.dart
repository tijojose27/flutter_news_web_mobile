import 'package:flutter/material.dart';


class myAppBar extends AppBar{
  myAppBar({Key key, @required Widget title, Widget hasBack}) : super(key: key, title: title, leading: hasBack);
  @override
  bool get centerTitle => true;
}
