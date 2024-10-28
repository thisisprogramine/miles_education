extension StringExtension on String {
  String intelliTrim() {
    return this.length > 15 ? '${this.substring(0, 15)}...' : this;
  }

  String total() {
    String inputString = this;

    List<int> integerList = inputString
        .split(',') // Split the string by commas
        .where((s) => s.isNotEmpty) // Filter out empty strings
        .map((s) =>
            int.tryParse(s) ??
            0) // Convert to integers (default to 0 if parsing fails)
        .toList();

    return integerList.isNotEmpty
        ? integerList.reduce((value, element) => value + element).toString()
        : '0';
  }

  String stealth(bool value) => value ? "∗∗∗" : this;
}
