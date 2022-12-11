import 'package:flutter/material.dart';

const kColorTitle = Color(0xFF616161);


class _OptimizerButton extends StatelessWidget{
  final String text;
  const _OptimizerButton({
    Key? key,
    required this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16),

      ),
      onPressed:() {},
      child: Text(
      text,
      style: const TextStyle(color: kColorTitle, fontSize: 12),
     ),
    );
  }
}

class OptimizerButtons extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:Container(
        child:Row(
          children:const [
            _OptimizerButton(text:'おすすめ'),
            _OptimizerButton(text:'社会学'),
            _OptimizerButton(text:'経済学'),
            _OptimizerButton(text:'都市学'),
            _OptimizerButton(text:'人類学'),
            _OptimizerButton(text:'法学'),
            _OptimizerButton(text:'文学'),
          ]
        )
              )
    );
  }

}