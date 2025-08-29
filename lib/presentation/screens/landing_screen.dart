import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/presentation/widgets/medium_gradient_button.dart';
import 'package:expense_tracker/presentation/widgets/navbar.dart';
import 'package:expense_tracker/presentation/widgets/profile/expense_graph_card.dart';
import 'package:expense_tracker/presentation/widgets/spend_save_graph.dart';
import 'package:expense_tracker/presentation/widgets/theme_change_icon_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
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
              const ThemeChangeIconButton(),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.28,
                left: 30,
                right: 20,
                child: Column(
                  children: [
                    const ExpenseGraphCard(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF4960F9), Color(0xFF1937FE)],
                ),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context); // close drawer
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        onTap: (v) {},
      ),
    );
  }
}
