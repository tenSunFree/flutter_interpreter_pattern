import 'package:flutter_interpreter_pattern/home/interpret/interpret.dart';
import 'package:flutter_interpreter_pattern/home/model/home_model.dart';

class AddInterpret implements Interpret {
  final Interpret leftExpression;
  final Interpret rightExpression;

  const AddInterpret(this.leftExpression, this.rightExpression);

  @override
  int interpret(HomeModel model) {
    final left = leftExpression.interpret(model);
    final right = rightExpression.interpret(model);
    final result = left + right;
    model.addContent(right);
    return result;
  }
}
