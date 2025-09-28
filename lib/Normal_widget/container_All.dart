import 'package:flutter/material.dart';

class ListView_All extends StatelessWidget {
  const ListView_All({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
          centerTitle: true,
          backgroundColor: Colors.cyanAccent,
        ),
        body:ListView.builder(
            itemCount: 6,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  title: Text("Maha $index"),
                  subtitle: Text("this is maha"),
                  leading: Icon(Icons.star),
                  trailing: Icon(Icons.accessibility),
                ),
              );
        }
        )
    );
  }
}
