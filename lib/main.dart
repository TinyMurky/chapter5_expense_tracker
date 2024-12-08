import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/widgets/expenses.dart';

const ExpenseTrackerApp = MaterialApp(
  home: Expenses(),
);

void main() {
  runApp(ExpenseTrackerApp);
}
