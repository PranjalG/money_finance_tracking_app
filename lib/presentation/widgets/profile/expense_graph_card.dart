import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/presentation/widgets/spend_save_graph.dart';
import 'package:flutter/material.dart';

class ExpenseGraphCard extends StatelessWidget {
  const ExpenseGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: themeNotifier.value == ThemeMode.dark
                ? Colors.white
                : Colors.black.withOpacity(0.1),
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
            const Row(
              children: [
                Text(
                  "Your total balance",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black45
                  ),
                ),
                SizedBox(width: 80),
                Icon(
                  Icons.more_horiz_rounded,
                  size: 16,
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
