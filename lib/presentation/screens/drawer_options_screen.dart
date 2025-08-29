import 'package:expense_tracker/presentation/widgets/theme_change_icon_button.dart';
import 'package:flutter/material.dart';

class DrawerOptionsScreen extends StatelessWidget {
  const DrawerOptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DrawerHeader(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Icon(Icons.ac_unit),
          // Container(
          //   decoration: const BoxDecoration(
          //     shape: BoxShape.circle,
          //   ),
          //   child: Image.asset('assets/images/background.png'),
          // ),
        ),
        const ThemeChangeIconButton(),
        const SizedBox(height: 10),
        const Text('Home'),
        const SizedBox(height: 20),
        const Text('Work - Error page'),
        const SizedBox(height: 20),
        const SizedBox(height: 10),
        const Text('Home'),
        const SizedBox(height: 20),
        const Text('Work - Error page'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo_rounded),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
          ],
        ),
      ],
    );
  }
}
