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
      body: ListView(
        scrollDirection: Axis.horizontal,
        reverse: true,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Mahabub'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Mahabub'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Mahabub'),
          ),


        ],
      ),
    );
  }
}
