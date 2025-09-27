import 'package:flutter/material.dart';

class Container_All extends StatelessWidget {
  const Container_All({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Center(
        child: Container(
          //alignment: Alignment.center,
          height: 500,width: 300,
          child: Text("This is container"),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.amber,
            shape: BoxShape.rectangle,
            border: Border.all(
              color: Colors.deepPurpleAccent,
              width: 5
            ),
          ),
          transform: Matrix4.rotationZ(.2),
        ),
      ),
    );
  }
}
