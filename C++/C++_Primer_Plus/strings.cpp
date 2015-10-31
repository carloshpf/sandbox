#include <iostream>
#include <cstring>  // for the strlen()

int main() {
  using namespace std;

  const int Size = 15;
  char name1[Size]; // empty array
  char name2[Size] = "C++owboy"; // initialized array

  cout << "Howdy! I'm " << name2 << "! What's your name?\n";
  cin >> name1;
  cout << "Well, " << name1 << ", your name has " << strlen(name1) << " letters and is stored\n";
  cout << "in an array of " << sizeof(name1) << " bytes.\n";
  cout << "Your initial is " << name1[0] << ".\n";
  name2[3] = '\0';  // set to null character
  cout << "Here are the first 3 characters of my name: " << name2 << endl;
  return 0;
}