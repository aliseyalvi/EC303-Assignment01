
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  List<Widget> _widgets = [HomeScreen(), ProfileScreen(), NotificationScreen(),SettingsScreen()];
  tapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _widgets[index],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: tapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: new Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: new Icon(Icons.notifications),label: 'Notifications'),
            BottomNavigationBarItem(icon: new Icon(Icons.settings),label: 'Settings'),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Text('Profile Screen'),
      ),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Screen'),
      ),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Screen'),
      ),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

