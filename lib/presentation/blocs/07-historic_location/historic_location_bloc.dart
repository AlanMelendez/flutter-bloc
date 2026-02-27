import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'historic_location_event.dart';
part 'historic_location_state.dart';

class HistoricLocationBloc
    extends Bloc<HistoricLocationEvent, HistoricLocationState> {
  HistoricLocationBloc() : super(const HistoricLocationState()) {
    on<NewLocationEvent>((event, emit) => _onNewLocationHandlerEvent);
  }

  void _onNewLocationHandlerEvent( NewLocationEvent event, Emitter<HistoricLocationState> emit) {

    emit(state.copyWith(
      historicLocations: [
        ...state.historicLocations,
        event.location
      ],
    ));
    // final newHistoricLocations =
    //     List<(double lat, double lng)>
    //       .from(state.historicLocations)
    //       ..add((event.lat, event.lng));
    // emit(state.copyWith(historicLocations: newHistoricLocations));
  }
}
