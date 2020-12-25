# hold_detector

A Simple Widget Which Detects The Holding Gesture.

## Getting Started

Just import the package and use it. :tw-1f61c:

## Usage

The `onHold` parameter takes a function that is called periodically after every `duration`.

The `duration` parameter is used as delay between calling two `onHold` functions.

The `onTap` and `onDoubleTap` are extra functions that you can use if you need.

##Example

```dart
import 'package:flutter/material.dart';
import 'package:hold_detector/hold_detector.dart';

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  void _decrement() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HoldDetector(
      child: ListTile(
        title: Text("$_counter"),
        subtitle: Text("Hold or Tap to Increment & Double Tap to Decrement."),
      ),
      duration: Duration(seconds: 1),
      onHold: _increment,
      onTap: _increment,
      onDoubleTap: _decrement,
    );
  }
}
```
