import 'package:flutter_observer/utils/observer.dart';

class DbWriter implements Observer {
  @override
  void update(counter) {
    // とりあえずログ記載のみ行う
    print('$counter をDBに書き込み');
  }
}