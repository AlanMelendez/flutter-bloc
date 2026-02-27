import 'package:blocs_app/presentation/blocs/06-geolocation/geolocation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';


class BlocsWithBlocsScreen extends StatelessWidget {
  const BlocsWithBlocsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final geolocationCubit = context.watch<GeolocationCubit>().state.location;
    final historicLocationBloc = context.watch<HistoricLocationBloc>();
    final locationState = historicLocationBloc.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Ubicaciones: ${locationState.howManyLocations}'),
      ),
      body: ListView.builder(
        itemCount: locationState.howManyLocations,
        itemBuilder: (context, index) {
          final reverseIndex = locationState.howManyLocations - 1 - index;
          final location = locationState.historicLocations[reverseIndex];
          return ListTile(
            title: Text('Latitud: ${location.$1}, Longitud: ${location.$2}'),
          );
        },
      ),
    );
  }
}