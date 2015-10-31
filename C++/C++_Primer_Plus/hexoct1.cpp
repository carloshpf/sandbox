#include <iostream>

int main() {
  using namespace std;
  int chest = 42;   // decimal integer literal
  int waist = 0x42; // hexadecimal integer literal
  int inseam = 042; // octal integer literal

  cout << "Monsieur cuts a striking figure!\n";
  cout << "chest = " << chest << " (42 in decimal)\n";
  cout << "waist = " << waist << " (0x42 in hex)\n";
  cout << "inseam = " << inseam << " (042 in octal)\n";

  int chest2 = 42;
  int waist2 = 42;
  int inseam2 = 42;

  cout << "chest = " << chest2 << " (decimal for 42)" << endl;
  cout << hex;  // manipulator for changing number base
  cout << "waist = " << waist2 << " (hexadecimal for 42)" << endl;
  cout << oct;  // manipulator for changing number base
  cout << "inseam = " << inseam2 << " (octal for 42)" << endl;

  return 0;
}