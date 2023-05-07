import 'package:flutter_observer/utils/observer.dart';

abstract class Subject {
  void addObserver(Observer observer);
  void removeObserver(Observer observer);
  void notifyObservers();
}