import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      currentIndex: currentIndex,
      selectedItemColor: const Color(0xFF4A00E0),
      unselectedItemColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black45
          : Colors.white,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet_outlined),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_none),
          label: "",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: "",
        ),
      ],
    );
  }
}
