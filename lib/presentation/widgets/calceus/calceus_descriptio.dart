import 'package:flutter/material.dart';

class CalceusDescriptio extends StatelessWidget {
  final String titulus;
  final String desriptio;
  const CalceusDescriptio({
    super.key,
    required this.titulus,
    required this.desriptio,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text(
            titulus,
            style: TextStyle(fontFamily: "CuppertinoSystemDisplay", fontSize: 30, fontWeight:FontWeight.w700),
            ),
            Text(
            desriptio,
            style: TextStyle(fontFamily: "CuppertinoSystemDisplay", height: 1.6),
            )
        ],
      ),
    );
  }
}