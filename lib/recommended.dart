import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(child: Container(
        child: Text("Recommended WIdget"),
      )),
    );
  }
}
