#include <iostream>

int main() {
  std::cout << "Enter your age: ";
  int age;
  std::cin >> age;
  std::cout << "\nYour age in months is " << age * 12 << "\n";
  return 0; 
}