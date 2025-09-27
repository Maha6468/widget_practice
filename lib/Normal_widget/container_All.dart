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
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text("this is container",style: TextStyle(color: Colors.white,fontSize: 25),),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          shape:BoxShape.circle,
          border: Border.all(
            width: 10,
            color: Colors.amberAccent
          )
        ),
        transform: Matrix4.rotationZ(.2),
      )
    );
  }
}
