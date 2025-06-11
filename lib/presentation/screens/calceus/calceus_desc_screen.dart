import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/providers.dart';
import 'package:master_ifab/presentation/widgets/calceus/button_aurantius.dart';
import 'package:master_ifab/presentation/widgets/calceus/calceus_praevidere.dart';
import 'package:master_ifab/presentation/widgets/widgets.dart';

class CalceusDescScreen extends StatelessWidget {
  const CalceusDescScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              // CalceusPraevidere(screenCompletaEst: true,),
              Hero(
                tag: 'zapato-1', 
                child: CalceusPraevidere(screenCompletaEst: true,),
                ),
              Positioned(
                top: 60,
                child: FloatingActionButton(
                  onPressed: (){
                    context.pop();
                  },
                  child: Icon(Icons.chevron_left, color: Colors.white, size: 60,),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  )
                  )
            ],
          ),
         
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CalceusDescriptio(
                    titulus: "Nike Air Max 720", 
                    desriptio: "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                    ),
                    _PretiumEtBuyNow(),
                    _ColoresEtAlterButton(),
                    _ButtonsLikeCartSettings()
                ],
              ),
            )
            ),
        ],
      ),
    );
  }
}

class _PretiumEtBuyNow extends StatelessWidget {

  const _PretiumEtBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text('\$180.0', style: TextStyle(fontSize: 28),),
            Spacer(),
            Bounce(
              delay: Duration(milliseconds: 500),
              from: 8,
              child: ButtonAurantius(textus: 'Buy Now', latus: 120, altus: 40,)
              ),
            
          ],
        ),
      ),
    );
  }
}

class _ColoresEtAlterButton extends StatelessWidget {

  const _ColoresEtAlterButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ActioButtonColor(
                    color: Color.fromARGB(255, 198, 214, 66), 
                    index: 4,
                    urlImago: 'assets/imagines/verde.png',
                    ), ),
                  Positioned(
                  left: 60,
                  child: _ActioButtonColor(
                    color: Color.fromARGB(255, 255, 173, 41), 
                    index:3,
                    urlImago: 'assets/imagines/amarillo.png',
                    ),),
                  Positioned(
                  left: 30,
                  child: _ActioButtonColor(
                    color: Color.fromARGB(255, 32, 153, 241), 
                    index:2,
                    urlImago: 'assets/imagines/azul.png',
                    ),),
                   _ActioButtonColor(
                    color: Color.fromARGB(255, 54, 77, 86), 
                    index:1,
                    urlImago: 'assets/imagines/negro.png',
                    ),
              ],
              
            )
            ),
          
          
          
         
          ButtonAurantius(
            textus: 'More related items',
            altus: 30,
            latus: 170,
            color: Color.fromARGB(255, 255, 198, 17),
            )
        ],
      ),
    );
  }
}

class _ActioButtonColor extends ConsumerWidget {

  final Color color;
  final int index;
  final String urlImago;

  const _ActioButtonColor({
    required this.index,
    required this.color,
    required this.urlImago,
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FadeInLeft(
      delay: Duration(milliseconds: index *100 ),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          ref.read(calceusProvider.notifier).ponereAssetImago(urlImago);
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _ButtonsLikeCartSettings extends StatelessWidget {
  const _ButtonsLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ButtonCumUmbra(icon: Icon(Icons.star, color: Colors.red, size: 25,)),
          _ButtonCumUmbra(icon: Icon(Icons.add_shopping_cart, color: Colors.grey.withValues(alpha: 0.4), size: 25,)),
          _ButtonCumUmbra(icon: Icon(Icons.settings, color: Colors.grey.withValues(alpha: 0.4), size: 25,)),
        ],
      ),
    );
  }
}

class _ButtonCumUmbra extends StatelessWidget {
  final Icon icon;
  const _ButtonCumUmbra({
    required this.icon
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12, spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10))
        ]
      ),
      child: icon,
    );
  }
}