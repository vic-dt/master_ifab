import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/presentation/providers/sensores/gyroscope_provider.dart';

class GyroscopeSpheraScreen extends ConsumerWidget {
  const GyroscopeSpheraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gyroscope$ = ref.watch(gyroscopeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Giroscopio con bola'),
      ),
      body: SizedBox.expand(
        child: gyroscope$.when(
          data:(value) => MovereSphera(x:value.x, y: value.y,), 
          error:(error, stackTrace) => Text('$error'), 
          loading:() =>  CircularProgressIndicator(),),
      ),
    );
  }
}

class MovereSphera extends StatelessWidget {

  final double x;
  final double y;


  const MovereSphera({
    super.key,
    required this.x,
    required this.y,
    });

  @override
  Widget build(BuildContext context) {
    final magnitudine= MediaQuery.of(context).size;

    double latitudo = magnitudine.width;
    double altitudo = magnitudine.height;

    double nuncYPos = y*80;
     double nuncXPos = x*80;

    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          left: nuncYPos+latitudo/2,
          top: nuncXPos+altitudo/2,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          child: Sphera(), 
          ),
        
        Text(
'''
x: $x
y: $y
''', style: TextStyle(fontSize: 30),
        )
      ],
    );
  }
}

class Sphera extends StatelessWidget {
  const Sphera({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}