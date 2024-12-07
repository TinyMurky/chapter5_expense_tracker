import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/models/expense.dart';
import 'package:chapter5_expense_tracker/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
      title: 'Flutter Course',
      date: DateTime.now(),
      amount: 19.9,
      category: Category.work,
    ),
    Expense(
      title: 'S.T.A.L.K.E.R',
      date: DateTime.now(),
      amount: 60.0,
      category: Category.leisure,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('hi'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
