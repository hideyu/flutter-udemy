import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  // task2が終わるまでtask3の処理を待つ
  String task2Result = await task2(); // task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

// 時間がかかる処理: 返り値の型がFuture、定義にasync、時間がかかる処理にawait
Future task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String result;

  // 3秒かかる処理
  await Future.delayed(threeSeconds, () {
    result = 'task 2 data';
    print('Task 2 complete');
  });

  // ３秒かかる処理から出てくる文字列
  return result;
}

// 一つ前の3秒かかる処理から出てくる返り値を使う処理
void task3(String task2Data) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Data');
}
