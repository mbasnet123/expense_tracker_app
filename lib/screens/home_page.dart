import 'package:expense_tracker_app/widgets/expenses_list.dart';
import 'package:expense_tracker_app/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expenses.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final List<Expenses> _registeredExpenses = [
    //   Expenses(title: "Refreshment", amount: 32.45, date: DateTime.now(),
    // category: Category.leisure);
    Expenses(
        title: "Refreshment",
        amount: 12.43,
        date: DateTime.now(),
        category: Category.leisure),

    Expenses(
        title: "Udemy courses",
        amount: 32.21,
        date: DateTime.now(),
        category: Category.work),
  ];

  void _openExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
          onAddExpense: _addExpense,
        ),
    );
  }

  void _addExpense(Expenses expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker App"),
        actions: [
          IconButton(
              onPressed: () {
                _openExpenseOverlay();
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Chart here"),
            Expanded(child: ExpenseList(expenses: _registeredExpenses)),
          ],
        ),
      ),
    );
  }
}
