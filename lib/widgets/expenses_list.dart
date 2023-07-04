import 'package:expense_tracker_app/models/expenses.dart';
import 'package:expense_tracker_app/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {required this.expenses, super.key, required this.onRemoveExpenses});

  final List<Expenses> expenses;
  final void Function(Expenses expense) onRemoveExpenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) {
            onRemoveExpenses(expenses[index]);
          },
            key: ValueKey(expenses[index]),
            child: ExpenseItem(expenses[index]));
      },
    );
  }
}
