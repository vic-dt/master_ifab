import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:master_ifab/presentation/providers/providers.dart';

class LocusScreen extends ConsumerWidget {
  const LocusScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final userLocusAsync = ref.watch(userLocusProvider);

    final vigiliaLocusAsync = ref.watch(vigiliaLocusProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Localización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              spacing: 15,
            children: [
             Text('Ubicación', style: TextStyle(fontSize: 35, color: Colors.grey),),
            //  Text('(39.08764, -0.309168)', style: TextStyle(fontSize: 35),)
            userLocusAsync.when(
              data:(data) => Text('$data', style: TextStyle(fontSize: 35),), 
              error:(error, stackTrace) => Text('$error'), 
              loading:() => CircularProgressIndicator(),
              ),
           ],
          ),
           Column(
              spacing: 15,
            children: [
             Text('Seguimiento', style: TextStyle(fontSize: 35, color: Colors.grey),),
            //  Text('(39.08764, -0.309168)', style: TextStyle(fontSize: 35),)
             vigiliaLocusAsync.when(
              data:(data) => Text('$data', style: TextStyle(fontSize: 35),), 
              error:(error, stackTrace) => Text('$error'), 
              loading:() => CircularProgressIndicator(),
              ),
           ],
          ),
          Icon(Icons.pin_drop, size: 180, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}