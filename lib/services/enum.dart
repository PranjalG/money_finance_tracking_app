import 'package:flutter/material.dart';

enum ExpenseCategory {
  food("Food", Icons.restaurant),
  shopping("Shopping", Icons.shopping_bag),
  groceries("Groceries", Icons.local_grocery_store),
  electricity("Electricity Bill", Icons.electric_bolt),
  houseRent("House Rent", Icons.home),
  vehicleRent("Vehicle Rent", Icons.directions_car),
  entertainment("Entertainment", Icons.movie),
  medical("Medical", Icons.medical_services),
  cosmetic("Cosmetics", Icons.spa),
  other("Other", Icons.category);

  final String label;
  final IconData icon;

  const ExpenseCategory(this.label, this.icon);
}
