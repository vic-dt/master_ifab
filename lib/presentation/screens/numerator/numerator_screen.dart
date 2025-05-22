
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/presentation/providers/providers.dart';


// class NumeratorScreen extends StatefulWidget {
//   const NumeratorScreen({super.key});

//   @override
//   State<NumeratorScreen> createState() => _NumeratorScreenState();
// }

// class _NumeratorScreenState extends State<NumeratorScreen> {

//   int counter = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Numerator Screen'),
//       ),
//       body: Center(
//         child: Text('Valor: $counter', style: Theme.of(context).textTheme.titleLarge,),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:(){
//           setState(() {
//             counter++;
//           });
          
        
//         },
//         child: Icon(Icons.add),
//         ),
//     );
//   }
// }


class NumeratorScreen extends ConsumerWidget {

  

  const NumeratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final int clickNumerator= ref.watch(numeratorProvider);

    final bool estTenebrisModus = ref.watch(estTenebrisModusProvider);


    return Scaffold(
      appBar: AppBar(
        title: Text('Numerator Screen'),
        actions: [
          IconButton(
            onPressed: (){
              ref.read(estTenebrisModusProvider.notifier).update((state)=>!state);
            }, 
            icon: Icon(estTenebrisModus 
              ? Icons.dark_mode_outlined 
              : Icons.light_mode_outlined)
          )
        ],
      ),
      body: Center(
        child: Text('Valor: $clickNumerator', style: Theme.of(context).textTheme.titleLarge,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          // ref.read(numeratorProvider.notifier).state++;
          ref.read(numeratorProvider.notifier).update((state)=> state+1);

        },
        child: Icon(Icons.add),
        ),
    );
  }
}
