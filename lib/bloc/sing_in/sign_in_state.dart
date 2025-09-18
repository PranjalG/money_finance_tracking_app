part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitting;
  final String? errorMessage;
  final bool changeScreen;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.errorMessage,
    this.changeScreen = false,
  });

  SignInState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    String? errorMessage,
    bool? changeScreen,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
      changeScreen: changeScreen ?? this.changeScreen,
    );
  }

  @override
  List<Object?> get props => [
        email,
        password,
        isSubmitting,
        errorMessage,
        changeScreen,
      ];
}
