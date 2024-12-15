import 'package:flutter/material.dart';

import 'package:chapter5_expense_tracker/models/expense.dart';
import 'package:chapter5_expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveFunction,
  });

  final List<Expense> expenses;

  final void Function(Expense expense)
      onRemoveFunction; // Flutter要remove一個值的時候，可以直接填要remove哪的object,不用用index

  @override
  Widget build(BuildContext context) {
    // list view 可以在快要渲染時才build widget, 就不會造成效能的浪費
    // idem builder 要回傳function, 吃 builderContext 和 index
    // 回傳widget
    // itemCount要傳最多有多少個
    return ListView.builder(
      itemCount: expenses.length,
      // Dismissible 讓一個物件可以從左邊滑或右邊滑產生效果
      // key 請看 https://ithelp.ithome.com.tw/articles/10295709
      itemBuilder: (ctx, idx) => Dismissible(
        key: ValueKey(expenses[idx]),
        child: ExpenseItem(expenses[idx]),
        onDismissed: (DismissDirection direction) {
          // direction 分成左邊或右邊，這邊先寫成不管哪邊都可以
          // 把widget從畫面上滑掉並不會從 expenses list中去除，記得一定要用function除
          onRemoveFunction(expenses[idx]);
        },
      ),
    );
  }
}
