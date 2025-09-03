import 'package:expense_tracker/bloc/sing_in/sign_in_bloc.dart';
import 'package:expense_tracker/presentation/widgets/email_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/small_gradient_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc signInBloc;

  @override
  void initState() {
    signInBloc = SignInBloc(auth: FirebaseAuth.instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => signInBloc,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.errorMessage != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errorMessage!)),
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  // Background
                  Image.asset(
                    'assets/images/background_small.png',
                    width: MediaQuery.of(context).size.width * 0.95,
                  ),
                  // Foreground content
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset(
                          'assets/icons/money_logo_white.png',
                          height: MediaQuery.of(context).size.height * 0.07,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Welcome',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 28,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Sign in',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              EmailTextField(
                                label: "Email",
                                val: state.email,
                                onChanged: (value) {
                                  signInBloc.add(
                                    EmailChangeEvent(
                                      email: value,
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              EmailTextField(
                                label: "Password",
                                val: state.password,
                                onChanged: (value) {
                                  signInBloc.add(
                                    PasswordChangeEvent(
                                      password: value,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        state.isSubmitting
                            ? const CircularProgressIndicator()
                            : SmallGradientButton(
                                text: 'Sign in',
                                onTap: () {
                                  context.push('/base_screen');
                                },
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
}
