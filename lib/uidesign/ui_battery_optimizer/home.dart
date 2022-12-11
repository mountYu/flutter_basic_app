import 'package:flutter/material.dart';
import './optimizer_bar.dart';
import 'indicator.dart';

class BatteryOptimizerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    return Scaffold(

      appBar: AppBar(
        title: const Text('battery optimizer'),
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body:Column(
        children: [
          OptimizerButtons(),
          BatteryLevelIndcator()
        ],
      )
    ,
    
    floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pop();
        }),
    );
  }
}