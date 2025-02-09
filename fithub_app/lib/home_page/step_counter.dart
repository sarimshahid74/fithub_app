import 'package:flutter/material.dart';
import 'package:pedometer/pedometer.dart';

class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  int _stepCount = 0;
  late Stream<StepCount> _stepCountStream;

  @override
  void initState() {
    super.initState();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen((StepCount event) {
      setState(() {
        _stepCount = event.steps;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Step Counter')),
      body: Center(
        child: Text('Steps: $_stepCount', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
