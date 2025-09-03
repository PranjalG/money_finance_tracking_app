import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final FirebaseAuth _auth;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  // User? get currentUser => _auth.currentUser;

  SignInBloc({required FirebaseAuth auth})
      : _auth = auth,
        super(const SignInState()) {
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
    on<SignInSubmitEvent>(_onSignInSubmitEvent);
  }

  void _onEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(email: event.email, errorMessage: null));
  }

  void _onPasswordChangeEvent(
    PasswordChangeEvent event,
    Emitter<SignInState> emit,
  ) {
    emit(state.copyWith(password: event.password, errorMessage: null));
  }

  Future<void> _onSignInSubmitEvent(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(isSubmitting: true, errorMessage: null));
    try {
      await _auth.signInWithEmailAndPassword(
        email: state.email,
        password: state.password,
      );
      emit(state.copyWith(isSubmitting: false));
    } on FirebaseAuthException catch (e) {
      emit(state.copyWith(isSubmitting: false, errorMessage: e.message));
    }
  }
}
