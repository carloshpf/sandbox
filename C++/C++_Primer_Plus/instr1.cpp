#include <iostream>

int main() {
  using namespace std;
  const int ArSize = 20;
  char name[ArSize];
  char dessert[ArSize];

  cout << "Enter your name:\n";
  cin >> name;  // reads until space.. so, if you use two words, the second will be in the queue and will go to dessert
  cout << "Enter your favorite dessert:\n";
  cin >> dessert; 
  cout << "I have some delicious " << dessert << " for you " << name << endl;
  return 0;
}