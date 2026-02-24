part of 'guests_bloc.dart';

enum GuestsFilter {
  all,
  invited,
  notInvited,
}

class GuestsState extends Equatable {
  final GuestsFilter filterSelected;
  final List<Todo> guests;

  const GuestsState({
    this.filterSelected = GuestsFilter.all,
    this.guests = const [],
  });

  int get howManyGuests => guests.length;

  int get howManyFilteredGuests => filteredGuests.length;

  List<Todo> get filteredGuests {
    switch (filterSelected) {
      case GuestsFilter.invited:
        return guests.where((guest) => guest.done).toList();
      case GuestsFilter.notInvited:
        return guests.where((guest) => !guest.done).toList();
      case GuestsFilter.all:
        return guests;
    }
  }

  GuestsState copyWith({
    GuestsFilter? filterSelected,
    List<Todo>? guests,
  }) {
    return GuestsState(
      filterSelected: filterSelected ?? this.filterSelected,
      guests: guests ?? this.guests,
    );
  }

  @override
  List<Object> get props => [filterSelected, guests];
}

final class GuestsInitial extends GuestsState {}
