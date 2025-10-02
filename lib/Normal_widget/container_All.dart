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
        body:Column(
          children: [
            Radio(
                value: 1,
                groupValue:_cValue, onChanged:(value){
                  print(value);
                  method(value!);
            },
            activeColor: Colors.red,
            ),
            Radio(
                value: 2,
                activeColor: Colors.red,
                groupValue:_cValue, onChanged: (value){
              print(value);
              method(value!);
            }),
            Radio(
                value: 3,
                activeColor: Colors.red,
                groupValue:_cValue, onChanged: (value){
              print(value);
              method(value!);
            }),
            Radio(
                value: 4,
                activeColor: Colors.red,
                groupValue:_cValue, onChanged: (value){
              print(value);
              method(value!);
            }),
          ],
        )
    );
  }
}
