part of 'sign_in_bloc.dart';

class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object?> get props => [];
}

class EmailChangeEvent extends SignInEvent {
  final String email;

  const EmailChangeEvent({required this.email});
}

class PasswordChangeEvent extends SignInEvent {
  final String password;

  const PasswordChangeEvent({required this.password});
}

class SignInSubmitEvent extends SignInEvent {}