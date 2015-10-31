#include <iostream>

int main() {
  using namespace std;
  int yams[3];  // creates array with three elements
  yams[0] = 7;  // assign value to first element
  yams[1] = 8;
  yams[2] = 6;

  int yamcosts[3] = {20, 30, 6};  // create, initialize array

  cout << "Total yams = " << yams[0] + yams[1] + yams[2] << endl;
  cout << "The package with " << yams[1] << " yams costs " << yamcosts[1] << " cents per yam." << endl;
  // ...

  cout << "\nSize of yams array = " << sizeof yams << " bytes.\n";
  cout << "Size of one element = " << sizeof yams[0] << " bytes.\n";

  return 0;
}