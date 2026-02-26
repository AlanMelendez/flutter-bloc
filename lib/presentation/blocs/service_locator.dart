 
import 'package:blocs_app/config/helpers/pokemon_information.dart';
import 'package:blocs_app/config/router/app_router.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:get_it/get_it.dart';

 GetIt getIt = GetIt.instance;
 
 void serviceLocatorInit(){

  getIt.registerSingleton<UsernameCubit>(UsernameCubit());
  getIt.registerSingleton<CounterCubit>(CounterCubit());
  getIt.registerSingleton<ThemeCubit>(ThemeCubit());
  getIt.registerSingleton(RouterSimpleCubit());

  getIt.registerSingleton<GuestsBloc>(GuestsBloc());
  getIt.registerSingleton<PokemonBloc>(PokemonBloc(
    pokemonFetch:  PokemonInformation.getPokemonName, //Send the reference of the function without executing it. (exlude the parentheses and parameters)
  ));

  getIt.registerSingleton<GeolocationCubit>(GeolocationCubit());

 }