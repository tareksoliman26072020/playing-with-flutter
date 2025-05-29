import 'package:flutter/material.dart';
import 'menu_page.dart'; // will be implemented later

class MainPage extends StatelessWidget {
  MainPage({super.key});

  // For opening the drawer programmatically
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Default list of lifts; can be extended via another screen
  final List<String> _lifts = const [
    'Squat',
    'Bench Press',
    'Deadlift',
    'Overhead Press',
    'Barbell Row',
  ];

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = Theme.of(context).brightness;
    final Color backgroundColor =
        brightness == Brightness.dark ? Colors.black : Colors.white;
    final Color textColor =
        brightness == Brightness.dark ? Colors.white : Colors.black;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgroundColor,
      // Hidden drawer for the side menu
      drawer: Drawer(
        child: MenuPage(),
      ),
      body: SafeArea(
        child: ListView.separated(
          itemCount: _lifts.length,
          separatorBuilder: (_, __) => const Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.white, // very thin white line
          ),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // TODO: handle tap on lift[index]
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Row(
                  children: [
                    if (index == 0)
                      // top lift shows the menu icon
                      IconButton(
                        icon: Icon(Icons.menu, color: textColor),
                        onPressed: () =>
                            _scaffoldKey.currentState?.openDrawer(),
                      ),
                    // lift title
                    Expanded(
                      child: Text(
                        _lifts[index],
                        style: TextStyle(
                          fontSize: 18,
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

