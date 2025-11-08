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
        body:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              Container(
                  color: Colors.red,
                  width:MediaQuery.of(context).size.width/3 -12,
                  height: 100),
              SizedBox(width: 10,),
              Container(
                  color: Colors.green,
                  width:MediaQuery.of(context).size.width/3 -12,
                  height: 100),
              SizedBox(width: 10,),
              Container(
                  color: Colors.amber,
                  width:MediaQuery.of(context).size.width/3 -12,
                  height: 100),
            ],
          ),
        )



    );
  }
}
