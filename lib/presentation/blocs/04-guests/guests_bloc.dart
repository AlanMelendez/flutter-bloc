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

    on<AddGuestEvent>(_addGuestHandler);

    on<ToggleGuestEvent>(_toggleGuestHandler);

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

  void toggleGuest(String id) {
    add(ToggleGuestEvent(id));
  }

   void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final newGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
          completedAt: guest.done ? null : DateTime.now(),
        );
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: newGuests));
   
  }

  void _addGuestHandler(AddGuestEvent event, Emitter<GuestsState> emit) {
    final newGuest = Todo(
      id: uuid.v4(),
      description: event.name,
      completedAt: null,
    );

    emit(state.copyWith(guests: [...state.guests, newGuest]));
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
