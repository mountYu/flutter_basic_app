import 'package:flutter/material.dart';
import './ui_admin_mobile.dart';
import 'ui_battery_optimizer/home.dart';
import './ui_megu_home.dart';

class UiDesignHomePage extends StatelessWidget  {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI DESIGN HOME'),
      ),
      body:Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[

            ElevatedButton(
              child:Text('AdminMbile'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return AdminMbilePage();
                  }),
                );
              }
            ),
             ElevatedButton(
              child:Text('BatteryOptimizer'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return BatteryOptimizerPage();
                  }),
                );
              }
            ),

             ElevatedButton(
              child:Text('MeguHome'),
              onPressed: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return MeguHomePage();
                  }),
                );
              }
            ),

          ]
        )
      ),

     floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          Navigator.of(context).pop();
        }),

    );
  }
}