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
        body:GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
            mainAxisSpacing: 7,
              crossAxisSpacing: 7
            ),
            itemCount: 50,
            itemBuilder: (context,index){
              return Container(
                height: 50,width: 30,
                color: Colors.deepPurpleAccent,
                child: Text('Item $index'),

              );
            }

        )

    );
  }
}
