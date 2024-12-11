import 'package:chapter5_expense_tracker/utils/single_period_enforcer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chapter5_expense_tracker/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  /// 它可以像是react 一樣，用string儲存變動值
  /// String _expenseTitle = '';
  /// onChanged: (String value) { (放在textField)
  ///   expenseTitle = value;
  ///   print(_expenseTitle);
  /// },

  /// 也可以用flutter優話好的 TextEditingController
  /// https://docs.flutter.dev/cookbook/forms/text-field-changes
  /// 但記得一定要在dispose 裡面把它刪掉，不然會一直存在記憶體裡面

  final _expenseTitleController = TextEditingController();

  /// 數字版本請看：
  /// https://medium.com/@gabrieloranekwu/number-input-on-flutter-textfields-the-right-way-06441f7b5550
  final _expenseAmountController = TextEditingController();

  // final _expenseCategoryController = TextEditingController();

  DateTime? _userChosenDateTime;
  Category _userChosenCategory = Category.leisure;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final oneYearBeforeNow = DateTime(now.year - 1, now.month, now.day);

    /// showDatePicker會打開選日期的彈窗，還川 Future<DateTime>
    final userChosenDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: oneYearBeforeNow,
      lastDate: now,
    );
    setState(() {
      _userChosenDateTime = userChosenDate;
    });
  }

  void _summitExpense() {
    // 當東西還沒有填完的時候要先檢查，通過才做動作
    final title = _expenseTitleController.text.trim();
    final isTitleValid = title.isNotEmpty;

    final amount = double.tryParse(_expenseAmountController.text);
    final isAmountValid = amount != null && amount > 0;

    final isDateTimeValid = _userChosenDateTime != null;

    if (!(isTitleValid && isAmountValid && isDateTimeValid)) {
      // context 從 State 的context傳入
      // ctx也是context但是是function所以叫做不同名稱

      showDialog(
          context: context,
          builder: (BuildContext ctx) => AlertDialog(
                title: const Text('Invalid input'),
                content: const Text('Please enter amount, time and title'),
                // The (optional) set of actions that are displayed at the bottom of the dialog with an [OverflowBar].
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text("Okey"),
                  )
                ],
              ));
      return; // return 跳出
    }

    final newExpense = Expense(
      date: _userChosenDateTime!,
      title: title,
      amount: amount,
      category: _userChosenCategory,
    );
    widget.onAddExpense(newExpense);

    Navigator.pop(context);
    return;
  }

  /// 只有stateful widget 才會有 dispose
  @override
  void dispose() {
    _expenseTitleController.dispose();
    _expenseAmountController.dispose();
    super.dispose(); // 固定要加的值
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            controller: _expenseTitleController,
            maxLength: 50,
            keyboardType: TextInputType.text,
            style: const TextStyle(fontSize: 12),
            decoration: const InputDecoration(
              // border: OutlineInputBorder(),
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              // Row裡面的TextField請記得一定要加Expanded
              // 因為TextField會無限寬
              Expanded(
                child: TextField(
                  controller: _expenseAmountController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[\d\.]')),

                    /// 只有 點點或數字可以
                    SinglePeriodEnforcer(), // 只可以有一個點
                  ],
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  // maxLength: 20,
                  style: const TextStyle(fontSize: 12),
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    // border: OutlineInputBorder(),
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // 把Select date區塊推到最右邊
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(_userChosenDateTime != null
                      ? formatter.format(_userChosenDateTime!)
                      : 'Select Date'),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // DropdownMenu<Category>(
              //   initialSelection: Category.leisure,
              //   controller: _expenseCategoryController,
              //   label: const Text('Category'),
              //   // onSelected: (Category? category) {
              //   //   if (category == null) {
              //   //     return;
              //   //   }
              //   //   setState(() {

              //   //   });
              //   // },
              //   dropdownMenuEntries: Category.values
              //       .map((category) => DropdownMenuEntry(
              //             value: category,
              //             label: category.name.toUpperCase(),
              //           ))
              //       .toList(),
              // ),
              DropdownButton<Category>(
                value: _userChosenCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem<Category>(
                    value: category,
                    child: Text(category.name.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium),
                  );
                }).toList(),
                onChanged: (Category? category) {
                  if (category == null) {
                    return;
                  }

                  setState(() {
                    _userChosenCategory = category;
                  });
                },
              ),
              const SizedBox(width: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end, // 把Select date區塊推到最右邊
                children: [
                  ElevatedButton(
                    onPressed: _summitExpense,
                    child: const Text('Send'),
                  ),
                  const SizedBox(width: 4),
                  ElevatedButton(
                    onPressed: () {
                      _expenseTitleController.clear();
                      _expenseAmountController.clear();
                      Navigator.pop(context); // pop可以跳出道上一層 (沒有model)
                    },
                    child: const Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
