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
        body:ListView.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("Product $index"),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 30); // বড় gap
          },
        )


    );
  }
}
