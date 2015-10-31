// precision problems with float
#include <iostream>

int main() {

  float a = 2.34E22f; // type float can represent only the first 6 or 7 digits, trying to change the 23rd digit has no effect
  float b = a + 1.0f;

  std::cout << "a = " << a << std::endl;
  std::cout << "b - a = " << b - a << std::endl;
  return 0;
}