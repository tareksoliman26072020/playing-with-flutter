import 'package:flutter/material.dart';

class LiftPage extends StatelessWidget {
  const LiftPage({super.key, required this.liftName});

  final String liftName;
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Center(child: Text('Hello World')),
    );
  }
}
