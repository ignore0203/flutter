void main() {
  List<String> lists = [];
  List<String>? lists1;

  lists = ['Apple','Banana'];
  for(int i = 0; i<lists.length; i++){
    print('lists의 값: ${lists[i]}');
  }

  var arr = [1,2,3];
  List<int> lists2 = List.from(arr);

  lists2.forEach((item){
    print('값: ${item}');
  });

  lists2.add(4);

  var a1 = lists2.map(
      (item) => 1000+item
  );

  a1.forEach((item) {
    print('값: ${item}');
  });

  a1.forEach(print);

  final List<int> tears = List.generate(30, (index) => 1984+ index);
  tears.forEach(print);

}