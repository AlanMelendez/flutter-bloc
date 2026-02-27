import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {

    final void Function((double lat, double lng) location)? onNewUserLocationCallBack;

  GeolocationCubit({this.onNewUserLocationCallBack}) : super(const GeolocationState());


  Future<void> checkStatus() async{
    //Verify location and permissions
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permissionGranted = await Geolocator.checkPermission();

    if(permissionGranted == LocationPermission.denied){
      permissionGranted = await Geolocator.requestPermission();
    }

    emit(state.copyWith(
      seviceEnabled: serviceEnabled,
      permissionGranted: permissionGranted == LocationPermission.always || permissionGranted == LocationPermission.whileInUse,
    ));
 
  }

  Future<void> watchUserLocation() async{

    //Get user location and update state
    await checkStatus();

    if(!state.seviceEnabled && !state.permissionGranted) return;


    const locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 15,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
    .listen((Position position) {
      emit(state.copyWith(location: (position.latitude, position.longitude)));

      if(onNewUserLocationCallBack != null){
        onNewUserLocationCallBack!((position.latitude, position.longitude));
      }
    });







  }
}
