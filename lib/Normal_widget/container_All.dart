import 'package:flutter/material.dart';

class Drawer_Practice extends StatelessWidget {
  const Drawer_Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer"),
        centerTitle: true,
        backgroundColor: Colors.green,
        //leading: IconButton(onPressed: (){}, icon: Icon(Icons.access_alarm)),
      ),
      //endDrawer: Drawer(),
     drawer: Drawer(
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             ListTile(
               title: Text("This is title"),
               subtitle: Text("Subtitle is made by maha"),
               leading: Icon(Icons.accessibility_rounded),
               trailing: Icon(Icons.access_alarm),
             ),
             ListTile(
               title: Text("This is title"),
               subtitle: Text("Subtitle is made by maha"),
               leading: Icon(Icons.accessibility_rounded),
               trailing: Icon(Icons.access_alarm),
             ),
             ListTile(
               title: Text("This is title"),
               subtitle: Text("Subtitle is made by maha"),
               leading: Icon(Icons.accessibility_rounded),
               trailing: Icon(Icons.access_alarm),
             ),
             ListTile(
               title: Text("This is title"),
               subtitle: Text("Subtitle is made by maha"),
               leading: Icon(Icons.accessibility_rounded),
               trailing: Icon(Icons.access_alarm),
             ),
           ],
         ),
       ),
     ),


    );
  }
}
