import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/widgets/expenses.dart';

const expenseTrackerApp = MaterialApp(
  home: Expenses(),
);

void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Expenses(),
      theme: ThemeData(
          datePickerTheme: const DatePickerThemeData(
            // 預設date picker大小
            headerHeadlineStyle: TextStyle(fontSize: 12),
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 12),
            bodyMedium: TextStyle(fontSize: 10),
            bodySmall: TextStyle(fontSize: 8),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 10.0), // 設定文字大小
            ),
          ))),
    );
  }
}
