import 'dart:math';

class RoundHelper {
  static double round(double number, int precision) {
    final double auxRoundNumber = pow(10, precision).toDouble();
    return ((number * auxRoundNumber).roundToDouble()) / auxRoundNumber;
  }
}
