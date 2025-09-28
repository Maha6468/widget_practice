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
          child: Stack(
            clipBehavior:Clip.none,
              children: [
                Container(
                  height: 300,
                  width: 200,
                  color: Colors.amberAccent,
                ),
                Positioned(
                  bottom: -70,
                  left:-50,
                  child: Container(
                    height: 150,
                    width: 100,
                    color: Colors.cyanAccent,
                  ),
                ),

              Positioned(
                top: 10,
                left: 20,
                child: Container(
                  height: 100,
                  width: 50,
                  color: Colors.deepPurpleAccent,
                ),
              ),
                Positioned(
                  top: -40,
                  right: 0,
                  child: Container(
                    height: 70,
                    width: 30,
                    color: Colors.purpleAccent,
                  ),
                ),


              ],
            ),
        ),
    );
  }
}
