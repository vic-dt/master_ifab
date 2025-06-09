import 'package:flutter/material.dart';

class ButtonAurantius extends StatelessWidget {
  final String textus;
  final double altus;
  final double latus;
  final Color color;

  const ButtonAurantius({
    super.key, 
    required this.textus, 
     this.altus =50, 
    this.latus =150, 
    this.color = Colors.orange,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: latus,
      height: altus,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
      child: Text(textus, style: TextStyle(fontFamily: "CuppertinoSystemText", color: Colors.white),),
    );
  }
}