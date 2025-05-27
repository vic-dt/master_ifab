import 'package:flutter/material.dart';

class SensoresScreen extends StatefulWidget {
  const SensoresScreen({super.key});

  @override
  State<SensoresScreen> createState() => _SensoresScreenState();
}

class _SensoresScreenState extends State<SensoresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Datos de los sensores'),
      ),
      body: PageView(
        physics: const BouncingScrollPhysics(),
        children: [
          Gyroscope(),
          Accelerometrum(),
          Magnetometrum(),
        ],
      ),

    );
  }
}

class Gyroscope extends StatelessWidget {
  const Gyroscope({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text('Giroscopio', style: TextStyle(fontSize: 43, color: Colors.grey),),
          ),
          SizedBox(height: 150,),
          Center(
            child: Text(
'''
x: 10 
y: 34
z: 97
''', style: TextStyle(fontSize: 40, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}


class Accelerometrum extends StatelessWidget {
  const Accelerometrum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text('Acelerómetro', style: TextStyle(fontSize: 43, color: Colors.grey),),
          ),
          SizedBox(height: 150,),
          Center(
            child: Text(
'''
x: 10 
y: 34
z: 97
''', style: TextStyle(fontSize: 40, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}

class Magnetometrum extends StatelessWidget {
  const Magnetometrum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 30,),
          Center(
            child: Text('Magnetómetro', style: TextStyle(fontSize: 43, color: Colors.grey),),
          ),
          SizedBox(height: 150,),
          Center(
            child: Text(
'''
x: 10 
y: 34
z: 97
''', style: TextStyle(fontSize: 40, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}