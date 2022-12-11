import 'package:chat_app/uidesign/ui_battery_optimizer/optimizer_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const kColorPurple = Color(0xFF8337EC);
const kColorPink = Color(0xFFFF006F);
const kColorIndicatorBegin = kColorPink;
const kColorIndicatorEnd = kColorPurple;
const kColorText = Color(0xFF9E9E9E);
const kElevation = 4.0;

class _BatteryLevelIndicatorPainter extends CustomPainter {
  final double percentage;
  final double textCircleRadius;

  _BatteryLevelIndicatorPainter({
    required this.percentage,
    required this.textCircleRadius,
  });

  @override
  void paint(Canvas canvas, Size size){
    for (int i =  1; i < (360 * percentage) ; i+= 5) {

      final per = i/360.0;

      //Tweenは、数値を対応する別の値に変換することができる。
      //ColorTweenは、perを色の値に変更する。便利!
      //https://itome.team/blog/2019/12/flutter-advent-calendar-day15/
      final color = ColorTween(
        begin:kColorIndicatorBegin,
        end: kColorIndicatorEnd,
      ).lerp(per)!;

      final paint = Paint()
        ..color = color
        .. style = PaintingStyle.stroke
        ..strokeWidth = 4 ;
      
      const spaceLen = 16; // 円とゲージ間の長さ
      const lineLen = 24; // ゲージの長さ
      final angle = (2 * pi * per) - (pi / 2); // 0時方向から開始するため-90度ずらす

      // 円の中心座標
      //Offsetは位置を決定する
      final offset0 = Offset(size.width * 0.5, size.height * 0.5);
      // 線の内側部分の座標
      //translateは(x,y)座標分だけ、元の位置座標を移動させるOffsetの機能。
      final offset1 = offset0.translate(
        (textCircleRadius + spaceLen) * cos(angle),
        (textCircleRadius + spaceLen) * sin(angle),
      );
      // 線の外側部分の座標
      final offset2 = offset1.translate(
        lineLen * cos(angle),
        lineLen * sin(angle),
      );

      canvas.drawLine(offset1, offset2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}


class BatteryLevelIndcator extends StatelessWidget{
  final percentage = 0.92;
  final size = 164.0;

  @override
  Widget build(BuildContext context){
    return CustomPaint(
      painter : _BatteryLevelIndicatorPainter(
        percentage: percentage,
        textCircleRadius: size*0.5,
      ),
      child:Container(
        padding: const EdgeInsets.all(64),
        child:Material(
          elevation:kElevation,
          borderRadius: BorderRadius.circular(size*0.5),
          child: Container(
            width: size,
            height: size,
            child: Center(
              child: Text(
                '${percentage * 100}%',
                style: TextStyle(color: kColorPink, fontSize: 48),
              )
            )
          )

      )
    
    
    
    
      ),
    );

  }
}