import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/presentation/screens/drawer_options_screen.dart';
import 'package:expense_tracker/presentation/widgets/medium_gradient_button.dart';
import 'package:expense_tracker/presentation/widgets/profile/expense_graph_card.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: const Color(0xFF4960F9),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
        ),
        drawer: const Drawer(
          child: DrawerOptionsScreen(),
        ),
        body: SafeArea(
          child: SizedBox.expand(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.36,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.3, 0.8],
                      colors: [
                        Color(0xFF4960F9),
                        Color(0xFF1937FE),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 50,
                    child: Row(
                      children: [
                        const Text(
                          "Good morning!,\nEmma",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 60),
                        Image.asset(
                          'assets/images/user_profile.png',
                          height: 80,
                        ),
                      ],
                    )),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  left: 30,
                  right: 20,
                  child: Column(
                    children: [
                      ExpenseGraphCard(
                        isDarkMode: themeNotifier.value == ThemeMode.dark,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      MediumGradientButton(
                        text: "Check your\n Bank Accounts",
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
