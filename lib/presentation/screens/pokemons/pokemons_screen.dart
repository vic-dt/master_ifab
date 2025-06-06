import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:master_ifab/presentation/providers/providers.dart';

class PokemonsScreen extends StatelessWidget {

  
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PokemonsVisum();
  }
}

class PokemonsVisum extends ConsumerStatefulWidget {
  const PokemonsVisum({super.key});

  @override
  PokemonsVisumState createState() => PokemonsVisumState();
}

class PokemonsVisumState extends ConsumerState<PokemonsVisum> {

  bool oneratusEst = false;

  final scrollController = ScrollController();

  @override
  void initState() {

    scrollController.addListener((){
      if (scrollController.position.pixels + 200>scrollController.position.maxScrollExtent){
        vadeproximaPagina();
      } 
    });


    super.initState();
    
  }
  @override
  void dispose(){
    scrollController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            title: Text('Pokemons'),
            floating: true,
            backgroundColor: Theme.of(context).secondaryHeaderColor.withValues(alpha: 0.5),
          ),
          _PokemonGrid(),
        ],
      ),
    );
  }
  Future vadeproximaPagina() async{

    if (oneratusEst) return;
    oneratusEst = true;
    await Future.delayed(Duration(seconds: 2));

    ref.read(pokemonIdsProvider.notifier).update((state)=>[
      ...state,
      ...List.generate(30,(index)=> state.length + index + 1)
    ]);
    oneratusEst=false;

    movereScrollAdDescendit();

  }

  void movereScrollAdDescendit(){
    if (scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels +200, 
      duration: Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn);
  }
}


class _PokemonGrid extends ConsumerWidget {

  const _PokemonGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref ){


    final pokemonIds =ref.watch(pokemonIdsProvider);

    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        ),
        itemCount: pokemonIds.length,
      itemBuilder:(context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/request/${index+1}');
          },
          child:Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${index+1}.png',
          fit: BoxFit.contain,
          ),
          // child: Container(
          //   color: Colors.blue, 
          //   child: Center(
          //     child: Text('${index+1}'
          //     ),
          //     ),
          //     )
              );
      },
    );
  }
}