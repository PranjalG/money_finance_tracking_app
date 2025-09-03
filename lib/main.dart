import 'package:expense_tracker/services/auth/auth_gate.dart';
import 'package:expense_tracker/services/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);
// const clientId = '1:1028068402405:android:54ed3ca19b4d8e685ae00c';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const ExpenseTrackerApp(
      // clientId: clientId,
      ));
}

class ExpenseTrackerApp extends StatelessWidget {
  // final String clientId;

  const ExpenseTrackerApp({
    super.key,
    // required this.clientId,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Expense Tracker',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            brightness: Brightness.light,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            brightness: Brightness.dark,
            useMaterial3: true,
          ),
          themeMode: currentMode,
          home: AuthGate(
            // clientId: clientId,
            router: router,
          ),
        );
      },
    );
  }
}
