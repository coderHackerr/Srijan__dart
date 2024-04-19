import 'dart:math';

class MathUtils {
  static double squareRoot(double number) {
    return sqrt(number);
  }

  static int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  static num power(double base, double exponent) {
    return pow(base, exponent);
  }
}

void main() {
  // Usage of static methods without creating an instance of MathUtils class
  double number = 16;
  print('Square root of $number: ${MathUtils.squareRoot(number)}');

  int n = 5;
  print('Factorial of $n: ${MathUtils.factorial(n)}');

  double base = 2;
  double exponent = 3;
  print('Power of $base raised to $exponent: ${MathUtils.power(base, exponent)}');
}
