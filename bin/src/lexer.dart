class Lexer {
  final String text;
  int current_index = 0;
  Lexer(this.text);

  tokenization() {
    List tokens = [];
    List<String> splitCode = [];
    RegExp r = RegExp(r"(\S+)([\s]+|$)");
    var matches = r.allMatches(this.text);
    matches.toList().asMap().forEach((i, m) => splitCode.add(m.group(1)));
    while (this.current_index < splitCode.length) {
      String exp = splitCode[this.current_index];
      if (exp.contains(RegExp(r'[0-9]'))) {
        tokens.add(['NUMBER', exp]);
      } else if (exp.contains('+')) {
        tokens.add(['ADD', exp]);
      } else if (exp.contains('-')) {
        tokens.add(['SUB', exp]);
      } else if (exp == '/') {
        tokens.add(['DIV', exp]);
      } else if (exp == '/.') {
        tokens.add(['DEC_DIV', exp]);
      } else if (exp.contains('x') || exp.contains('*')) {
        tokens.add(['MUL', exp]);
      } else if (exp == 'avil') {
        tokens.add(['OPERATION', exp]);
      } else {
        tokens.add(['UNKNOWN', exp]);
      }
      this.current_index++;
    }
    return tokens;
  }
}
