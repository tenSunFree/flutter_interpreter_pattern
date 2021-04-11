import 'dart:collection';
import 'package:flutter_interpreter_pattern/home/interpret/add_interpret.dart';
import 'package:flutter_interpreter_pattern/home/interpret/number_interpret.dart';
import 'interpret.dart';

class InterpretHelpers {
  const InterpretHelpers._();

  static Interpret buildInterpretTree(String postfixExpression) {
    final interpretStack = ListQueue<Interpret>();
    Interpret interpret = NumberInterpret(int.parse('0'));
    for (final symbol in postfixExpression.split(' ')) {
      final addInterpret =
          AddInterpret(interpret, NumberInterpret(int.parse(symbol)));
      interpretStack.addLast(addInterpret);
      interpret = addInterpret;
    }
    return interpretStack.last;
  }
}
