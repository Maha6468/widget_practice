import 'package:flutter/material.dart';

class ButtonNavigation_P extends StatefulWidget {
  const ButtonNavigation_P({super.key});

  @override
  State<ButtonNavigation_P> createState() => _ButtonNavigation_PState();
}

class _ButtonNavigation_PState extends State<ButtonNavigation_P> {
  var currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonNavigation"),
        centerTitle: true,
        backgroundColor: Colors.cyanAccent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text(
          "this is container",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepPurpleAccent,
          shape: BoxShape.circle,
          border: Border.all(width: 10, color: Colors.amberAccent),
        ),
        transform: Matrix4.rotationZ(.2),
      ),

     bottomNavigationBar: BottomNavigationBar(
         items:[
           BottomNavigationBarItem(
             icon: Icon(Icons.home,color: Colors.cyan,),
             label: "Home"
           ),
           BottomNavigationBarItem(
               icon: Icon(Icons.account_circle_outlined,color: Colors.cyan,),
               label: "People"
           ),
           BottomNavigationBarItem(
               icon: Icon(Icons.add_a_photo_outlined,color: Colors.cyan,),
               label: "Camera"
           ),
         ]
     ),
    );
  }
}
