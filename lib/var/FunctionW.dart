void main() {
  print('실행 check');

  int result = addPlus(1000, 333);
  print('result: ${result}');

  int result2 = addPlus2(
    num1: 10,
    num2: 300
  );
  print('result2: ${result2}');

  int result3 = addPlus2(
    num2: 500,
    num1: 10
  );
  print('result3: ${result3}');

  int result4 =  defaultPlus(200,200);
  print('result4: ${result4}');

  int result5 = defaultPlus(100);
  print('result5: ${result5}');

  int result6 = defaultPlus2(num1: 123, num2: 321, num3: 100);
  print('result6: ${result6}');

  int result7 = defaultPlus2(num1: 123, num2: 321);
  print('result7: ${result7}');
}

int addPlus(int num1, int num2) {
  return num1+num2;
}

int addPlus2(
{
  required int num1,
  required int num2
}
    ) {
  print('num1: ${num1}');
  return num1+num2;
}

int defaultPlus(
int num1, [int num2 = 1000]
){
  return num1 + num2;
}

int defaultPlus2(
{
  required int num1,
  required int num2,
  int num3 = 0
}
){
  return num1 + num2 + num3;
}

