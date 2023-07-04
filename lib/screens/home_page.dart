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
      isScrollControlled: true,
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

  void _removeExpense(Expenses expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: const Text("Item deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: (){
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No items added yat"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registeredExpenses,
        onRemoveExpenses: _removeExpense,
      );
    }
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
            Expanded(
              child: mainContent,
            ),
          ],
        ),
      ),
    );
  }
}
