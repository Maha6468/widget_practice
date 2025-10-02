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
         RadioListTile(
            value: 1,
           activeColor: Colors.red,
           groupValue: _cValue,
           onChanged: (value) {
             method(value!);
           },
           title: Text(' 1 button'),
           subtitle: Text("This is button,and it is 1"),
           secondary: Icon(Icons.add_alert),
           selected:_cValue==1?true:false,
            ),
            RadioListTile(
              value: 2,
              activeColor: Colors.red,
              groupValue: _cValue,
              onChanged: (value) {
                method(value!);
              },
              title: Text(' 2 button'),
              subtitle: Text("This is button,and it is 2"),
              secondary: Icon(Icons.add_alert),
              selected:_cValue==2?true:false,
            ),
            RadioListTile(
              value: 3,
              activeColor: Colors.red,
              groupValue: _cValue,
              onChanged: (value) {
                method(value!);
              },
              title: Text(' 3 button'),
              subtitle: Text("This is button,and it is 3"),
              secondary: Icon(Icons.add_alert),
              selected:_cValue==3?true:false,
            ),
            RadioListTile(
              value: 4,
              activeColor: Colors.red,
              groupValue: _cValue,
              onChanged: (value) {
                method(value!);
              },
              title: Text(' 4 button'),
              subtitle: Text("This is button,and it is 4"),
              secondary: Icon(Icons.add_alert),
              selected:_cValue==4?true:false,
            ),
          ],
        )
    );
  }
}
