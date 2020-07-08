import 'dart:io';

import 'src/interpreter.dart';

void main() {
  String _author = 'n4ze3m';
  String _shit_interpreter =
      '''Shit Interpreter [0.0.1] Only for small maths operation :: $_author, on ${Platform.operatingSystem}
  ''';
  stdout.write('$_shit_interpreter\n');
  while (true) {
    stdout.write(">>> ");
    var text = stdin.readLineSync();
    if (text.isEmpty) {
      continue;
    } else {
      Interpreter interpreter = Interpreter(text);
      var result = interpreter.work();
      stdout.write('$result\n');
    }
  }
}