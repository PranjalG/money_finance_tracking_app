import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:expense_tracker/main.dart';

void main() {
  testWidgets('Expense Tracker home screen loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame
    await tester.pumpWidget(const ExpenseTrackerApp());

    // Verify that the app title or homepage text appears
    expect(find.text('Expense Tracker'), findsOneWidget);

    // Verify that no expenses are listed initially
    expect(find.text('No expenses yet!'), findsOneWidget);

    // Find and tap the add button (FloatingActionButton or IconButton)
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // After tapping add, check that a dialog/screen for adding an expense appears
    expect(find.text('Add Expense'), findsOneWidget);
  });
}
