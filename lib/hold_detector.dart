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
