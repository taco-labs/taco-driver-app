// Automatic FlutterFlow imports
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';

// Begin custom widget code
class CallWaitingIndicator extends StatefulWidget {
  const CallWaitingIndicator({
    Key? key,
    this.width,
    this.height,
    required this.color,
    required this.strokeWidth,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color color;
  final double strokeWidth;

  @override
  _CallWaitingIndicatorState createState() => _CallWaitingIndicatorState();
}

class _CallWaitingIndicatorState extends State<CallWaitingIndicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(widget.color),
        strokeWidth: widget.strokeWidth,
      ),
    );
  }
}
