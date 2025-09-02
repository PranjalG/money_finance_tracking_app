import 'package:expense_tracker/presentation/widgets/email_textfield.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/small_gradient_button.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background
            Image.asset(
              'assets/images/background_small.png',
              width: MediaQuery.of(context).size.width * 0.95,
            ),
            // Foreground content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
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
                          label: "Enter email",
                          onTap: () {},
                        ),
                        const SizedBox(height: 10),
                        EmailTextField(
                          label: "Enter password",
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SmallGradientButton(
                    text: 'Sign in',
                    onTap: () {
                      context.push('/base_screen');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
