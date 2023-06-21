import 'package:flutter/material.dart';

import '../models/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expenses, {super.key});

  final Expenses expenses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Column(
          children: [
            Text(expenses.title),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Row(
                children: [
                  Text('\$${expenses.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Icon(categoryIcons[expenses.category]),
                  Text(expenses.date.toString()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
