import 'package:bloc/bloc.dart';
import 'package:marketplace/auth/data/models/user_model.dart';
import 'package:marketplace/auth/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc({
    required this.repository,
  }) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      try {
        emit(LoginLoading());
        final user = await repository.login(
          username: event.username,
          password: event.password,
        );
        emit(LoginSuccess(user: user));
      } catch (e) {
        emit(LoginFailure(
          message: e.toString(),
        ));
      }
    });

    on<CheckAuthStateEvent>((event, emit) async {
      try {
        final SharedPreferences prefs = await SharedPreferences.getInstance();

        var value = prefs.getBool('is_first_time_launch');

        if (value == false) {
          var user = await repository.getCurrentUser();

          if (user != null) {
            emit(CheckAuthStateSuccess(user: user));
          }

          emit(CheckAuthStateFailure());
          return;
        }

        emit(FistTimeLaunch());
      } catch (e) {
        emit(CheckAuthStateFailure());
      }
    });
  }
}
