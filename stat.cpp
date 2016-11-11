#include <iostream>
#include <map>
using namespace std;

int main() {
  map<string, int> ss;
  string s1, s2, s3, s4, s5;
  while (cin >> s1 >> s2 >> s3 >> s4 >> s5) {
    if (!ss[s5]) {
      ss[s5] = 1;
      cout << s5 << endl;
    }
  }
  return 0;
}