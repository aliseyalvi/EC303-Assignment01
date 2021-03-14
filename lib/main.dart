/// Flutter code sample for Scaffold

// This example shows a [Scaffold] with a [body] and [FloatingActionButton].
// The [body] is a [Text] placed in a [Center] in order to center the text
// within the [Scaffold]. The [FloatingActionButton] is connected to a
// callback that increments a counter.
//
// ![The Scaffold has a white background with a blue AppBar at the top. A blue FloatingActionButton is positioned at the bottom right corner of the Scaffold.](https://flutter.github.io/assets-for-api-docs/assets/material/scaffold.png)

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Left',),
                Tab(text: 'Middle',),
                Tab(text: 'Right',),
              ],
            ),
            title: Text('Tabs'),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('Left')),
              Center(child: Text('Middle')),
              Center(child: Text('Right')),
            ],
          ),
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
      drawer: HomeDrawer(),
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
      drawer: HomeDrawer(),
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
      drawer: HomeDrawer(),
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
      drawer: HomeDrawer(),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
      Container(
        padding: EdgeInsets.only(top: 24, left: 8, right: 8, bottom: 16),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.network(
                'https://i.pinimg.com/736x/3f/94/70/3f9470b34a8e3f526dbdb022f9f19cf7.jpg',
                width: 80,
                height: 80,
                fit: BoxFit.fill,
              ),
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Sadaqat Ali\n",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      color: Colors.black87)),
              TextSpan(
                  text: "sali.bscs17seecs@seecs.edu.pk",
                  style: TextStyle(
                      fontFamily: 'Montserrat', color: Colors.black54)),
            ]))
          ],
        ),
      ),
      Divider(
        height: 1,
        thickness: 1,
        color: Colors.blueGrey[900],
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              dense: true,
              title: Text(
                "Home",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pushNamed(context, "/");
              },
            ),
            ListTile(
              dense: true,
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              title: Text(
                "Notifications",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(Icons.notifications),
              onTap: () {
                Navigator.pushNamed(context, "/notifications");
              },
            ),
            ListTile(
              dense: true,
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.black),
              ),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pushNamed(context, "/settings");
              },
            ),
          ],
        ),
      ),
    ]));
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      drawer: HomeDrawer(),
      body: Center(child: Text('You have pressed the button $_count times.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _count++),
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
    );
  }
}
