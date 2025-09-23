import 'package:expense_tracker/services/enum.dart';
import 'package:flutter/material.dart';

class ManageExpensesScreen extends StatefulWidget {
  const ManageExpensesScreen({super.key});

  @override
  State<ManageExpensesScreen> createState() => _ManageExpensesScreenState();
}

class _ManageExpensesScreenState extends State<ManageExpensesScreen> {
  final List<Map<String, dynamic>> _categories = [
    {"name": "Food", "icon": Icons.restaurant},
    {"name": "Shopping", "icon": Icons.shopping_bag},
    {"name": "Groceries", "icon": Icons.local_grocery_store},
    {"name": "Electricity Bill", "icon": Icons.electric_bolt},
    {"name": "House Rent", "icon": Icons.home},
    {"name": "Vehicle Rent", "icon": Icons.directions_car},
  ];

  void _addCategory() async {
    final TextEditingController controller = TextEditingController();
    IconData selectedIcon = Icons.category;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "Add New Category",
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "Enter category name",
                  hintStyle: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 18),
              DropdownButtonFormField<IconData>(
                initialValue: selectedIcon,
                items: ExpenseCategory.values.map((category) {
                  return DropdownMenuItem(
                    value: category.icon,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          category.label,
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 14,
                          ),
                        ),
                        Icon(
                          category.icon,
                          size: 18,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (icon) {
                  selectedIcon = icon!;
                },
                decoration: const InputDecoration(
                  labelText: "Choose Icon",
                  border: OutlineInputBorder(),
                  focusColor: Colors.blue,
                  enabled: true,
                  enabledBorder: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.text.trim().isNotEmpty) {
                  setState(() {
                    _categories.add({
                      "name": controller.text.trim(),
                      "icon": selectedIcon,
                    });
                  });
                }
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _deleteCategory(int index) {
    setState(() {
      _categories.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Expenses"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.1,
        ),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          return Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        category["icon"],
                        size: 40,
                        color: Colors.blue,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category["name"],
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 4,
                  top: 4,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteCategory(index),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF4A00E0)
            : const Color(0xFF44E3F3),
        foregroundColor: Colors.white70,
        onPressed: _addCategory,
        child: const Icon(Icons.add),
      ),
    );
  }
}
