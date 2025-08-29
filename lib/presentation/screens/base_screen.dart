import 'package:expense_tracker/presentation/screens/landing_screen.dart';
import 'package:expense_tracker/presentation/screens/profile_screen.dart';
import 'package:expense_tracker/presentation/screens/wallet_info_screen.dart';
import 'package:expense_tracker/presentation/widgets/navbar.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      setState(() {
        index = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: TabBarView(
        controller: _tabController,
        children: const [
          LandingScreen(),
          WalletInfoScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        onTap: (newIndex) {
          _tabController.animateTo(newIndex);
          setState(() {
            index = newIndex;
          });
        },
        currentIndex: index,
      ),
    );
  }
}
