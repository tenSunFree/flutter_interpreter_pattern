import 'package:flutter_interpreter_pattern/home/interpret/interpret.dart';
import 'package:flutter_interpreter_pattern/home/model/home_model.dart';

class NumberInterpret implements Interpret {
  final int number;

  const NumberInterpret(this.number);

  @override
  int interpret(HomeModel context) {
    return number;
  }
}
