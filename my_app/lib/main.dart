import 'package:flutter/material.dart';
//asdfasdsad
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
          initialRoute: '/',
          routes: {
              '/':     (ctx) => HomeScreen(),
              '/about':(ctx) => AboutScreen(),
          },
      );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Route')),
      body: Center(
        child: ElevatedButton(
          key: const Key('toAbout'),
          onPressed: () => Navigator.pushNamed(context, '/about'),
          child: const Text('Go to About'),
        ),
      ),
    );
  }
}

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Route')),
      body: Center(
        child: ElevatedButton(
          key: const Key('toHome'),
          onPressed: () => Navigator.pop(context),
          child: const Text('Back to Home'),
        ),
      ),
    );
  }
}
