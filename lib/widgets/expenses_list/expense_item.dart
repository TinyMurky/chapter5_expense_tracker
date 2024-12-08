import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/models/expense.dart';

/// Widget used:
/// Card: https://api.flutter.dev/flutter/material/Card-class.html
/// Spacer: https://api.flutter.dev/flutter/widgets/Spacer-class.html
class ExpenseItem extends StatelessWidget {
  final Expense expense;
  ExpenseItem(this.expense, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(expense.categoryIcon),
                    const SizedBox(width: 4),
                    Text(expense.formattedDatetime),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
