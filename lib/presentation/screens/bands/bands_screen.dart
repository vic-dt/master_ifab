
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:master_ifab/config/config.dart';

class BandsScreen extends StatefulWidget {
  const BandsScreen({super.key});

  @override
  State<BandsScreen> createState() => _BandsScreenState();
}

class _BandsScreenState extends State<BandsScreen> {

  List<Band> bands=[
    Band(id: '1', nomen: 'Metallica', numerusVotum: 5),
    Band(id: '2', nomen: 'Queen', numerusVotum: 1),
    Band(id: '3', nomen: 'Héroes del Silencio', numerusVotum: 2),
    Band(id: '4', nomen: 'Bon Jovi', numerusVotum: 5),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i)=>_bandTile(bands[i])
        
        ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        onPressed: ()=> addereNovumBand(),
        child: Icon(Icons.add),
        ),
    );
  }

  Widget _bandTile(Band band) {
    return Dismissible(
      key: Key(band.id) ,
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        bands.remove(band);
      },
      background: Container(
        padding: const EdgeInsets.only(left:8),
        color: Colors.red,
        child: 
        const Align(
          alignment: Alignment.centerLeft,
          child: Text('Delete Band', style: TextStyle(color: Colors.white)),
        )
        
      ),
      child: ListTile(
            leading: CircleAvatar(
              child: Text(band.nomen.substring(0, 2).toUpperCase(),
              style: TextStyle(fontFamily: "CupertinoSystemText", fontSize: 17),
              ),
            ),
            title: Text(band.nomen),
            trailing: Text('${band.numerusVotum}', style: TextStyle(fontSize: 20),),
            onTap: (){
              band.numerusVotum++;
              setState(() {
                
              });
            },
      
          ),
    );
  }
  addereNovumBand(){
    final TextEditingController textumController = TextEditingController();

    // showDialog(
    //   context: context, 
    //   builder:(context) {
    //     return AlertDialog(
    //       title: const Text('New band name'),
    //       content: TextField(controller: textumController,),
    //       actions: [
    //         MaterialButton(
    //           elevation: 5,
    //           textColor: Colors.blue,
    //           child: Text('Add'),
    //           onPressed: ()=> addereBandAdCollectione(textumController.text)
    //           )
    //       ],
    //     );
    //   },
    //   );

    showCupertinoDialog(
      context: context, 
      builder: ( BuildContext context ) => CupertinoAlertDialog(
        title: const Text('New band name'),
        content:  CupertinoTextField(
          controller: textumController,
          style: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark 
              ? Colors.white 
              : Colors.black
            )
        ),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: const Text('Add'),
            onPressed: () {
              addereBandAdCollectione(textumController.text);
            }
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            child: const Text('Close'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      )
    );

  }
  void addereBandAdCollectione(String nomen){
    if(nomen.length>1){
      bands.add(
      Band(
        id:DateTime.now().toString(), 
        nomen: nomen, 
        numerusVotum: 0,
        )
    );
    }
    Navigator.pop(context);

    setState(() {});
    
  }
 
}

