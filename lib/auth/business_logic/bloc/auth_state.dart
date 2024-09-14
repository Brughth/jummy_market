part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final UserModel? user;

  const AuthState({this.user});
}

final class AuthInitial extends AuthState {}

final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  const LoginSuccess({required super.user});
}

final class LoginFailure extends AuthState {
  final String message;
  const LoginFailure({required this.message});
}

final class FistTimeLaunch extends AuthState {}

final class CheckAuthStateFailure extends AuthState {}

final class CheckAuthStateSuccess extends AuthState {
  const CheckAuthStateSuccess({required super.user});
}
