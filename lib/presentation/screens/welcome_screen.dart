import 'package:expense_tracker/presentation/widgets/small_button.dart';
import 'package:expense_tracker/presentation/widgets/small_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Background
            Image.asset(
              'assets/images/background_medium.png',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
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
                  SmallGradientButton(
                    text: 'Sign in',
                    onTap: () {
                      context.push('/base_screen');
                    },
                  ),
                  const SizedBox(height: 20),
                  SmallButton(
                    text: 'Sign up',
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
