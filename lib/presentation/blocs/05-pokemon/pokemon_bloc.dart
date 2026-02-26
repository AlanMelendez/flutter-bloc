import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonState()) {
    on<PokemonAddEvent>((event, emit) {
      final newPokemons = Map<int, String>.from(state.pokemons);
      newPokemons[event.pokemonId] = event.pokemonName;

      emit(state.copyWith(pokemons: newPokemons));
    });
  }

  Future<String> fetchPokemonById(int id) async {
    try {
      final pokemonName = await PokemonInformation.getPokemonName(id);

      add(PokemonAddEvent(id, pokemonName));

      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon information: $e');
    }
  }
}
