import 'package:flutter/material.dart';
import 'package:master_ifab/presentation/widgets/calceus/button_aurantius.dart';

class AdCarrumButton extends StatelessWidget {
  final double pretium;

  const AdCarrumButton({
    super.key,
    required this.pretium,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(100)
        ),
        child: Row(
          children: [
            SizedBox(width: 20,),
            Text('\$$pretium', style: TextStyle(fontSize: 28),),
            Spacer(),
            ButtonAurantius(textus: 'Add to cart'),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}