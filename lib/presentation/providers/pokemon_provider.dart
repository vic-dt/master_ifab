import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:master_ifab/services/pokemon_service.dart';

final pokemonProvider= FutureProvider.family((ref, id) async{

final (pokemon, error) = await PokemonService.getPokemon(id);

if (pokemon != null) return pokemon;
});