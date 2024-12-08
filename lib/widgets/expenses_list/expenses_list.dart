import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/models/expense.dart';
import 'package:chapter5_expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;

  const ExpensesList({
    super.key,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    // list view 可以在快要渲染石材build widget, 就不會造成效能的浪費
    // idem builder 要回傳function, 吃 builderContext 和 index
    // 回傳widget
    // itemCount要傳最多有多少個
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, idx) => ExpenseItem(expenses[idx]),
    );
  }
}
