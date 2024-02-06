class HomerRepo {
  int result= 0;

  void checkAndResetresult() {
    if (result == 3) {
      result = 0;
    }
  }

  bool check(int num1, int num2) {
    if (num1 == num2) {
      result++;
      checkAndResetresult();
      return true;
    }
    return false;
  }
}
