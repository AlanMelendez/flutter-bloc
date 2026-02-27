part of 'historic_location_bloc.dart';

 class HistoricLocationState extends Equatable {

  final List<(double lat, double lng)> historicLocations;

  const HistoricLocationState({
    this.historicLocations = const [],
  });

    HistoricLocationState copyWith({
      List<(double lat, double lng)>? historicLocations,
    }) {
      return HistoricLocationState(
        historicLocations: historicLocations ?? this.historicLocations,
      );
    }
  
  @override
  List<Object> get props => [historicLocations];
}

