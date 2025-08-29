import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/presentation/widgets/spend_save_graph.dart';
import 'package:flutter/material.dart';

class ExpenseGraphCard extends StatelessWidget {
  final bool isDarkMode;

  const ExpenseGraphCard({
    super.key,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: isDarkMode
            ? Colors.grey.shade900
            : Colors.grey.shade50,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          isDarkMode
              ? BoxShadow(
            color: Colors.white.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 2),
          ) :
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 36, right: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Your total balance",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: themeNotifier.value == ThemeMode.dark
                        ? Colors.white
                        : Colors.black45,
                  ),
                ),
                const SizedBox(width: 80),
                Icon(
                  Icons.more_horiz_rounded,
                  size: 16,
                  color: isDarkMode
                      ? Colors.white
                      : Colors.black45,
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Text(
                  "₹ 86,300 ",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Color(0xFF2D99FF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SavingsSpendingBarChart(),
          ],
        ),
      ),
    );
  }
}
