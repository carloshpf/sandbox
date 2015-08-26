#include <iostream>

int main(void) {
  char ch = 'M';  // assign ASCII code for M to ch
  int i = ch;     // store same code in an int
  std::cout << "The ASCII code for " << ch << " is " << i << std::endl;

  std::cout << "Add one to character code:" << std::endl;
  ch++; // change character code in ch
  i = ch; // save new character code in i
  std::cout << "The ASCII code for " << ch << " is " << i << std::endl;

  // using the cout.put() member function to display a char
  std::cout << "Displaying char ch using cout.put(ch): ";
  std::cout.put(ch);

  // using cout.put() to display a char contant
  std::cout.put('!');

  // test with cout.put
  std::cout.put(1);

  std::cout << std::endl << "Done!" << std::endl;

  return 0;
}