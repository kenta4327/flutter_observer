import 'package:flutter/material.dart';
import 'package:flutter_observer/utils/db_writer.dart';
import 'package:flutter_observer/utils/file_writer.dart';
import 'package:flutter_observer/utils/observer.dart';
import 'package:flutter_observer/utils/subject.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> implements Subject {
  int _counter = 0;
  final List<Observer> _observers = [];

  @override
  void addObserver(Observer observer) {
    _observers.add(observer);
  }

  @override
  void removeObserver(Observer observer) {
    _observers.remove(observer);
  }

  @override
  void notifyObservers() {
    for (final observer in _observers) {
      observer.update(_counter);
    }
  }

  @override
  void initState() {
    addObserver(FileWriter());
    addObserver(DbWriter());

    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      notifyObservers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
