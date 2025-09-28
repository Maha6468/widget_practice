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
        itemCount: 10,
          itemBuilder: (context,index){
          return Card(
            color: Colors.pink,
            elevation: 4,
            margin: EdgeInsets.symmetric(horizontal:10,vertical: 4),
            child: ListTile(
              leading:CircleAvatar(
                //radius: 20,
                maxRadius:30,
                backgroundImage: NetworkImage("https://img.lovepik.com/free-png/20211124/lovepik-natural-woods-png-image_401110806_wh1200.png"),
              ),
              title: Text("Maha $index"),
              subtitle: Text("I am mahabubar of prime university"),
              trailing: Icon(Icons.accessibility_outlined),
            ),
          );
          }
      )
    );
  }
}
