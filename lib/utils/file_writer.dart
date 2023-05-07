import 'package:flutter_observer/utils/observer.dart';

class FileWriter implements Observer {
  @override
  void update(counter) {
    // とりあえずログ記載のみ行う
    print('$counter をファイルに書き込み');
  }
}