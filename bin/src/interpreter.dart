import 'lexer.dart';

class Interpreter {
  final String text;
  Interpreter(this.text);
  work() {
    Lexer lexer = Lexer(text);
    List tokens = lexer.tokenization();
    if (tokens.length == 3) {
      if (tokens[1][0] == 'ADD') {
        try {
          int left = int.parse(tokens[0][1]);
          int right = int.parse(tokens[2][1]);
          int result = left + right;
          return result;
        } catch (e) {
          return '${tokens[0][1]}${tokens[2][1]}';
        }
      } else if (tokens[1][0] == 'SUB') {
        try {
          int left = int.parse(tokens[0][1]);
          int right = int.parse(tokens[2][1]);
          int result = left - right;
          return result;
        } catch (e) {
          return ':( Error Invalid syntax';
        }
      } else if (tokens[1][0] == 'DIV') {
        try {
          int left = int.parse(tokens[0][1]);
          int right = int.parse(tokens[2][1]);
          if (right == 0) {
            return '$left/$right impossible';
          } else {
            int result = left ~/ right;
            return result;
          }
        } catch (e) {
          return ':( Error Invalid syntax';
        }
      }
      if (tokens[1][0] == 'DEC_DIV') {
        try {
          int left = int.parse(tokens[0][1]);
          int right = int.parse(tokens[2][1]);
          if (right == 0) {
            return '$left/$right impossible';
          } else {
            double result = left / right;
            return result;
          }
        } catch (e) {
          return ':( Error Invalid syntax';
        }
      } else if (tokens[1][0] == 'MUL') {
        try {
          int left = int.parse(tokens[0][1]);
          int right = int.parse(tokens[2][1]);
          int result = left * right;
          return result;
        } catch (e) {
          return ':( Error Invalid syntax';
        }
      } else {
        return ':( UNKOWN OPERATOR';
      }
    } else if (tokens.length == 1) {
      if (tokens[0][0] == 'OPERATION') {
        return 'Avilabe operations\naddition(+)\nsubtration(-)\nmultiplication(x)\ndivisions of two numbers';
      } else {
        return tokens[0][1];
      }
    } else {
      return 'Shit Interpreter bruh!!\nUse like this dude [Number] [+,-,/,%,x] [Number]';
    }
  }
}
