#include <iostream>

int main() {
  using namespace std;
  cout << "What year was your house built?\n";
  int year;
  cin >> year;  // when cin reads the year, it leaves the newline generated by Enter in the input queue (cin only gets a word)
  //cin.get();
  // or you can concatenate
  //(cin  >> year).get();
  cout << "What is its street address?\n";
  char address[80];
  cin.getline(address, 80); // cin.getline() reads the newline as an empty line 
  cout << "Year built: " << year << endl;
  cout << "Address: " << address << endl;
  cout << "Done!\n";
  return 0;
}