part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitting;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.errorMessage,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isSubmitting,
        errorMessage,
      ];
}
