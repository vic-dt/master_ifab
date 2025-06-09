import 'package:flutter/material.dart';

class CalceusPraevidere extends StatelessWidget {
  const CalceusPraevidere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 440,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 207, 83),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          _CalceusCumUmbra(),
          _CalceusMenserae(),

      ],)
    );
  }
}

class _CalceusCumUmbra extends StatelessWidget {

  const _CalceusCumUmbra();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:30),
      child: Stack(
        children: [
          // _UmbraProjecta(),
          Positioned(bottom:10, right: 0, child: _UmbraProjecta()),

          Image(image: AssetImage('assets/imagines/azul.png'), width: 320, height: 320, fit: BoxFit.cover,),
        ],
      ),
    );
  }
}

class _UmbraProjecta extends StatelessWidget {
  const _UmbraProjecta();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow:[
            BoxShadow(color: Color.fromARGB(254, 234, 161, 78), blurRadius: 40)
          ]
        ),
      ),
    );
  }
}

class _CalceusMenserae extends StatelessWidget {
  const _CalceusMenserae();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _HaecMensura(numerus: 7),
          _HaecMensura(numerus: 7.5),
          _HaecMensura(numerus: 8),
          _HaecMensura(numerus: 8.5),
          _HaecMensura(numerus: 9),
          _HaecMensura(numerus: 9.5),
      
        ],
      ),
    );
  }
}

class _HaecMensura extends StatelessWidget {
  final double numerus;

  const _HaecMensura({
    required this.numerus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
     
      decoration: BoxDecoration(
         color: numerus== 9 ? Color.fromARGB(255, 241, 152, 58): Colors.white,
         borderRadius: BorderRadius.circular(10),
         boxShadow: [
          BoxShadow(
            color:numerus== 9 ? Color.fromARGB(255, 226, 106, 42): Color.fromARGB(255, 245, 161, 58),
            blurRadius: 10,
            offset: Offset(0, 5)
          )
         ]
    
      ),
      child: Text('$numerus'.replaceAll('.0','' ), 
      style: TextStyle(
        color: numerus== 9 ? Colors.white: Color.fromARGB(255, 245, 161, 58)),),
    );
  }
}