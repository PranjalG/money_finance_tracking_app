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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.dark
                ? const Color(0xFF4A00E0)
                : const Color(0xFF44E3F3),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: currentIndex,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: onTap,
              items: [
                _buildAnimatedIcon(
                  icon: Icons.account_balance_wallet_outlined,
                  isSelected: currentIndex == 0,
                ),
                _buildAnimatedIcon(
                  icon: Icons.notifications_none,
                  isSelected: currentIndex == 1,
                ),
                _buildAnimatedIcon(
                  icon: Icons.person_outline,
                  isSelected: currentIndex == 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildAnimatedIcon({
    required IconData icon,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      label: "",
      icon: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutBack,
        tween: Tween<double>(begin: 1.0, end: isSelected ? 1.3 : 1.0),
        builder: (context, value, child) {
          return Transform.scale(
            scale: value,
            child: Icon(icon),
          );
        },
      ),
    );
  }
}
