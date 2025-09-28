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
        body:
        ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.person),
              title: Text("User $index"),
            );
          },
          separatorBuilder: (context, index) {
            return Center(
              child: Text(
                "--- Section Break ---",
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            );
          },
        )

    );
  }
}
