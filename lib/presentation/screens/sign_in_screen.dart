import 'package:expense_tracker/bloc/sing_in/sign_in_bloc.dart';
import 'package:expense_tracker/presentation/widgets/custom_text_field.dart';
import 'package:expense_tracker/presentation/widgets/small_button.dart';
import 'package:expense_tracker/presentation/widgets/small_gradient_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final SignInBloc _signInBloc;
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();

  @override
  void initState() {
    _signInBloc = SignInBloc(auth: FirebaseAuth.instance);
    super.initState();
  }

  @override
  void dispose() {
    _signInBloc.close();
    emailFocus.dispose();
    passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _signInBloc,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.white,
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.errorMessage != null && state.changeScreen) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: (context, state) {
              return state.changeScreen
                  ? Stack(
                      children: [
                        //Background content
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/background_small.png',
                              width: MediaQuery.of(context).size.width * 0.94,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/icons/money_logo_white.png',
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Foreground content
                        SafeArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minHeight: MediaQuery.of(context).size.height,
                              ),
                              child: IntrinsicHeight(
                                child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.45),
                                    _buildSignInForm(state),
                                    const SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 22),
                                      child: Column(
                                        children: [
                                          SmallGradientButton(
                                            text: 'Sign in',
                                            isLoading: state.isSubmitting,
                                            onTap: () {
                                              _signInBloc.add(
                                                SignInSubmitEvent(),
                                              );
                                              // context.push('/base_screen'),
                                            },
                                          ),
                                          const SizedBox(height: 10),
                                          SmallButton(
                                            text: 'Go back',
                                            icon: Icons.arrow_back,
                                            onTap: () {
                                              _signInBloc.add(
                                                const ChangeScreenEvent(
                                                  changeScreen: false,
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Stack(
                      children: [
                        //Background content
                        Positioned.fill(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Image.asset(
                              'assets/images/background_small.png',
                              width: MediaQuery.of(context).size.width * 0.94,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.05,
                          left: MediaQuery.of(context).size.width * 0.05,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                'assets/icons/money_logo_white.png',
                                height:
                                MediaQuery.of(context).size.height * 0.07,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                'Welcome',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Foreground content
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              SmallGradientButton(
                                text: 'Sign in with email',
                                onTap: () {
                                  _signInBloc.add(
                                    const ChangeScreenEvent(
                                      changeScreen: true,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 20),
                              SmallButton(
                                text: 'Sign in with',
                                icon: FontAwesomeIcons.google,
                                iconSize: 24,
                                verticalPadding: 10,
                                onTap: () {},
                              ),
                              const SizedBox(height: 20),
                              SmallButton(
                                text: 'Sign in with',
                                icon: Icons.apple_rounded,
                                iconSize: 30,
                                verticalPadding: 10,
                                onTap: () {},
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm(SignInState state) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'Sign in',
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 12),
          CustomTextField(
            label: "Email",
            val: state.email,
            focusNode: emailFocus,
            nextFocusNode: passwordFocus,
            onChanged: (value) =>
                _signInBloc.add(EmailChangeEvent(email: value)),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            label: "Password",
            val: state.password,
            focusNode: passwordFocus,
            isPasswordField: true,
            textInputAction: TextInputAction.done,
            onChanged: (value) =>
                _signInBloc.add(PasswordChangeEvent(password: value)),
          ),
        ],
      ),
    );
  }
}
