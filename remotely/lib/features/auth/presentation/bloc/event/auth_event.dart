import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.login(String email, String password) = _Login;
  const factory AuthEvent.logout() = _Logout;
  const factory AuthEvent.signup(String email, String password) = _Signup;

  const factory AuthEvent.toggleAuthPage(bool isSignUp) = _ToggleAuthPage;
}