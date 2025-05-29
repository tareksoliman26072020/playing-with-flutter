import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'lift_page.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // scaffold key to open the drawer
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // default lift list
  static const List<String> _lifts = [
    'Squat',
    'Bench Press',
    'Deadlift',
    'Overhead Press',
    'Barbell Row',
  ];

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final bgColor =
        brightness == Brightness.dark ? Colors.black : Colors.white;
    final textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: bgColor,
      drawer: const Drawer(child: MenuPage()),
      body: SafeArea(
        child: ListView.separated(
          itemCount: _lifts.length + 1, // +1 for header
          separatorBuilder: (_, __) =>
              const Divider(height: 1, thickness: 0.5, color: Colors.white),
          itemBuilder: (context, index) {
            // Header row
            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, color: textColor),
                      onPressed: () =>
                          _scaffoldKey.currentState?.openDrawer(),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Select Lift',
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            // Lift rows
            final lift = _lifts[index - 1];
            return InkWell(
              onTap: () {
                // Navigate to your LiftPage (week view) for this lift
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LiftPage(liftName: lift),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  lift,
                  style: TextStyle(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

