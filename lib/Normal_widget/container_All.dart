import 'package:flutter/material.dart';

class ListView_All extends StatefulWidget {
  const ListView_All({super.key});

  @override
  State<ListView_All> createState() => _ListView_AllState();
}

class _ListView_AllState extends State<ListView_All>{
  int _cValue=0;

  void method(int value){
    setState(() {
      _cValue=value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyanAccent,

        ),
        body:GridView.count(
            crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
         //childAspectRatio: 2,

          children: [
            Container(
              width: 30,height: 50,
              color: Colors.red,
            ),
            Container(
              width: 30,height: 50,
              color: Colors.red,
            ),Container(
              width: 30,height: 50,
              color: Colors.red,
            ),Container(
              width: 30,height: 50,
              color: Colors.red,
            ),Container(
              width: 30,height: 50,
              color: Colors.red,
            ),Container(
              width: 30,height: 50,
              color: Colors.red,
            ),Container(
              width: 30,height: 50,
              color: Colors.red,
            ),
            Container(
              width: 30,height: 50,
              color: Colors.red,
            ),
            Container(
              width: 30,height: 50,
              color: Colors.red,
            )
          ],

        )

    );
  }
}
