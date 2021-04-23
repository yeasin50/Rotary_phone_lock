import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree
// CustomPaint(
//     size: Size(WIDTH, (WIDTH*1.0668568145990862).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
//     painter: RPSCustomPainter(),
// )
//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4259247, size.height * 0.9898404);
    path_0.arcToPoint(Offset(size.width * 0.2351845, size.height * 0.9146073),
        radius:
            Radius.elliptical(size.width * 0.5304704, size.height * 0.4972274),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.04191938, size.height * 0.6946224),
        radius:
            Radius.elliptical(size.width * 0.5349948, size.height * 0.5014682),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.01083665, size.height * 0.6007668),
        radius:
            Radius.elliptical(size.width * 0.5313076, size.height * 0.4980121),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.01083665, size.height * 0.3992332),
        radius:
            Radius.elliptical(size.width * 0.5386040, size.height * 0.5048513),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.09109956, size.height * 0.2204462),
        radius:
            Radius.elliptical(size.width * 0.5304704, size.height * 0.4972274),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.3257920, size.height * 0.03929242),
        radius:
            Radius.elliptical(size.width * 0.5349948, size.height * 0.5014682),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.8316656, size.height * 0.08539271),
        radius:
            Radius.elliptical(size.width * 0.5327215, size.height * 0.4993374),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.9757483, size.height * 0.2204462),
        radius:
            Radius.elliptical(size.width * 0.5363307, size.height * 0.5027204),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.cubicTo(
        size.width * 0.9773960,
        size.height * 0.2227294,
        size.width * 0.9790882,
        size.height * 0.2251294,
        size.width * 0.9807870,
        size.height * 0.2275713);
    path_0.cubicTo(
        size.width * 0.9826150,
        size.height * 0.2300089,
        size.width * 0.9843339,
        size.height * 0.2325342,
        size.width * 0.9859081,
        size.height * 0.2350846);
    path_0.quadraticBezierTo(size.width * 0.9863289, size.height * 0.2357107,
        size.width * 0.9867475, size.height * 0.2363368);
    path_0.lineTo(size.width * 0.9866896, size.height * 0.2363723);
    path_0.arcToPoint(Offset(size.width * 0.8193060, size.height * 0.3547525),
        radius:
            Radius.elliptical(size.width * 0.1058527, size.height * 0.09921924),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.8100102, size.height * 0.3448120),
        radius:
            Radius.elliptical(size.width * 0.1075293, size.height * 0.1007908),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.8096005, size.height * 0.3450624);
    path_0.cubicTo(
        size.width * 0.8085807,
        size.height * 0.3434533,
        size.width * 0.8074897,
        size.height * 0.3417733,
        size.width * 0.8062606,
        size.height * 0.3399262);
    path_0.cubicTo(
        size.width * 0.8051808,
        size.height * 0.3384194,
        size.width * 0.8041476,
        size.height * 0.3368896,
        size.width * 0.8031880,
        size.height * 0.3353807);
    path_0.arcToPoint(Offset(size.width * 0.5334228, size.height * 0.1984301),
        radius:
            Radius.elliptical(size.width * 0.3196088, size.height * 0.2995799),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.cubicTo(
        size.width * 0.3560197,
        size.height * 0.1984301,
        size.width * 0.2116854,
        size.height * 0.3337111,
        size.width * 0.2116854,
        size.height * 0.5000052);
    path_0.cubicTo(
        size.width * 0.2116854,
        size.height * 0.6662994,
        size.width * 0.3560108,
        size.height * 0.8015803,
        size.width * 0.5334228,
        size.height * 0.8015803);
    path_0.arcToPoint(Offset(size.width * 0.6757822, size.height * 0.7703751),
        radius:
            Radius.elliptical(size.width * 0.3220113, size.height * 0.3018318),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.7921888, size.height * 0.9354045),
        radius:
            Radius.elliptical(size.width * 0.1058616, size.height * 0.09922759),
        rotation: 0,
        largeArc: true,
        clockwise: true);
    path_0.lineTo(size.width * 0.7930794, size.height * 0.9368654);
    path_0.arcToPoint(Offset(size.width * 0.4259202, size.height * 0.9898445),
        radius:
            Radius.elliptical(size.width * 0.5353978, size.height * 0.5018460),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.close();
    path_0.moveTo(size.width * 0.4317560, size.height * 0.8981699);
    path_0.arcToPoint(Offset(size.width * 0.5153209, size.height * 0.8198418),
        radius: Radius.elliptical(
            size.width * 0.08356712, size.height * 0.07833021),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4317560, size.height * 0.8981699),
        radius: Radius.elliptical(
            size.width * 0.08366064, size.height * 0.07841787),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.7242365, size.height * 0.9373350);
    path_0.lineTo(size.width * 0.7254745, size.height * 0.9373350);
    path_0.arcToPoint(Offset(size.width * 0.7670309, size.height * 0.9262738),
        radius: Radius.elliptical(
            size.width * 0.08319306, size.height * 0.07797959),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.7670309, size.height * 0.9262738);
    path_0.lineTo(size.width * 0.7672024, size.height * 0.9261778);
    path_0.lineTo(size.width * 0.7672603, size.height * 0.9261444);
    path_0.lineTo(size.width * 0.7673805, size.height * 0.9260755);
    path_0.lineTo(size.width * 0.7674874, size.height * 0.9260150);
    path_0.lineTo(size.width * 0.7675764, size.height * 0.9259628);
    path_0.lineTo(size.width * 0.7677212, size.height * 0.9258793);
    path_0.lineTo(size.width * 0.7677612, size.height * 0.9258564);
    path_0.lineTo(size.width * 0.7679572, size.height * 0.9257437);
    path_0.lineTo(size.width * 0.7679572, size.height * 0.9257437);
    path_0.quadraticBezierTo(size.width * 0.7710610, size.height * 0.9239509,
        size.width * 0.7739822, size.height * 0.9219140);
    path_0.lineTo(size.width * 0.7740023, size.height * 0.9218994);
    path_0.lineTo(size.width * 0.7741559, size.height * 0.9217908);
    path_0.lineTo(size.width * 0.7742183, size.height * 0.9217470);
    path_0.lineTo(size.width * 0.7743474, size.height * 0.9216552);
    path_0.lineTo(size.width * 0.7744231, size.height * 0.9216009);
    path_0.lineTo(size.width * 0.7745233, size.height * 0.9215300);
    path_0.lineTo(size.width * 0.7746324, size.height * 0.9214527);
    path_0.lineTo(size.width * 0.7746992, size.height * 0.9214047);
    path_0.lineTo(size.width * 0.7748484, size.height * 0.9212983);
    path_0.lineTo(size.width * 0.7748484, size.height * 0.9212983);
    path_0.quadraticBezierTo(size.width * 0.7778475, size.height * 0.9191507,
        size.width * 0.7806575, size.height * 0.9167361);
    path_0.lineTo(size.width * 0.7806575, size.height * 0.9167361);
    path_0.arcToPoint(Offset(size.width * 0.6989161, size.height * 0.7843561),
        radius: Radius.elliptical(
            size.width * 0.08355599, size.height * 0.07831978),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.6986667, size.height * 0.7844312);
    path_0.lineTo(size.width * 0.6984441, size.height * 0.7845001);
    path_0.lineTo(size.width * 0.6984107, size.height * 0.7845001);
    path_0.arcToPoint(Offset(size.width * 0.6406872, size.height * 0.8571745),
        radius: Radius.elliptical(
            size.width * 0.08373189, size.height * 0.07848465),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.6406872, size.height * 0.8572830);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8573456,
        size.width * 0.6406872,
        size.height * 0.8574082,
        size.width * 0.6406872,
        size.height * 0.8574708);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8575668,
        size.width * 0.6406872,
        size.height * 0.8576566,
        size.width * 0.6406872,
        size.height * 0.8577526);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8577943,
        size.width * 0.6406872,
        size.height * 0.8578423,
        size.width * 0.6406872,
        size.height * 0.8578861);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8579696,
        size.width * 0.6406872,
        size.height * 0.8580552,
        size.width * 0.6406872,
        size.height * 0.8581387);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8581679,
        size.width * 0.6406872,
        size.height * 0.8581950,
        size.width * 0.6406872,
        size.height * 0.8582242);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8583369,
        size.width * 0.6406872,
        size.height * 0.8584538,
        size.width * 0.6406872,
        size.height * 0.8585665);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8585936,
        size.width * 0.6406872,
        size.height * 0.8586208,
        size.width * 0.6406872,
        size.height * 0.8586479);
    path_0.cubicTo(
        size.width * 0.6406872,
        size.height * 0.8587669,
        size.width * 0.6406872,
        size.height * 0.8588858,
        size.width * 0.6406872,
        size.height * 0.8590048);
    path_0.arcToPoint(Offset(size.width * 0.7242365, size.height * 0.9373350),
        radius: Radius.elliptical(
            size.width * 0.08366064, size.height * 0.07841787),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.2228427, size.height * 0.8459525);
    path_0.arcToPoint(Offset(size.width * 0.3064076, size.height * 0.7676244),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.2228427, size.height * 0.8459525),
        radius: Radius.elliptical(
            size.width * 0.08365841, size.height * 0.07841578),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.07242321, size.height * 0.6971268);
    path_0.arcToPoint(Offset(size.width * 0.1559881, size.height * 0.6188028),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.07242321, size.height * 0.6971268),
        radius: Radius.elliptical(
            size.width * 0.08365841, size.height * 0.07841578),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.01950018, size.height * 0.5013033);
    path_0.arcToPoint(Offset(size.width * 0.1030651, size.height * 0.4229752),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.01950018, size.height * 0.5013033),
        radius: Radius.elliptical(
            size.width * 0.08366064, size.height * 0.07841787),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.07242543, size.height * 0.3054820);
    path_0.arcToPoint(Offset(size.width * 0.1559903, size.height * 0.2271539),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.07242321, size.height * 0.3054820),
        radius: Radius.elliptical(
            size.width * 0.08365841, size.height * 0.07841578),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.8022283, size.height * 0.2767624);
    path_0.arcToPoint(Offset(size.width * 0.8076411, size.height * 0.3046242),
        radius: Radius.elliptical(
            size.width * 0.08325986, size.height * 0.07804220),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.8830078, size.height * 0.3498688),
        radius: Radius.elliptical(
            size.width * 0.08401243, size.height * 0.07874762),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.cubicTo(
        size.width * 0.9290864,
        size.height * 0.3498688,
        size.width * 0.9665727,
        size.height * 0.3141431,
        size.width * 0.9665727,
        size.height * 0.2702342);
    path_0.arcToPoint(Offset(size.width * 0.9625360, size.height * 0.2457576),
        radius: Radius.elliptical(
            size.width * 0.08600075, size.height * 0.08061133),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.8022239, size.height * 0.2767624),
        radius: Radius.elliptical(
            size.width * 0.08356712, size.height * 0.07833021),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.2228427, size.height * 0.1566583);
    path_0.arcToPoint(Offset(size.width * 0.3064076, size.height * 0.07832813),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.2228427, size.height * 0.1566583),
        radius: Radius.elliptical(
            size.width * 0.08365841, size.height * 0.07841578),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.6434548, size.height * 0.1436019);
    path_0.arcToPoint(Offset(size.width * 0.7270219, size.height * 0.06527379),
        radius: Radius.elliptical(
            size.width * 0.08356712, size.height * 0.07833021),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.6434548, size.height * 0.1436019),
        radius: Radius.elliptical(
            size.width * 0.08366064, size.height * 0.07841787),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.4289706, size.height * 0.1018259);
    path_0.arcToPoint(Offset(size.width * 0.5125355, size.height * 0.02349781),
        radius: Radius.elliptical(
            size.width * 0.08356490, size.height * 0.07832813),
        rotation: 0,
        largeArc: true,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4289706, size.height * 0.1018259),
        radius: Radius.elliptical(
            size.width * 0.08366064, size.height * 0.07841787),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
