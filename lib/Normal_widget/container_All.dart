import 'package:flutter/material.dart';

class ListView_All extends StatefulWidget {
  const ListView_All({super.key});

  @override
  State<ListView_All> createState() => _ListView_AllState();
}

class _ListView_AllState extends State<ListView_All>{
  int _cValue=0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyanAccent,

        ),
        body:Row(
          children: [
            Expanded(
              child: Container(color: Colors.red, height: 100),
            ),
            Expanded(
              child: Container(color: Colors.green, height: 100),
            ),
            Expanded(
              child: Container(color: Colors.blue, height: 100),
            ),
          ],
        )


    );
  }
}
