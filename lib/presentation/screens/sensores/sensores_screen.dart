import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/providers.dart';
import 'package:master_ifab/presentation/providers/sensores/gyroscope_provider.dart';

class SensoresScreen extends StatefulWidget {
  const SensoresScreen({super.key});

  @override
  State<SensoresScreen> createState() => _SensoresScreenState();
}

class _SensoresScreenState extends State<SensoresScreen> {

  final paginaVisumControler= PageController();

  bool finemPervenit= false;

   @override
  void initState() {

    paginaVisumControler.addListener((){

      final pagina = paginaVisumControler.page ?? 0;
      if (!finemPervenit && pagina>= 1.5){
        setState(() {
          finemPervenit= true;
        });
      };

    });
    super.initState();
    
  }


  @override
  void dispose() {
    paginaVisumControler.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Datos de los sensores'),
      ),
      body: Stack(
        children: [

          PageView(
            controller: paginaVisumControler,
            physics: const BouncingScrollPhysics(),
            children: [
              Gyroscope(),
              Accelerometrum(),
              Magnetometrum(),
            ],
          ),
          finemPervenit
          ? Positioned(
            bottom: 30,
            right: 30,
            child: FadeInRight(
              from: 500,
              delay: Duration(milliseconds: 100),
              
              child: FilledButton(
                onPressed: ()=> context.pop(), 
                child: Text('Volver', style: TextStyle(fontSize: 18),)
                ),
            )
              )
          : const SizedBox()

        ],
      )
      
      

    );
  }
}

class Gyroscope extends ConsumerWidget {
  const Gyroscope({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
final gyroscope$ =ref.watch(gyroscopeProvider);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text('Giroscopio', style: TextStyle(fontSize: 43, color: Colors.grey),),
          ),
          SizedBox(height: 150,),
          Center(
            child: gyroscope$.when(
              data:(value) => Text(
                value.toString(),
                style:TextStyle(fontSize: 40, color: Colors.grey 
              ),),
              
              error: (error, StackTrace) => Text('$error') ,
              loading: ()=> CircularProgressIndicator(),
              ),
      
            ),
          
        ],
      ),
    );
  }
}


class Accelerometrum extends ConsumerWidget {
  const Accelerometrum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    // final accelerometrum$ = ref.watch( accelerometrumGravitasProvider );
    final accelerometrum$ = ref.watch( accelerometrumUserProvider );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child:(
              Text('Acelerómetro', style: TextStyle(fontSize: 43, color: Colors.grey))
            )
          ),
          SizedBox(height: 150,),
          Center( 
            child: accelerometrum$.when(
              data: (value) => Text(
                value.toString(),
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => const CircularProgressIndicator()
            ),
          ),
        ],
      )
    );
  }
}



class Magnetometrum extends ConsumerWidget {
  const Magnetometrum({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final magnetometrum$ = ref.watch( magnetometrumProvider );

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child:(
              Text('Magnetómetro', style: TextStyle(fontSize: 43, color: Colors.grey))
            )
          ),
          SizedBox(height: 150,),
          Center(
            child: magnetometrum$.when(
              data: (value) => Text(
                value.x.toString(),
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ), 
              error: (error, stackTrace) => Text('$error'), 
              loading: () => const CircularProgressIndicator()
            ),
          ),
        ],
      )
    );
  }
}
