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
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red)
          ),
          child: Transform.scale(
            scale: 4.0,
            child: Checkbox(
                value: _cValue,
                onChanged:(staus){
                  print(staus);
                  setState(() {
                    _cValue=staus!;
                  });
                },
              activeColor: Colors.white,
              checkColor: Colors.cyanAccent,
            ),
          ),
        ),
      )
    );
  }
}
