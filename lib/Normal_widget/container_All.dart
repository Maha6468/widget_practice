import 'package:flutter/material.dart';

class ListView_All extends StatelessWidget {
  const ListView_All({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body:Center(
        child: Text.rich(
          TextSpan(
            text:"This maha\n",
            children: [
              TextSpan(
                text: "hi romio",
                style: TextStyle(
                  color: Colors.deepPurpleAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                )
              ),
              TextSpan(
                text: "i am student"
              )
            ]
          ),
        ),
      )
    );
  }
}
