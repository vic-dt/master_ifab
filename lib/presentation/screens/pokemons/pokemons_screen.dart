import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PokemonsScreen extends StatelessWidget {

  
  const PokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PokemonsVisum();
  }
}

class PokemonsVisum extends StatefulWidget {
  const PokemonsVisum({super.key});

  @override
  State<PokemonsVisum> createState() => _PokemonsVisumState();
}

class _PokemonsVisumState extends State<PokemonsVisum> {

  final scrollController = ScrollController();


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
}


class _PokemonGrid extends StatelessWidget {

  const _PokemonGrid();

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        ),
      itemBuilder:(context, index) {
        return GestureDetector(
          onTap: () {
            context.push('/request/${index+1}');
          },
          child: Container(
            color: Colors.blue, 
            child: Center(
              child: Text('${index+1}'
              ),
              ),
              )
              );
      },
    );
  }
}