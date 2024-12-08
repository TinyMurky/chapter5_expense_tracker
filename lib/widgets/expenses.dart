import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/models/expense.dart';
import 'package:chapter5_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:chapter5_expense_tracker/widgets/new_expense.dart';

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

  /// used when press + sign on top of appBar
  void _openAddExpenseOverlay() {
    /// 這個會顯示從下面彈出來的model
    /// - context 是 `State<T>` 父class原生會有的值
    /// builder 裡面傳function, 輸入值也是一個context, 用ctx避免搞混
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext ctx) => const NewExpense(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          style: TextStyle(fontSize: 12),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ExpensesList(expenses: _registeredExpense),
          ),
        ],
      ),
    );
  }
}
