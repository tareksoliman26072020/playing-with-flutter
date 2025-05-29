import 'package:flutter/material.dart';

class Set1RMMaxesPage extends StatefulWidget {
  const Set1RMMaxesPage({super.key});

  @override
  Set1RMMaxesPageState createState() => Set1RMMaxesPageState();
}

class Set1RMMaxesPageState extends State<Set1RMMaxesPage> {
  // List of standard lifts
  final List<String> _lifts = [
    'Squat',
    'Bench Press',
    'Deadlift',
    'Overhead Press',
    'Barbell Row',
  ];

  // Controllers to capture user input
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    for (var lift in _lifts) {
      _controllers[lift] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyLarge?.color;
    final backgroundColor = theme.scaffoldBackgroundColor;
    final boxColor = theme.colorScheme.primaryContainer;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Set 1RM Maxes',
          style: theme.textTheme.titleLarge,
        ),
        backgroundColor: backgroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      backgroundColor: backgroundColor,
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: _lifts.length,
        separatorBuilder: (context, index) => Divider(color: theme.dividerColor),
        itemBuilder: (context, index) {
          final lift = _lifts[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lift,
                  style: theme.textTheme.bodyLarge,
                ),
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _controllers[lift],
                    keyboardType: TextInputType.number,
                    style: theme.textTheme.bodyLarge,
                    decoration: InputDecoration(
                      suffixText: 'kg',
                      filled: true,
                      fillColor: boxColor,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
