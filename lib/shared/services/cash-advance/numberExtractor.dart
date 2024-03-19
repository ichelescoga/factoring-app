String? extractNumber(String input) {
  RegExp regex = RegExp(r'[\d.,]+');
  String? match = regex.stringMatch(input);

  if (match != null) {
    match = match.replaceAll(RegExp(r'[^\d.]'), '');
    return match;
  }

  return null;
}
