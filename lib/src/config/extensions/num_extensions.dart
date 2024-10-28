extension NumExtension on num? {
  String convertToPercentageString() {
    return ((this ?? 0) * 10).toStringAsFixed(0) + ' %';
  }

  double denominate({required int? denominator}) {
    return ((this ?? 0.0) / (denominator ?? 1)).toDouble();
  }


}
