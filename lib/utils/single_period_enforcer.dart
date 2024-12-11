import 'package:flutter/services.dart';

/// https://medium.com/@gabrieloranekwu/number-input-on-flutter-textfields-the-right-way-06441f7b5550
/// 強迫TextField input 只能有一個小數點
class SinglePeriodEnforcer extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if ('.'.allMatches(newText).length <= 1) {
      return newValue;
    }

    return oldValue;
  }
}
