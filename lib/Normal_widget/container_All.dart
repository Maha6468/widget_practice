import 'package:flutter/material.dart';

class Counter_App extends StatefulWidget {
  const Counter_App({super.key});

  @override
  State<Counter_App> createState() => _Counter_AppState();
}

class _Counter_AppState extends State<Counter_App> {
  int _count=0;
  
  void _increment(){
    setState(() {
      _count++;
    });
  }
  
  void _decrement(){
    setState(() {
      _count--;
    });
  }
  
  void _reset(){
    setState(() {
      _count=0;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Counter app"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.3))
            ),
            child: Column(
              children: [
                Text("Current Count",style: TextStyle(fontSize: 14,color: Colors.grey),),
                SizedBox(height: 10,),
                Text("$_count",style: TextStyle(fontSize: 48,fontWeight: FontWeight.bold,color: Colors.blue),)
              ],
            ),
          ),
          SizedBox(height: 30,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _increment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white
                  ),
                  child: Text("+",style: TextStyle(fontSize: 24),)),
              ElevatedButton(onPressed:(){
                _reset();
              }, style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white
              ),
                  child: Text("Reset",style: TextStyle(fontSize: 20),)),
              ElevatedButton(onPressed:_decrement
              , style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white
              ),
                  child: Text("-",style: TextStyle(fontSize: 24),)),

            ],
          )

        ],
      ),
      ),

    );
  }
}
