void main(){
  fizzbuzztest();
}
void fizzbuzztest() {
  print("hello");
  var list = [];
  for(int i = 1; i <= 100; i++){
    list.add(i);
  }
  print("Чистый массив: $list");

  for (int i = 1; i < 100; i++){
    if (list[i] % 3 == 0 && list[i] % 5 == 0){
      list[i] = "FizzBuzz";
    }
    else if (list[i] % 3 == 0) {
      list[i] = "Fizz";
    }
    else if (list[i] % 5 == 0) {
      list[i] = "Buzz";
    }
  }
  print("Измененный массив: $list");
}
