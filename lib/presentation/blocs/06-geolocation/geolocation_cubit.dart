import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'geolocation_state.dart';

class GeolocationCubit extends Cubit<GeolocationState> {
  GeolocationCubit() : super(const GeolocationState());

  Future<void> checkStatus() async{

    //Verify location and permissions

  }

  void watchUserLocation(){

    //Get user location and update state

  }
}
