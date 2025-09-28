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
      body: ListView.builder(
        itemCount: 16,
        itemBuilder: (context,index){
          return Card(
            margin: EdgeInsets.symmetric(vertical: 5),
            color: Colors.amberAccent,
            elevation: 4,
            child: ListTile(
              title: Text("Item $index"),
              leading: CircleAvatar(
                  radius: 30,

                  child: Icon(Icons.star)),
              subtitle: Text("this is subtitle"),
              trailing: CircleAvatar(child: Icon(Icons.arrow_forward)),
            ),
          );
        },
      ),
    );
  }
}
