library hold_detector;

import 'dart:async';
import 'package:flutter/material.dart';

class HoldDetector extends StatefulWidget {
  final Widget child;
  final VoidCallback onHold, onTap, onDoubleTap;
  final Duration duration;

  const HoldDetector(
      {Key key,
      @required this.child,
      @required this.duration,
      this.onHold,
      this.onTap,
      this.onDoubleTap})
      : super(key: key);

  @override
  _HoldDetectorState createState() => _HoldDetectorState();
}

class _HoldDetectorState extends State<HoldDetector> {
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (_) {
        _timer = Timer.periodic(widget.duration, (_) => widget.onHold());
      },
      onLongPressEnd: (_) => _timer.cancel(),
      onTap: widget.onTap,
      onDoubleTap: widget.onDoubleTap,
      child: widget.child,
    );
  }
}

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
