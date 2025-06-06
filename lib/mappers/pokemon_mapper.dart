import 'package:master_ifab/config/entities/pokemon.dart';
import 'package:master_ifab/models/pokeapi_responsio.dart';

class PokemonMapper {
  static  Pokemon pokeApiPokemonToEntity(Map<String, dynamic> json){
    final pokeApiPokemon = PokeApiPokemonResponsio.fromJson(json);

    return Pokemon(
      id: pokeApiPokemon.id, 
      nomen: pokeApiPokemon.name, 
      altitudo: pokeApiPokemon.height, 
      pondus: pokeApiPokemon.weight, 
      facultates: pokeApiPokemon.abilities.map((facultas)=> facultas.ability!.name).toList(),
      faciemImaginem: pokeApiPokemon.sprites.other?.home.frontDefault,
      );
  }
}