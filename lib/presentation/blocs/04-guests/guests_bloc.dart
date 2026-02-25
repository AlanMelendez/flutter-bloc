import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/config.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'guests_event.dart';
part 'guests_state.dart';

const uuid = Uuid();

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc()
      : super(GuestsState(guests: [
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: null),
          Todo(
              id: uuid.v4(),
              description: RandomGenerator.getRandomName(),
              completedAt: DateTime.now()),
        ])) {
    on<SetCustomFilterEvent>((event, emit) {
      emit(state.copyWith(filterSelected: event.newFilter));
    });

    on<AddGuestEvent>((event, emit) {

        final newGuest = Todo(
          id: uuid.v4(),
          description: event.name,
          completedAt: null,
        );
  
        emit(state.copyWith(guests: [...state.guests, newGuest]));

    });

    // on<SetInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filterSelected: GuestsFilter.invited));
    // });

    // on<SetAllFilterEvent>((event, emit) {
    //   emit(state.copyWith(filterSelected: GuestsFilter.all));
    // });

    // on<SetNotInvitedFilterEvent>((event, emit) {
    //   emit(state.copyWith(filterSelected: GuestsFilter.notInvited));
    // });
  }
  void addGuest(String name) {
    add(AddGuestEvent(name));
  }

  void changeFilter(GuestsFilter newFilter) {
    add(SetCustomFilterEvent(newFilter));
    // switch (newFilter) {
    //   case GuestsFilter.all:
    //     add(SetAllFilterEvent());
    //     break;
    //   case GuestsFilter.invited:
    //     add(SetInvitedFilterEvent());
    //     break;
    //   case GuestsFilter.notInvited:
    //     add(SetNotInvitedFilterEvent());
    //     break;
    // }
  }
}
