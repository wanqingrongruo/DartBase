import 'dart:async';

main(List<String> args) async {
  print('Hello World');

  var nam = 'roni';
  const number = 26;
  final isBoy = true;

  String sex = 'boy';
  int age = 26;
  bool isGirl = false;

  // List
  var numbers = [1, 2, 3, 4];
  List<int> numberss = [2, 3, 4, 5];
  var el = numbers[0];
  print(el);
  numberss.add(99);
  print(numberss);

  // Set
  var numberSet = {1, 2, 3, 4};
  Set<int> numberSets = {2, 3, 4, 5};
  print(numberSet);

  // Map
  var iToS = {1: 'One', 2: 'Two'};
  Map<int, String> isToSs = {3: 'Three', 4: 'Four'};
  print(iToS);

  // 操作
  final nl = numbers.length;
  final na = numbers.add(0);
  final nr = numbers.remove(1);
  final nra = numbers.removeAt(2);
  final nc = numbers.contains(0);
  final mV = iToS[1];
  print(mV);
  final kv = iToS.entries;
  print(kv);
  final keys = iToS.keys;
  print(keys);
  final values = iToS.values;
  print(values);
  final mck = iToS.containsKey(1);
  print(mck);
  final mcv = iToS.containsValue('One');
  print(mcv);
  iToS.remove(1);
  print(iToS);
  print(adder(1, 7));
  print(adder02(2, 7));
  print(adder03(x: 3, y: 7));
  print(adder04(4, 7));

  Function mul2 = makeMul(2);
  print(mul2(3));

  if (el == 2) {
    print("I am 2");
  } else if (el == 3) {
    print("I am 3");
  } else {
    print("someone else");
  }

  switch (el) {
    case 2:
    case 3:
      print('-===');
      break;
    default:
      print('someone else');
  }

  try {
    divide(1, 0);
  } on IntegerDivisionByZeroException {
    print('Divide by 0');
  } finally {
    print('This block will always be executed.');
  }
// catch (e) {
//   print(e);
// }

  for (var i = 0; i < numbers.length; i++) {
    // do something
  }

  for (var num in numbers) {
    // do something
  }

  while (el < 10) {
    el++;
  }

  do {
    el++;
  } while (el < 10);

  // getEpisode(-1)
  //     .then((list) => print(list))
  //     .catchError((error) => print(error));

  try {
    var list = await getEpisode(-2);
  } catch (e) {
    print(e);
  }

  return 1;
}

int adder(int x, int y) {
  return x + y;
}

// 自动推导返回值
adder02(int x, int y) {
  return x + y;
}

// 参数 JSON 化, 有外部参数名, 调用时参数顺序不重要
adder03({int x, int y}) {
  return x + y;
}

// 箭头函数
int adder04(int x, int y) => x + y;

var echo = (int n) {
  print(n);
};
var echo02 = ({int n}) => print(n);

Function echo03 = ({int n}) => print(n);

Function makeMul(int n) {
  return (int i) => n * i;
}

double divide(double n, double m) {
  if (m == 0) {
    throw new IntegerDivisionByZeroException();
  }

  return n / m;
}

class Episode {
  int duration;
  String title;

  Episode(this.duration, this.title);

  Episode.latest(int duration, String title) {
    this.duration = duration;
    this.title = title;
  }

  Episode clone() => Episode(duration, title);
}

class WebM extends Episode with SupportedOpration {
  String codec;

  WebM(String codec, int duration, String title) : super(duration, title) {
    this.codec = codec;
  }
}

abstract class DeepCopy<T> {
  T clone();
}

class Episode02 implements DeepCopy<Episode02> {
  // ....
  Episode02 clone() => Episode02();
}

class Video with SupportedOpration implements Episode {
  int duration;
  String title;

  Video(this.duration, this.title);

  Video clone() {
    return Video(duration, title);
  }
}

mixin SupportedOpration {
  play() => print('====');
  next() => print('----');
}

Future<List<String>> getEpisode(int seriesId) {
  return new Future<List<String>>(() {
    if (seriesId <= 0) {
      throw new Exception('Series id should be greater than 0');
    }

    return ['lllll', "===="];
  });
}
