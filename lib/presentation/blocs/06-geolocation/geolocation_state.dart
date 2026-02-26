part of 'geolocation_cubit.dart';

 class GeolocationState extends Equatable {
  final (double latitude, double longitude) location;
  final bool seviceEnabled;
  final bool permissionGranted;

  const GeolocationState({
    this.location = const (0.0, 0.0),
    this.seviceEnabled = false,
    this.permissionGranted = false,
  });

   GeolocationState copyWith({
    (double latitude, double longitude)? location,
    bool? seviceEnabled,
    bool? permissionGranted,
  }) {
    return GeolocationState(
      location: location ?? this.location,
      seviceEnabled: seviceEnabled ?? this.seviceEnabled,
      permissionGranted: permissionGranted ?? this.permissionGranted,
    );
  }

  @override
  List<Object> get props => [location, seviceEnabled, permissionGranted];
}

