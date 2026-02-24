
import 'package:bloc/bloc.dart';


class UsernameCubit extends Cubit<String> {
    UsernameCubit() : super('no-username');
    
    void updateUsername(String username) {
        emit(username);
    }

    void setUserName(String newUsername) {
        emit(newUsername);
    }


}
