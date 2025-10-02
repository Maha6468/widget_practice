import 'package:flutter/material.dart';

class ListView_All extends StatefulWidget {
  const ListView_All({super.key});

  @override
  State<ListView_All> createState() => _ListView_AllState();
}

class _ListView_AllState extends State<ListView_All>{
  bool _cValue=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("AppBar"),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.cyanAccent,

        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black87
              )
            ),
            child: CheckboxListTile(
                value:_cValue,
              onChanged: (value) {
                  print(value);
                  setState(() {
                    _cValue=value!;
                  });
              },
              activeColor: Colors.amberAccent,
              checkColor: Colors.greenAccent,
              title: Text("Maha"),
              subtitle: Text("This is Mahabubar app"),
              secondary: Icon(Icons.access_alarm_sharp),
              selected: _cValue,
            ),
          ),
        )
    );
  }
}
