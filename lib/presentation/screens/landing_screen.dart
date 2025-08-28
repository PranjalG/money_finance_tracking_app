import 'package:expense_tracker/main.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Landing Screen"),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
            onPressed: () {
              themeNotifier.value =
              themeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Total Balance",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 8),
                    Text("\$1,250",
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Income: \$2,000",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w500)),
                        Text("Expenses: \$750",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Transactions Heading
            const Text("Recent Transactions",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold)),

            const SizedBox(height: 10),

            // Transaction List
            Expanded(
              child: ListView(
                children: const [
                  TransactionTile(
                    title: "Groceries",
                    amount: -50,
                    date: "Aug 18",
                  ),
                  TransactionTile(
                    title: "Salary",
                    amount: 2000,
                    date: "Aug 15",
                  ),
                  TransactionTile(
                    title: "Electricity Bill",
                    amount: -120,
                    date: "Aug 12",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final int amount;
  final String date;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: amount < 0 ? Colors.red[100] : Colors.green[100],
          child: Icon(
            amount < 0 ? Icons.arrow_downward : Icons.arrow_upward,
            color: amount < 0 ? Colors.red : Colors.green,
          ),
        ),
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(
          (amount < 0 ? "-\$${amount.abs()}" : "+\$${amount}"),
          style: TextStyle(
            color: amount < 0 ? Colors.red : Colors.green,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}